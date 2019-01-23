-- Author:      Jonas Sjödin
-- Contact:     jonas@jonassjodin.com
-- Date:        January 2019
-- License:     MIT
-- Description: Program which transform HEX colors to RGB and vice versa.

module Main (main) where

-- Cabal & stdlib imports
import System.Environment
import System.Exit
import Control.Monad
import System.IO

-- Local imports
import Hex
import Rgb

-- Standard error message
errorMsg :: String
errorMsg = "Usage: (color 223344) for HEX or (color 230 45 230) for RGB"

-- Prints error message to stderr
ePrintLn :: String -> IO()
ePrintLn msg = hPutStrLn stderr msg

-- Prints error message to stderr and exits 
terror :: String -> IO ()
terror msg = do
    ePrintLn msg
    exitFailure

-- Decodes HEX arguments to RGB and RGB arguments to hex. If it cannot be done 
-- it returns an empty String
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