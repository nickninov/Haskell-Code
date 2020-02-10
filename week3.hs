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
