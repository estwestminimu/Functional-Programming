{-# LANGUAGE DeriveGeneric #-}
{-
pstatni argument typ zwracany a wyszostko przed nim to jest argumenty przyjowamy
 [Int] -> [Int] -> [Int]

Nazwy konstrutkorow z duzej sum i srot zarezerwoane

uncury do zamieniania w pary
-}
-- Dyrektywy kompilatora
{-# LANGUAGE OverloadedStrings #-}

-- osbługa json
-- automatycznie tworze instacje json

-- Zadanie 7
-- qualified oznacza ze wszystko zostanie poprzedzone

import Control.Monad (replicateM)
import qualified Control.Monad.State as Monad
import Data.Aeson (FromJSON, ToJSON, object, (.=))
import Data.IORef -- chce zapisywac dane miedzy endpoint
import GHC.Generics (Generic)
import Web.Scotty

data SortData = SortData
  { operator :: String,
    value :: [Int]
    -- show do konwersji na napisu
    -- bez generic aeson sie gubi
  }
  deriving (Show, Generic)

data SumData = SumData
  { value1 :: [Int],
    value2 :: [Int],
    value3 :: [Int]
  }
  deriving (Show, Generic)

-- konwersja miedzy typami
instance FromJSON SortData

instance ToJSON SortData

instance FromJSON SumData

instance ToJSON SumData

sumList :: [Int] -> [Int] -> [Int]
-- ide zgłasza ostrzeżenie przy map i zip
-- map (uncurry (+)) zip x y
sumList = zipWith (+)

-- dostajemy string nastepnie int i odpowiadamy tru false
issorted :: String -> [Int] -> Bool
issorted x list =
  let compare = case x of
        "<=" -> (<=)
        ">=" -> (>=)
        ">" -> (>)
        "<" -> (<)

      y = zip list (tail list)
   in -- cabal szponci bez uncurry compare
      all (uncurry compare) y

-- kolejny zestaw 7

type Rand a = Monad.State Int a

nextRand :: Rand Int
nextRand = do
  seed <- Monad.get
  let a = 1103515245
      c = 12345
      m = 2147483648
      seed' = abs (a * seed + c) -- Nie dodaje modulo bo overflow w haskellu dziala tak samo dla int`mod` m ale wlica max
  Monad.put seed'
  return seed'

-- 3.5

nextRandDouble :: Rand Double
nextRandDouble = do
  seed <- Monad.get
  let a = 1103515245
      c = 12345
      m = 2147483648
      seed' = abs ((a * seed + c) `mod` m)
  Monad.put seed'
  return (fromIntegral seed' / fromIntegral m)

-- 4.0
funIntDouble :: Rand (Int, Double)
funIntDouble = do
  x <- nextRand
  y <- nextRandDouble
  return (x, y)

funDoubleInt :: Rand (Double, Int)
funDoubleInt = do
  x <- nextRand
  y <- nextRandDouble
  return (y, x)

funDoubleDoubleDouble :: Rand (Double, Double, Double)
funDoubleDoubleDouble = do
  x <- nextRandDouble
  y <- nextRandDouble
  z <- nextRandDouble
  return (x, y, z)

--

addFun :: Int -> Int -> Int
addFun x y = x + y

data SumMap = SumMap
  { numberA :: Maybe Int,
    numberB :: Maybe Int
  }
  deriving (Show, Generic)

instance FromJSON SumMap
instance ToJSON SumMap

-- nazwy zmienione bo sie kloca z innymi
data SMaybe a = SNothing | SJust a

instance Functor SMaybe where
  fmap _ SNothing = SNothing
  fmap f (SJust x) = SJust (f x)

smap::(x-> y-> z)-> SMaybe x -> SMaybe y -> SMaybe z
smap _ SNothing _ =SNothing
smap _ _ SNothing= SNothing
smap f (SJust x)(SJust y) = SJust(f x y)

dodajSMaybe::SMaybe Int-> SMaybe Int-> SMaybe Int
dodajSMaybe=smap addFun

toSMaybe :: Maybe a -> SMaybe a
toSMaybe Nothing =SNothing
toSMaybe(Just x )= SJust x

fromSMaybe :: SMaybe a -> Maybe a
fromSMaybe SNothing = Nothing
fromSMaybe (SJust x) = Just x









class SMonoid m where
  smempty :: m
  smappend :: m -> m -> m
  
(<+>)::SMonoid m =>m -> m -> m
(<+>) = smappend

instance SMonoid [a] where
  smempty =[]
  smappend []ys = ys
  smappend (x: xs)ys =x: smappend xs ys




--

main :: IO ()
main = do
  state <- newIORef 33

  scotty 3000 $ do
    post "/isSorted" $ do
      req <- jsonData :: ActionM SortData

      let out = issorted (operator req) (value req)
      json $ object ["sorted: " .= out]

    post "/sum" $ do
      req <- jsonData :: ActionM SumData

      let out = sumList (value1 req) (sumList (value2 req) (value3 req))
      json $ object ["sum: " .= out]

    get "/randomInt" $ do
      seed <- liftIO $ readIORef state
      let (out, seed') = Monad.runState nextRand seed
      liftIO $ writeIORef state seed'
      json $ object ["random" .= out]

    get "/randomDouble" $ do
      seed <- liftIO $ readIORef state
      let (out, seed') = Monad.runState nextRandDouble seed
      liftIO $ writeIORef state seed'
      json $ object ["random" .= out]

    get "/getRandomNumbers" $ do
      seed <- liftIO $ readIORef state

      let (outIntDouble, seed1) = Monad.runState funIntDouble seed

      let (outDoubleInt, seed2) = Monad.runState funDoubleInt seed1

      let (outTripleDouble, seed3) = Monad.runState funDoubleDoubleDouble seed2

      liftIO $ writeIORef state seed3

      json $
        object
          [ "Int,Double" .= outIntDouble,
            "Double,Int" .= outDoubleInt,
            "Double,Double,Double" .= outTripleDouble
          ]


      -- zadanie 8
    get "/sumMap" $ do
      req <- jsonData :: ActionM SumMap
      let out = fromSMaybe $ dodajSMaybe (toSMaybe $ numberA req)(toSMaybe $ numberB req)
      json $ object ["sum" .= out]


    get "/concat" $ do
      req <- jsonData :: ActionM SumData
      let out =(value1 req)<+> (value2 req)<+> (value3 req)
      json $ object ["concat" .= out]