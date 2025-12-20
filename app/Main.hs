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

main :: IO ()

main = scotty 3000 $ do

  post "/isSorted" $ do
    req <- jsonData :: ActionM SortData

    let out = issorted (operator req ) (value req )
    json $ object ["sorted: " .= out ]

  post "/sum" $ do
    req <- jsonData :: ActionM SumData

    let out = sumList ( value1 req ) ( sumList (value2 req ) (value3 req ) )
    json $ object [ "sum: " .= out ]