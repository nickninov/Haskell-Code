import Data.Char
-- 1. Using library functions, 
-- define a function halves :: [s] -> ([a], [a])
-- that splits an even-lengthed list into two halves, e.g.:

-- halve [1, 2, 3, 4, 5, 6]
-- ([1, 2, 3], [4, 5, 6])

halves :: [a] -> ([a], [a])
halves as = splitAt (length as `div` 2) as

-- 2. Consider a function safetail :: [a] -> [a] 
-- that behaves as the library function tail, 
-- except that safetail maps the empty list to itself, 
-- whereas tail produces an error in this case. Define safetail using:
    -- a. a conditional expression;
    -- b. guarded equations;
    -- c. pattern matching.
-- Hint: make use of the library function null.

safeTail :: [a] -> [a]
safeTail as 
    | length as > 0 = tail as
    | otherwise = []

-- 3. Redefine the following version of the conjunction 
-- operator using conditional expressions rather than pattern matching:
-- True && True = True
-- _ && _ = False

-- True ^ True = True
-- False ^ False = False

-- 4. Show how the curried function definition mult x y z = x * y * z 
-- can be understood in terms of lambda expressions.

-- (\x y z -> x * y * z) num1 num2 num3

-- 5. Using a list comprehension, give an expression that calculates 
-- the sum 1^2 + 2^2 + ... 100^2 of the first one hundred integer squares.

-- [x ^ 2 | x <- [1..100]]

-- 6. Write a Caesar Cipher program:
    -- The Caesar Cipher technique is one of the earliest and simplest method of
    -- encryption technique. It’s simply a type of substitution cipher, 
    -- i.e., each letter of a given text is replaced by a letter some fixed number
    -- of positions down the alphabet. For example, with a shift of 1, 
    -- A would be replaced by B, B would become C, and so on. 
    -- Thus, to cipher a given text we need an integer value, 
    -- known as shift which indicates the number of position each letter 
    -- of the text has been moved down. The encryption can be represented using 
    -- modular arithmetic by first transforming the letters into numbers, 
    -- according to the scheme, A = 0, B = 1,…, Z = 25.

-- Convert a lowercase letter corresponding to a value from 0 to 25
charToInt :: Char -> Int
charToInt c = ord c - ord 'a'

-- Conver a value from 0 to 25 to the corresponding lowercase letter
intToChar :: Int -> Char
intToChar n = chr (ord 'a' + n)

-- Shift a letter for n amount of positions
shift :: Int -> Char -> Char
shift n c 
    | isLower c = intToChar ((charToInt c + n) `mod` 26)
    | otherwise = c

-- Cipher function
cipher :: Int -> String -> String 
cipher n xs = [shift n x | x <- xs]
