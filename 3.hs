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

bmiTell5 :: Double -> Double -> String
bmiTell5 weight height
    |  bmi <= skinny = "underweight"
    |  bmi <= normal = "normal"
    |  bmi <= fat    = "fat"
    |  otherwise = "whale"
    where bmi = weight / height ^ 2
          (skinny, normal, fat)  = (18.5, 25.5, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ ". "
    where (f:_) = firstname
          (l:_) = lastname

calcBmi :: [ (Double, Double) ] -> [Double]
calcBmi xs =  [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

-- 円柱の表面積を高さと半径から求める関数。
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

-- 体重と身長のタプルのリストからBMIのリストを返す
calcBmis :: [ (Double, Double) ] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2 ] 

-- 体重と身長のタプルのリストから肥満なひとのBMIのリストを返す
calcBmisAndFilterOnlyFat :: [ (Double, Double) ] -> [Double]
calcBmisAndFilterOnlyFat xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0 ] 

-- case式はパターンマッチと交換可能
head1' :: [a] -> a
head1' [] = error "No head for empty lists!"
head1' (x:_) = x

head2' :: [a] -> a
head2' xs = case xs of [] -> error "No head for empty lists!"
                       (x:_) -> x


describeList :: [a] -> String
describeList ls = "The list is "
                  ++ case ls of [] -> "empty."
                                [x] -> "a singleton list."
                                xs -> "a longer list."

describeList2 :: [a] -> String
describeList2 ls = "The list is " ++ what ls
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

