-- Question 1 - Select ONE answer for each section.

-- a) The expression [(1,True),(0,False)] has type:
--      a. String
--      b. [(Int,Bool)]
--      c. (Int,Bool)
--      d. [Int,Bool]
--      e. [(Int,Bool),(Int,Bool)]

-- Answer: b. [(Int,Bool)]

-- b) A function of type Int -> Int -> Int:
--      a. Is a curried function
--      b. Takes three arguments
--      c. Is a polymorphic function
--      d. Is an overloaded function
--      e. Takes a function as its argument

-- Answer: a. Is a curried function

-- c) Evaluating sum [x*2 | x <- [1..10], even x] gives:
--      a. 0
--      b. 30
--      c. 60
--      d. 110
--      e. 220

{-
    Answer: c. 60

    Solution:

        Numbers from list:
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10

        Even numbers from list:
        2, 4, 6, 8, 10

        Multiply by 2:
        4, 8, 12, 16, 20

        Sum:
        12 + 12 + 16 + 20 = 
        = 24 + 16 + 20 = 
        = 40 + 20 = 60
-}

-- d) The function twice defined by twice g x = g (g x) has type:
--      a. a -> a -> a
--      b. (a -> a) -> a -> a
--      c. a -> (a -> a) -> a
--      d. a -> a -> (a -> a)
--      e. a -> a -> a -> a

-- Answer: b. (a -> a) -> a -> a

-- e) Which of the following statements about Haskell is false:
--      a. Recursive functions can have more than one base case
--      b. All functions are guaranteed to terminate
--      c. Function application brackets to the left
--      d. All type errors are detected at compile time

-- Answer:  d. All type errors are detected at compile time

-- f) The expression Node (Node Leaf Leaf) Leaf is a value of the type:
--      a. data Tree = Node | Leaf
--      b. data Tree = Leaf Tree | Node
--      c. data Tree = Leaf | Node Tree Tree
--      d. data Tree = Leaf Tree | Node Tree Tree

-- Answer: c. data Tree = Leaf | Node Tree Tree

-- g) The expression [’a’,[’b’,’c’]]:
--      a. has type [Char]
--      b. has type [Char,[Char]]
--      c. has type [Char,[Char,Char]]
--      d. contains a type error

-- Answer: d. contains a type error

-- h) The function inc x = x+1 has type:
--      a. a -> a
--      b. int -> int
--      c. Num -> Num
--      d. Num a => a -> a

-- Answer: d. Num a => a -> a

-- Question 2

-- Define a recursive function triangle :: Int -> Int that returns the sum of
-- all the natural numbers from its argument down to zero (inclusive). For example,
-- triangle 4 should return 10 (4 + 3 + 2 + 1 + 0).

-- Answer:
triangle :: Int -> Int
triangle 0 = 0
triangle num = num + triangle (num - 1)

-- The Fibonacci numbers are given by the sequence 0,1,1,2,3,5,8,13, ... in which
-- the first two numbers are 0 and 1, and each subsequent number is the sum of the
-- previous two numbers. Using pattern matching and recursion, define a function
-- fib :: Int -> Int that returns the nth Fibonacci number for any n ≥ 0. For
-- example, fib 3 should return 2.

-- Answer:
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- What are the types of the following values?
--      a. [False,True,False]
--      b. (False,’a’)
--      c. [(False,’0’),(True,’1’)]
--      d. ([’a’,’b’],[False,True])
--      e. [reverse, tail, take 3]

{-
    Answers:

        a. [False,True,False] - [Bool]

        b. (False,’a’) - (Bool, Char)

        c. [(False,’0’),(True,’1’)] - [(Bool, Char)]

        d. ([’a’,’b’],[False,True]) - ([Bool], [Char])

        e. [reverse, tail, take 3] - [[a] -> [a]]
-}

-- Quetion 3

-- Explain how types are used in Haskell. As part of your answer, discuss the
-- various features the language provides for constructing types. Illustrate each of
-- the concepts that you mention with a small example in Haskell.

{-
    Answer:
    
    In Haskell, a new name for an existing type can be defined using a type declaration.
    Type declarations can be used to make other types easier to read. Like function definitions,
    type declarations can also have parameters.

    Example:

        type String = [Char]
        type Pos = (Int,Int)
        type Pair a = (a,a)

    A completely new type can be defined by specifying its values using a data declaration.
    Values of new types can be used in the same ways as those of built in types.
    The constructors in a data declaration can also have parameters.
    Data declarations themselves can also have parameters.

    Example:
        
        data Bool = False | True
        data Answer = Yes | No | Unknown
        data Shape = Circle Float | Rect Float Float
-}

-- Explain the terms “Recursion”, “Curried function” and “Higher-order function” and
-- give an example for each.

{-
    Answer:

        Recursion - a function that is defined in itself. Every recursion must have a base case
        otherwise the function will execute until it reaches a stack overflow. 
        Recursion is not restricted to numbers, but can also be used to define functions on lists. 

        Curried function - only takes one parameter at a time. 
        When you break downbreak down a function that takes multiple arguments 
        into a series of functions that each take only one argument.

        multThree :: (Num a) => a -> a -> a -> a  
        multThree x y z = x * y * z  

        how arguments are taken:
            a -> (a -> (a -> a))

        Higher-order function - a function that takes a function as parameters 
        and returns a function

        twice :: (a -> a) -> a -> a  
        twice f x = f (f x) 

        zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]  
        zipWith _ [] _ = []  
        zipWith _ _ [] = []  
        zipWith f (x:xs) (y:ys) = f x y : zipWith' f xs ys  
-}

-- Question 4

-- Consider the following datatype of trees: data Tree = Leaf Int | Node Tree Tree

-- Write down three different values of type Tree with the property that all the leaves
-- in each example contain the integer zero

-- Answer:

data Tree = Leaf Int | Node Tree Tree
    deriving (Show)

treeProps :: IO ()
treeProps = do
    let tree1 = Leaf 0
    let tree2 = Node (Leaf 0) (Leaf 0)
    let tree3 = Node (Node (Leaf 0) (Leaf 0)) (Node (Leaf 0) (Leaf 0))

    putStr "Tree 1: "
    putStr $ show tree1

    putStr "\n\nTree 2: "
    putStr $ show tree2

    putStr "\n\nTree 3: "
    putStrLn $ show tree3


-- Define a function depth :: Tree -> Int that calculates the depth of a tree,
-- where the depth is given by the number of nodes in the longest path from the root
-- of the tree to a leaf in the tree

-- Answer:

treeDepth :: Tree -> Int
treeDepth (Leaf _) = 0
treeDepth (Node leftSubtree rightSubtree) = 
  1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)

-- Let us say that a tree is full if every node has the property that the number of
-- leaves in its left and right subtrees are equal. Using size, define a function full
-- :: Tree -> Bool that decides if a tree is full.

balanced :: Tree -> Bool
balanced (Leaf _) =  True
balanced (Node l r) = (diffLeaves <= 1) && balanced l && balanced r                                                                                                                                                     
    where
        diffLeaves = abs (numLeaves l - numLeaves r)
        numLeaves:: Tree -> Int
        numLeaves (Leaf _) =  1
        numLeaves (Node l r) = numLeaves l + numLeaves r