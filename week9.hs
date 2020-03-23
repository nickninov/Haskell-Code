-- 1. Identify the redexes in the following expressions, and determine whether each redex is
-- innermost, outermost, neither, or both:
-- a. 1 + (2*3) - both
-- b. (1+2) * (2+3) - innermost
-- c. fst (1+2, 2+3) - outermost
-- d. (\x -> 1 + x) (2*3) - innermost

-- 2. Show why outermost evaluation is preferable to innermost for the purposes of evaluating fst (1+2, 2+3).
-- Innermost:
-- fst (1 + 2, 2 + 3)
-- applying the first +
--      fst (3, 2 + 3)
-- applying +
--      fst (3, 5)
-- applying fst
--      3

-- Outermost:
-- fst (1 + 2, 2 + 3)
-- applying the first +
--      fst (3, 2 + 3)
-- applying fst
--      3

-- 3. Given the definition mult = \x -> (\y -> x * y), show how the evaluation of
-- mult 3 4 can be broken down into four separate steps.

-- mult 3 4
-- applying mult
--     (\x -> (\y -> x * y)) 3 4
-- applying the outer lambda
--     (\y -> 3 * y) 4
-- applying the lambda
--     3 * 4
-- applying *
--     12


-- 4. Using a list comprehension, define an expression fibs :: [Integer] that generates the
-- infinite sequence of Fibonacci numbers:

-- 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...

-- The sequence follows the formula (fibn = fibn-1 + fibn-2), i.e., the first two numbers are 0
-- and 1, and the next is the sum of the previous two. Repeat the last step ad nauseam.

-- Hint: Make use of zip and tail.

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)