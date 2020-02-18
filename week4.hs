import Data.Char

-- 2. Write a program that provides information about  
-- a person’s weight using your BMI program
-- and the following conditions:
--      "Underweight" is less than 18.5
--      "Normal weight" is from 18.5 to 25
--      "Overweight" is from 25 to 30
--      "Obese level 1" is from 30 to 35
--      "Obese level 2" is from 35 to 40
--      "Obese level 3" is greater than 40

bmi :: (Ord a, Fractional a) => a -> [Char]
bmi w 
    | w < 18.5 = "Underweight"
    | w >= 18.5 && w < 25 = "Normal weight"
    | w >= 25 && w < 30 = "Overweight"
    | w >= 30 && w < 35 = "Obese level 1"
    | w >= 35 && w < 40 = "Obese level 2"
    | otherwise = "Obese level 3"

-- 3. Write a program that provides information about tfl tube ticket price according to the
-- following conditions (For simplicity we use ticket prices for going from Ealing Broadway to
-- Hammersmith (Zone 3 to 2)):
--      £4.70 Cash payment Anytime
--      £1.60 Oyster Monday to Friday 0630 – 0930
--      £1.60 Oyster Monday to Friday 1600 – 1900
--      £1.50 Osyter All other times
-- Hint1: You can use Monday = 1 to Sunday = 7
-- Hint2: You can use 0 for 12AM and 2359 for 11:59PM

tflInfo :: [Char] -> [Char] -> Integer -> [Char]
tflInfo payment day time 
    | toLowerString payment == "cash" = "Cash payment costs 4.70 during any time"
    | toLowerString payment == "card" = getDay day time
    | otherwise = "N/A"

getDay :: [Char] -> Integer -> [Char]
getDay day time
    | toLowerString day == "monday" || toLowerString day == "tuesday" || toLowerString day == "wednesday" || toLowerString day == "thursday" || toLowerString day == "friday" = getTime time
    | toLowerString day == "saturday" || toLowerString day == "sunday" = "Oyster costs 1.50"
    | otherwise = "N/A"

getTime :: Integer -> [Char]
getTime time 
    | (getHour time >= 6 && getHour time <= 9) && (getMin time >= 30 && getMin time <= 59) = "Monday to Friday - 06:30 - 09:30 - Oyster costs 1.60"
    | (getHour time >= 16 && getHour time <= 19) && (getMin time >= 0 && getMin time <= 59) = "Monday to Friday - 16:00 - 19:00 - Oyster costs 1.60"
    | getHour time > 23 || getMin time > 59 = "Given time does not exist... "
    | otherwise = "Oyster costs 1.50"

-- Get the hour from a number
getHour :: Integer -> Int
getHour time 
    | numLength time == 3 = do
        let num = read (take 1 (show time)) :: Int
        num
    | numLength time == 4 = do
        let num = read (take 2 (show time)) :: Int
        num

-- Get minutes from a number
getMin :: Show a => a -> Int
getMin time 
    | length (drop 2 (show time)) == 1 = do
        let num = read (drop 1 (show time)) :: Int
        num
    | length (drop 2 (show time)) == 2 = do
        let num = read (drop 2 (show time)) :: Int
        num

-- Get a number's length
numLength :: Show a => a -> Int
numLength num = length (show num)

-- Make string to lower case
toLowerString :: [Char] -> [Char]
toLowerString chars = [toLower x | x <- chars]

-- 4. For numbers ranging from 1 to 100 (inclusive): 
-- print “foo” if the number is divisible by 3,
-- print “bar” if the number is divisible by 5, 
-- print “foobar” if the number is divisible by both 3 and 5
-- otherwise print the number. 
-- (Review examples in week 1 for print output.)

funkyFunc :: (Integral a, Show a) => a -> [Char]
funkyFunc num 
    | num >= 1 && num <= 100 = showText num
    | otherwise = "Number not between 1 and 100"

showText :: (Integral a, Show a) => a -> [Char]
showText num
    | mod num 3 == 0 && mod num 5 == 0 = "foobar"
    | mod num 3 == 0 = "foo"
    | mod num 5 == 0 = "bar"
    | otherwise = show num