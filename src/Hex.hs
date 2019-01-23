module Hex where

decodeHex :: String -> String
decodeHex [x1,x2,x3,x4,x5,x6] = if val1 == -1 || val2 == -1 || val3 == -1 
    then "" else show val1 ++ " " ++ show val2 ++ " " ++ show val3
    where val1 = parseHexStr [x1, x2]
          val2 = parseHexStr [x3, x4]
          val3 = parseHexStr [x5, x6]

decodeHex _ = ""

parseHexStr :: String -> Int
parseHexStr [x1,x2] = if val1 == -1 || val2 == -1 then -1 else val1 * 16 + val2
        where val1 = parseHexChar x1
              val2 = parseHexChar x2
    
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