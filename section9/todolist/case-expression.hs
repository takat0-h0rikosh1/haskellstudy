import System.Environment
import System.IO

main = do
   args <- getArgs
   let result = case args of [] -> "args is empty"
                             xs -> foldl (\acc x -> acc ++ x) "args is " xs
   putStrLn result
