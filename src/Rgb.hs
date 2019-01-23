module Rgb where

import Text.Read

toInt8 :: String -> Int
toInt8 str = let maybeInt = readMaybe str :: Maybe Int in case maybeInt of 
                        Nothing -> -1
                        Just nr -> if nr >= 0 && nr <= 255 then nr else -1

decodeRGB :: [String] -> String
decodeRGB rgb = if elem (-1) b then "" else "#" ++ concat (map (intToHex) b)
            where b = map (toInt8) rgb

intToHex :: Int -> String
intToHex nr = [intAsHex(nr `div` 16)] ++ [intAsHex(nr `mod` 16)]
    
intAsHex :: Int -> Char
intAsHex c = case c of
    0  -> '0'
    1  -> '1'
    2  -> '2'
    3  -> '3'
    4  -> '4'
    5  -> '5'
    6  -> '6'
    7  -> '7'
    8  -> '8'
    9  -> '9'
    10 -> 'A'
    11 -> 'B'
    12 -> 'C'
    13 -> 'D'
    14 -> 'E'
    15 -> 'F'
    _ -> '_'