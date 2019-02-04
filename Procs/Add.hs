module Procs.Add
  (add)
  where

import System.Directory
import System.IO
import Data.List

add :: IO()
add = do
  putStrLn "What would you like to add:"
  line <- getLine
  withFile "todo.txt" AppendMode (ins line)
    where ins = (flip hPutStrLn)
