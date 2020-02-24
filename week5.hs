-- 1. Define the exponentiation operator ^ for non-negative integers 
-- using the same pattern of recursion as the multiplication operator *,
-- and show how 2 ^ 3 is evaluated using your definition.

power :: (Eq t, Num t, Num p) => p -> t -> p
power a 0 = 1
power a b = a * power a (b - 1)

-- 2. Define a recursive function merge :: Ord a => [a] -> [a] -> [a] that
-- merges two sorted lists to give a single sorted list. For example:
-- > merge [2, 5, 6] [1, 3, 4]
-- [1, 2, 3, 4, 5, 6]
-- Note: your definition should not use other functions on sorted lists such as
-- insert or isort , but should be defined using explicit recursion.

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] list2 = list2
merge list1 [] = list1
merge list1 list2
            | head list1 <= head list2 = head list1 : merge (tail list1) list2
            | otherwise = head list2 : merge list1 (tail list2)

-- 3. Define a recursive function power such that power x y raises x to the y power.
-- For example: 
-- *Main> powers 3 3
-- 27

powers :: (Eq t, Num t, Num p) => p -> t -> p
powers a 0 = 1
powers a b = a * powers a (b - 1)

-- 4. You are given a function plusOne x = x + 1. 
-- Without using any other (+)s, define a recursive
-- function addition such that addition x y adds x and y together.

plusOne :: Num a => a -> a
plusOne n = n + 1

addition :: (Ord t, Num t, Num p) => t -> p -> p
addition x y 
    | x > 0 = addition (x - 1) (plusOne y)
    | otherwise = y

-- 5. Implement the function log2, which computes the 
-- integer log (base 2) of its argument. 
-- That is, log2 computes the exponent of the largest power 
-- of 2 which is less than or equal to its argument. 
-- For example, log2 16 = 4, log2 11 = 3, and log2 1 = 0. 
-- (Small hint: read the last phrase of the paragraph immediately preceding these exercises.)

log2 :: (Integral t, Num p) => t -> p
log2 1 = 0
log2 n = 1 + log2 (n `div` 2)

-- 6. In Theory of Computation, we introduced the Ackermann function:
--      A(0, y) = y + 1
--      A(x, 0) = A(x − 1, 1)
--      A(x, y + 1) = A(x − 1, A(x, y))
-- Implement!

ackermann :: (Num t, Num a, Eq t, Eq a) => a -> t -> t
ackermann x 0 = ackermann (x - 1) 1
ackermann 0 y = y + 1
ackermann x y = ackermann (x - 1) (ackermann x (y  - 1))