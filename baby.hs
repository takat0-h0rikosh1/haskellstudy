doubleMe x = x + x
doubleUs x y = x * 2 + y * 2
doubleSmallNumber x = if x > 100
  then x
  else x*2
doubleSmallNumber' x = (if x > 100 
  then x else x*2) + 1
conanO'Brien = "It's a-me, Conan O'Brien!"
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
addThree x y z = x + y + z 
factorial :: Integer -> Integer
factorial n = product [1..n]
circumference :: Float  -> Float
circumference r = 2 * pi * r
circumference' :: Double -> Double
circumference' r = 2 * pi * r
