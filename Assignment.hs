{-
Exercise 1:
    A positive integer is perfect if it equals the sum 
    of all of its factors, excluding the number itself. 
    Using a list comprehension, define a function
-}

sumOfFactors :: Integral a => a -> a
sumOfFactors n = sum [x | x <- [1..n], n `mod` x == 0, x /= n]

perfects :: Integral a => a -> [a]
perfects n = [x | x <- [1..n], sumOfFactors x == x]

{-
Exercise 2:
    Write a Caesar Cipher program:
    The Caesar Cipher technique is one of the earliest and simplest method of
    encryption technique. It’s simply a type of substitution cipher, 
    i.e., each letter of a given text is replaced by a letter some fixed number
    of positions down the alphabet. For example, with a shift of 1, 
    A would be replaced by B, B would become C, and so on. 
    Thus, to cipher a given text we need an integer value, 
    known as shift which indicates the number of position each letter 
    of the text has been moved down. The encryption can be represented using 
    modular arithmetic by first transforming the letters into numbers, 
    according to the scheme, A = 0, B = 1,…, Z = 25.
-}

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

{-
Exercise 3:
    Define the exponentiation operator ^ for non-negative integers using the same
    pattern of recursion as the multiplication operator *, and show how 2 ^ 3 is
    evaluated using your definition.
-}
 
powerTo :: (Integral b, Num a) => a -> b -> a
powerTo a 0 = 1
powerTo a b = a * (powerTo a (b-1))

{-
Exercise 4:
    Define a recursive function merge :: Ord a => [a] -> [a] -> [a] that
    merges two sorted lists to give a single sorted list. For example:
    > merge [2, 5, 6] [1, 3, 4]
    [1, 2, 3, 4, 5, 6]
    Note: your definition should not use other functions on sorted lists such as
    insert or isort , but should be defined using explicit recursion.
-}

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] list2 = list2
merge list1 [] = list1
merge list1 list2
    | head list1 <= head list2 = head list1 : merge (tail list1) list2
    | otherwise = head list2 : merge list1 (tail list2)