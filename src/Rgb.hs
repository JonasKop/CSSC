-- Author:      Jonas Sjödin
-- Contact:     jonas@jonassjodin.com
-- Date:        January 2019
-- License:     MIT
-- Description: RGB file containing the parsing of RGB color to HEX

module Rgb where

import Text.Read

-- Tries to convert a string to an 8 bit unsigned int and if it can it 
-- returns its value else it returns -1.
toInt8 :: String -> Int
toInt8 str = let maybeInt = readMaybe str :: Maybe Int in case maybeInt of 
                        Nothing -> -1
                        Just nr -> if nr >= 0 && nr <= 255 then nr else -1

-- Decodes RGB string and returns its HEX value. If it can't it returns an
-- empty string.
decodeRGB :: [String] -> String
decodeRGB rgb = if elem (-1) b then "" else "#" ++ concat (map (intToHex) b)
            where b = map (toInt8) rgb

-- Converts a number to a two char HEX value. 
intToHex :: Int -> String
intToHex nr = [intAsHex(nr `div` 16)] ++ [intAsHex(nr `mod` 16)]
    
-- Converts 4 bit int to a char.
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