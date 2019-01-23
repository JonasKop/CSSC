module Main (main) where

-- Cabal & stdlib imports
import System.Environment
import System.Exit
import Control.Monad

-- Local imports
import Hex
import Rgb

errorMsg :: String
errorMsg = "Usage: (color 223344) for HEX or (color 230 45 230) for RGB"

terror :: String -> IO ()
terror msg = do
    putStrLn msg
    exitFailure

    
decode :: [String] -> String
decode str
    | len == 3  = decodeRGB str
    | len == 1  = decodeHex $ str !! 0
    | otherwise = ""
        where len = length str

main :: IO ()
main = do
    args <- getArgs
    
    let decoded = decode args
    when (length decoded == 0) (terror errorMsg)
    putStrLn decoded
        


--subStr :: String -> Int -> Int -> String
--subStr str start end = drop start . take end $ str