module Procs.ListAll
  where


listall :: IO()
listall = do
  putStrLn "These are you todos:"
  contents <- readFile "todo.txt"
  let numberedTasks = unlines $ zipWith (\n line -> show n ++ " - " ++ line) [0..] $ lines contents
  putStrLn numberedTasks