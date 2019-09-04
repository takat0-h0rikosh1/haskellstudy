import Data.List
import Data.Char
import  qualified Data.Map as Map

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words
-- ghci>wordNums "hey these are the words in this sentence"
-- [("are",1),("hey",1),("in",1),("sentence",1),("the",1),("these",1),("this",1),("words",1)]

-- isInFixOf 関数と同等
isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

-- 文字をシフトする数と文字列を受け取り文字列中の各文字をアルファベット上で指定された数だけ前方向にシフトする関数
encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

-- メッセージの複合
decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

-- 数を引数にとり各桁の数の合計を返す関数
digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey key xs

-- Map の宣言
phoneBook :: Map.Map String String
phoneBook = Map.fromList $
   [("betty", "555-2938")
   ,("bonnie", "452-2928")
   ,("patsy", "493-2928")
   ,("lucille", "205-2928")
   ,("wendy", "939-2928")
   ,("penny", "853-2492")
   ]

-- 電話番号を Int のリストに変換する関数

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

phoneBook' =
   [("betty", "555-2938")
   ,("bonnie", "452-2928")
   ,("patsy", "493-2928")
   ,("patsy", "123-2928")
   ,("patsy", "234-2928")
   ,("lucille", "205-2928")
   ,("wendy", "939-2928")
   ,("penny", "853-2492")
   ]

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
    where add number1 number2 = number1 ++ ", " ++ number2

phoneBookToMap' :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k,v) -> (k, [v])) xs
