module Procs.Remove
  (remove)
  where

import System.Directory
import System.IO
import Data.List

remove :: IO()
remove = do
  handle <- openFile "todo.txt" ReadMode
  (tempName, tempHandle)  <- openTempFile "." "temp"
  contents <- hGetContents handle
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn "These are you TODO items:"
  mapM_ putStrLn numberedTasks
  putStrLn "Which one do you want to delete:"
  numberString <- getLine
  let number = read numberString
      newTodoItems = delete (todoTasks !! number) todoTasks
  hPutStr tempHandle $ unlines newTodoItems
  hClose handle
  hClose tempHandle
  removeFile "todo.txt"
  renameFile tempName "todo.txt"
