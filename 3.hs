lucky :: Int -> String
lucky 7 = "lucky number seven"
lucky x = "sorry, you're out of luck, pal!"

sayMe :: Int -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe x = "Not between 1 and 3"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName x = "???"

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors' (x1, y1) (x2, y2)  = (x1 + x2, y1 + y2)

first :: (a,b,c) -> a
first (x,_,_) = x

second :: (a,b,c) -> b
second (_,y,_) = y

third :: (a,b,c) -> c
third (_,_,z) = z

listPatternMatch :: [(Int,Int)] -> [Int]
listPatternMatch xs = [ x * 100 + 3 | (x, 3) <- xs ]

listSyntaxSugarMatch :: [Int] -> Int
listSyntaxSugarMatch (x:xs) = x

head' :: [a] -> a
head' [] = error "empty list"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two element: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long. The first two element are: " ++ show x ++ " and " ++ show y
badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z

firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: Double -> String
bmiTell  bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supporedly normal,\
        \ Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"

bmiTell' :: Double -> Double -> String
bmiTell' weight height
    |  weight / height ^ 2 <= 18.5 = "underweight"
    |  weight / height ^ 2 <= 25.5 = "normal"
    |  weight / height ^ 2 <= 30.0 = "fat"
    |  otherwise = "whale"

max' :: (Ord a) => a -> a -> a
max' a b
    | a <= b = b
    | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b = EQ
    | a <= b = LT
    | otherwise = GT

bmiTell3 :: Double -> Double -> String
bmiTell3 weight height
    |  bmi <= 18.5 = "underweight"
    |  bmi <= 25.5 = "normal"
    |  bmi <= 30.0 = "fat"
    |  otherwise = "whale"
    where bmi = weight / height ^ 2

bmiTell4 :: Double -> Double -> String
bmiTell4 weight height
    |  bmi <= skinny = "underweight"
    |  bmi <= normal = "normal"
    |  bmi <= fat    = "fat"
    |  otherwise = "whale"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.5
          fat    = 30.0

badGreeting :: String
badGreeting = "mother f〇〇ker"

niceGreeting :: String
niceGreeting = "hi"

greet :: String -> String
greet "Juan" = niceGreeting ++ "Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name
