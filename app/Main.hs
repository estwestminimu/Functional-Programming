{-
pstatni argument typ zwracany a wyszostko przed nim to jest argumenty przyjowamy
 [Int] -> [Int] -> [Int]

Nazwy konstrutkorow z duzej sum i srot zarezerwoane

uncury do zamieniania w pary
-}


-- Dyrektywy kompilatora
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Web.Scotty
import Data.Aeson (FromJSON, ToJSON, object, (.=)) -- osbługa json
import GHC.Generics (Generic) -- automatycznie tworze instacje json

-- Zadanie 7
-- qualified oznacza ze wszystko zostanie poprzedzone
import  qualified Control.Monad.State as Monad
import Control.Monad (replicateM)
import Data.IORef  -- chce zapisywac dane miedzy endpoint

data SortData =  SortData
  { 
    operator :: String,
    value :: [Int]
    -- show do konwersji na napisu
    -- bez generic aeson sie gubi
  } deriving (Show, Generic)


data SumData = SumData{ 
    value1 :: [Int],
    value2 :: [Int],
    value3 :: [Int]
  } deriving (Show, Generic)

-- konwersja miedzy typami
instance FromJSON SortData
instance ToJSON SortData
instance FromJSON SumData
instance ToJSON SumData


sumList :: [Int] -> [Int] -> [Int]

-- ide zgłasza ostrzeżenie przy map i zip
-- map (uncurry (+)) zip x y
sumList = zipWith  ( + )

-- dostajemy string nastepnie int i odpowiadamy tru false
issorted :: String -> [Int] -> Bool

issorted x list =
  let compare = case x of
        "<=" -> ( <= )
        ">=" -> ( >= )
        ">" -> ( > )
        "<" -> ( < )

      y = zip list (tail list )  

-- cabal szponci bez uncurry compare
  in all ( uncurry compare ) y




-- kolejny zestaw 7

type Rand a = Monad.State Int a    

nextRand :: Rand Int
nextRand = do
  seed <- Monad.get
  let a= 1103515245
      c= 12345
      m= 2147483648       
      seed' = (a* seed+ c)    -- Nie dodaje modulo bo overflow w haskellu dziala tak samo dla int`mod` m ale wlica max
  Monad.put seed'
  return seed'

-- 3.5


nextRandDouble :: Rand Double
nextRandDouble = do
  seed <- Monad.get
  let a= 1103515245
      c= 12345
      m= 2147483648       
      seed' = (a* seed+ c)  `mod` m
  Monad.put seed'
  return (fromIntegral seed'/fromIntegral m)


-- 4.0
funIntDouble :: Rand (Int, Double)
funIntDouble = do
  x <- nextRand
  y <-nextRandDouble
  return(x,y)

funDoubleInt :: Rand (Double, Int)
funDoubleInt = do
  x <- nextRand
  y <-nextRandDouble
  return(y,x)

funDoubleDoubleDouble :: Rand (Double,Double, Double)
funDoubleDoubleDouble = do
  x <-nextRandDouble
  y <-nextRandDouble
  z <-nextRandDouble
  return(x,y,z)


main :: IO ()
main = do
  state <-newIORef 33  

  scotty 3000 $ do
    post "/isSorted" $ do
      req <- jsonData :: ActionM SortData

      let out = issorted (operator req ) (value req )
      json $ object ["sorted: " .= out ]

    post "/sum" $ do
      req <- jsonData :: ActionM SumData

      let out = sumList ( value1 req ) ( sumList (value2 req ) (value3 req ) )
      json $ object [ "sum: " .= out ]


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
  
      json $ object 
        [ "Int,Double" .= outIntDouble
        , "Double,Int" .= outDoubleInt
        , "Double,Double,Double" .= outTripleDouble
        ]
