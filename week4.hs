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

tflInfo payment day time 
    | payment == "cash" = "Cash payment costs 4.70 during any time"
    | payment == "card" = getDay day time
    | otherwise = "N/A"

getDay day time
    | day >= 1 && day <= 5 = getTime time
    | day == 6 || day == 7 = "Oyster costs 1.50"
    | otherwise = "N/A"

getTime time
    | time >= 630 && time <= 0930 = "Oyster costs 1.60"
    | time >= 1600 && time <= 1900 = "Oyster costs 1.60"
    | otherwise = "Oyster costs 1.50"


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