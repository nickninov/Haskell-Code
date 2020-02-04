-- 2. Show how the library function last that
-- selects the last element of a list works. 
-- Can you define it using the functions introduced in this lecture?

myLast :: [a] -> a
myLast ls = head (reverse ls)

-- 3. A triple (x,y,z) of positive 
-- integers is called pythagorean if 
-- x^2 + y^2 = z^2 . Using
-- list comprehension, define a function

pythagorean :: Integer -> [(Integer, Integer, Integer)]
pythagorean num = [ (x, y, z) | x <- [1..num], y <- [1..num], z <- [1..num], x^2 + y^2 == z^2]

-- 4. A positive integer is perfect if it equals the sum 
-- of all of its factors, excluding the number itself. 
-- Using a list comprehension, define a function

sumOfFactors n = sum [x | x <- [1..n], n `mod` x == 0, x /= n]
perfects n = [x | x <- [1..n], sumOfFactors x == x]

-- 5. The scalar product of two lists of integers xs and ys of 
-- length n is given by the sum of the products.
-- Using a list comprehension, define a function
-- that returns the scalar product of two lists.

scalarProduct as bs
    | length as == length bs = sum (zipWith (*) as bs)
    | otherwise = error "Vector sizes must match"
