module Procs.Remove
  (remove)
  where

import System.Directory
import System.IO
import Data.List

remove :: IO()
remove = do
  -- read files
  contents <- readFile "todo.txt"
  (tempName, tempHandle)  <- openTempFile "." "temp"
  -- prep print
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn "These are you TODO items:"
  mapM_ putStrLn numberedTasks
  putStrLn "Which one do you want to delete:"
  -- get input
  numberString <- getLine
  let number = read numberString
      newTodoItems = delete (todoTasks !! number) todoTasks
  -- write to temp
  hPutStr tempHandle $ unlines newTodoItems
  hClose tempHandle
  removeFile "todo.txt"
  renameFile tempName "todo.txt"
