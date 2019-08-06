multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

{-
compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x
-}

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

-- セクション -----

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- 与えられた文字が大文字かどうか調べる
isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- 5.2 高階実演

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- zipWith を実装してみる
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- 実装したzipWithを試す。
-- zipWith' (+) [4,2,5,6] [ 2,6,2,3]
-- zipWith' max [6,3,2,1] [7,3,1,5]
-- zipWith' (++) ["foo", "bar", "baz"] ["fighters", "hoppers", "aldrin"]
-- zipWith' (*) (replicate 5 2) [1..]
-- zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

-- flipを実装する

-- まわりくどいflipの実装
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

-- 関数がカリー化されていることを利用した簡潔な実装
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f y x = f x y

-- TODO flipされた関数を別の関数にわたす
-- zip [1,2,3,4,5] "hello"
-- flip'' zip [1,2,3,4,5] "hello"
-- zipWith div [2,2..] [10,8,6,4,2]
-- zipWith (flip'' div) [2,2..] [10,8,6,4,2]
