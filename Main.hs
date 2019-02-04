module Main where

import Procs.Remove
import Procs.Add
import Procs.ListAll

main :: IO()
main = do
  putStrLn "~*TODO Manager*~"
  putStrLn "0 - Add"
  putStrLn "1 - Remove"
  putStrLn "2 - List all"
  line <- getLine
  case line of
    "0" -> add
    "1" -> remove
    "2" -> listall
    _ -> putStrLn "Wrong choice. Exiting..."
  main
