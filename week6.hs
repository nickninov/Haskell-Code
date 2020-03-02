import Data.Char
import Data.List

-- 1. Implement the following functions. You can use the library function map:

-- a. A function doubles:: [Int] -> [Int] that doubles every item in a list by using the map
-- function.
doubles :: [Int] -> [Int]
doubles xs = map (2*) xs

-- b. A function penceToPounds :: [Int] -> [Float] 
-- that turns prices given in pence into the same price in pounds by using the map function.
penceToPounds :: [Int] -> [Float]
penceToPounds xs = map (\x -> (fromIntegral x :: Float) / 100) xs

-- c. A function uppersComp :: String -> String that converts a string to uppercase.
uppersComp :: String -> String
uppersComp xs = [toUpper x | x <- xs]

-- d. Think about the “caesar cipher”: How can the map function be applied?
charToInt :: Char -> Int
charToInt c = ord c - ord 'a'

intToChar :: Int -> Char
intToChar n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c 
    | isLower c = intToChar ((charToInt c + n) `mod` 26)
    | otherwise = c

cipher :: Int -> String -> String 
cipher n xs = map (\x-> shift n x) xs



-- 2. Implement the following functions. You can use the library function filter:

-- a. A function alphas :: String -> String that removes all non-alphabetic characters from a string by using the filter function.
alphas :: String -> String
alphas xs = filter (\ x -> isAlpha x) xs

-- b. A function above :: Int -> [Int] -> [Int] that removes all numbers less than or equal to a given number by using the filter function.
above :: Int -> [Int] -> [Int]
above n xs = filter (\x -> x > n) xs

-- c. A function unequals :: [(Int,Int)] -> [(Int,Int)] that removes all pairs (x,y) where x == y by using the filter function.
unequals :: [(Int, Int)] -> [(Int, Int)]
unequals xs = filter (\x -> fst x /= snd x) xs

-- d. A function rmCharComp :: Char -> String -> String that removes all occurrences of a character from a string.
rmCharComp :: Char -> String -> String
rmCharComp c xs = filter (\x -> c /= x) xs



-- 3. Implement the following functions. You can use the library functions map and filter: 

-- a. largeDoubles xs = [2 * x | x <- xs, x > 3]
largeDoubles :: [Int] -> [Int]
largeDoubles xs = map (2*) (filter (>3) xs)

-- b. reverseEvens str = [reverse s | s <- strs, even (length s)]
reverseEvens :: [String] -> [String]
reverseEvens xs = map reverse (filter (\x -> even (length x)) xs)



-- 4. Write a recursive function concatRec :: [[a]] -> [a] that concatenates a list of lists into a single list.
concatRec :: [[a]] -> [a]
concatRec [] = []
concatRec (list:lists) = list ++ concat lists



-- 5. Write a function rmCharsRec :: String -> String -> String 
-- that removes all characters in the first string from the second string.
rmCharsRec :: String -> String -> String
rmCharsRec [] ys = ys
rmCharsRec (x:xs) [] = []
rmCharsRec (x:xs) ys = rmCharsRec xs (rmChar x ys )

rmChar :: Char -> String -> String
rmChar c xs = filter ( /= c) xs