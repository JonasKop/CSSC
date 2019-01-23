-- Author:      Jonas Sjödin
-- Contact:     jonas@jonassjodin.com
-- Date:        January 2019
-- License:     MIT
-- Description: Hex file containing the parsing of HEX color to RGB

module Hex where

-- Decodes HEX color into RGB and returns the RGB value as a string. If it 
-- is an invalid HEX string it returns an empty string.
decodeHex :: String -> String
decodeHex [x1,x2,x3,x4,x5,x6] = if val1 == -1 || val2 == -1 || val3 == -1 
    then "" else show val1 ++ " " ++ show val2 ++ " " ++ show val3
    where val1 = hexToInt [x1, x2]
          val2 = hexToInt [x3, x4]
          val3 = hexToInt [x5, x6]
decodeHex _ = ""

-- Parses 2 char HEX color to its int value. If it cant it returns -1
hexToInt :: String -> Int
hexToInt [x1,x2] = if val1 == -1 || val2 == -1 then -1 else val1 * 16 + val2
        where val1 = parseHexChar x1
              val2 = parseHexChar x2

-- Parses a HEX character to its int value. If it is an invalid char it 
-- returns -1
parseHexChar :: Char -> Int
parseHexChar c = case c of
    '0' -> 0
    '1' -> 1
    '2' -> 2
    '3' -> 3
    '4' -> 4
    '5' -> 5
    '6' -> 6
    '7' -> 7
    '8' -> 8
    '9' -> 9
    'A' -> 10
    'B' -> 11
    'C' -> 12
    'D' -> 13
    'E' -> 14
    'F' -> 15
    'a' -> 10
    'b' -> 11
    'c' -> 12
    'd' -> 13
    'e' -> 14
    'f' -> 15
    _   -> -1