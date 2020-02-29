# Haskell Cheat Sheet

# Lists

**Select the first element of a non-empty list:**
<br>`head [1, 2, 3, 4, 5]`
<br>1
<br>
<br>
**Remove the first element from a non-empty list:**
<br>`tail [1, 2, 3, 4, 5]`
<br>[2, 3, 4, 5]
<br>
<br>
**Select the n-th element of list (starting from 0):**
<br>`[1, 2, 3, 4, 5]!!2`
<br>3
<br>
**Select the first n elements of a list :**
<br>`take 3 [1, 2, 3, 4, 5]`
<br>[1, 2, 3]
<br>
<br>
**Remove the nth element from a non-empty list:**
<br>`drop 3 [1, 2, 3, 4, 5]`
<br>[4, 5]
<br>
<br>
**Calculate the length of a list:**
<br>`length [1, 2, 3, 4, 5]`
<br>5
<br>
<br>
**Calculate the product of a list:**
<br>`product [1, 2, 3, 4, 5]`
<br>120
<br>
<br>
**Append two lists:**
<br>`[1, 2, 3] ++ [4, 5]`
<br>[1, 2, 3, 4, 5]
<br>
<br>
**Reverse a list:**
<br>`reverse [1, 2, 3, 4, 5]]`
<br>[5, 4, 3, 2, 1]
<br>
<br>
**Concatenate two lists into one:**
<br>`concat [[1,2,3], [4,5,6]]`
<br>[1, 2, 3, 4, 5, 6]
<br>
<br>
**Map two lists to a list of pairs of their corresponding elements:**
<br>`zip [1, 2, 3] ['a', 'b', 'c']`
<br>[(1, 'a'), (2, 'b'), (3, 'c')]
<br>
<br>
<br>`zipWith (+) [1, 2, 3] [4, 5, 6]`
<br>[5, 6, 9]
<br>
<br>
<br>`zipWith (*) [1, 2, 3] [4, 5, 6]`
<br>[4, 10, 18]
<br>
<br>
<br>`zipWith (-) [1, 2, 3] [4, 5, 6]`
<br>[-3, -3, -3]
<br>
<br>
<br>`zipWith (/) [1, 2, 3] [4, 5, 6]`
<br>[0.25, 0.4, 0.5]
<br>
<br>
**Split a list on the given symbol:**
<br>`splitAt 15 [1..20]`
<br>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20])
<br>
<br>
<br>
<br>
**Returns the list of all the values of the passed function and the passed list:**
<br>**map :: (a -> b) -> [a] -> [b]**
<br>`map even [1..10]]`
<br>[False,True,False,True,False,True,False,True,False,True]
<br>
<br>
<br>
<br>
**Returns the passed list of all the values such that the elements of the list are True to the passed function:**
<br>**filter :: (a -> Bool) -> [a] -> [a]**
<br>`filter even [1..10]`
<br>[2, 4, 6, 8, 10]
<br>
<br>
<br>
<br>
# Types

`min 1 10`
<br>1
<br>
<br>
`max 1 10`
<br>10
<br>
<br>
**Find the remainder after divison:**
<br>`mod 5 2`
<br>1
<br>
<br>
**Converts value to string:**
<br>`show False`
<br>"False"
<br>
<br>
<br>`show 123`
<br>"123"
<br>
<br>
<br>`show [1, 2, 3]`
<br>“[1, 2, 3]”
<br>
<br>
**Converts value to string:**
<br>`read “False” :: Bool`
<br>False
<br>
<br>
<br>`read “[1, 2, 3]” :: [Int]`
<br>[1, 2, 3]
<br>
<br>
<br>`read “123” :: Int`
<br>123
<br>
<br>
<br>`read “(‘a’, False)” :: (Char, Bool)`
<br>(‘a’, False)
<br>
<br>
**Returns a negative number:**
<br>`negate 69`
<br>-69
<br>
<br>
<br>`negate 69`
<br>-69
<br>
<br>
**Returns an absolute number:**
<br>`abs 69`
<br>69
<br>
<br>
<br>`abs (-69)`
<br>69
<br>
<br>
**Returns the signum - 1 for positive number, -1 for negative and 0 if the result is 0:**
<br>`signum 0`
<br>0
<br>
<br>
<br>`signum 3`
<br>1
<br>
<br>
<br>`signum (-3)`
<br>-1
<br>
<br>
**Divide two integers:**
<br>`div 7 2`
<br>3
<br>
<br>
**Return the reciprocation (1 / n):**
<br>`recip 2.0`
<br>0.5
<br>
<br>
**Return a constant function.**
<br>*A constant function is a function whose (output) value is the same for every input value. For example, the function y(x)=4 is a constant function because the value of  y(x) is 4 regardless of the input value x.<br>*
**const :: a -> b -> a**
<br>`const 1 20`
<br>1
<br>
<br>
# Tuples

**Return the first element of a double tuple:**
<br>`fst (1, 2)`
<br>1
<br>
<br>
**Return the second element of a double tuple:**
<br>`snd (1, 2)`
<br>2
<br>
<br>
