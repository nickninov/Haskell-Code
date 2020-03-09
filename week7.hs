import Data.List 

type Length = Double
type Width = Double
type Height = Double
type Radius = Double
type Edge = Double

type Area = Double
type Volume = Double

-- A function that calculates the root of a number
root :: (Integral a, Floating b) => a -> b -> b 
n `root` x = x ** (1 / fromIntegral n)

-- 1. Following the example of a data type for 2D shapes discussed in the lecture, 
-- define a data type for 3D shapes, i.e., cubes, spheres, tetraeder, pyramids 
data Shapes3D = Cube Edge | Sphere Radius 
                | Tetraeder Edge | Pyramid Length Height Width

-- 2. For the 3D shape data type from the previous exercise, 
-- write two methods calculating volume and surface area for each 3D shape.

-- Volume
volume :: Shapes3D -> Volume
volume (Cube e) = e ^ 3
volume (Sphere r) = (4.0 / 3.0) * 3.14 * (r ^ 3)
volume (Tetraeder e) = (e ^ 3) / (6 * (2 `root` 2))
volume (Pyramid l h w) = (l * h * w) / 3

-- Area
area :: Shapes3D -> Area
area (Cube e) = 6 * (e ^ 2)
area (Sphere r) = 4 * 3.14 * (r ^ 2)
area (Tetraeder e) = (2 `root` 3) * (e ^ 2)


data Move = North | East | South | West 
    deriving Show
type Pair = (Int, Int)

-- 3. Write a recursive method moves that takes a list of moves and a starting position, 
-- and returns a position.

move :: Move -> Pair -> Pair
move North (x, y) = (x, y+1)
move East (x, y) = (x+1, y)
move South (x, y) = (x, y-1)
move West (x, y) = (x-1, y)

moves :: [Move] -> Pair -> Pair
moves [] (x, y) = (x, y)
moves ms (x, y) = do
    -- Update pair
    let newPair = move (head ms) (x, y)
    moves (tail ms) ((fst newPair), (snd newPair))

-- 4. Write a method reverse that returns the opposite to a move. 
-- E.g., reverse North should return South, etc.

reverseMove :: Move -> Move
reverseMove North = South
reverseMove South = North
reverseMove East = West
reverseMove West = East

-- 5. Define a function balanced:: Tree a -> Bool 
-- that decides if a binary tree is balanced or not

data TreeBal a = LeafBal a | NodeBal (TreeBal a) (TreeBal a) deriving Show

data Tree a = Empty | Branch a (Tree a) (Tree a)                                                                                                               
    deriving (Show, Eq)
                                                                                                                                    
balanced :: TreeBal Int -> Bool
balanced (LeafBal _) =  True
balanced (NodeBal l r) = (diffLeaves <= 1) && balanced l && balanced r                                                                                                                                                     
    where
        diffLeaves = abs (numLeaves l - numLeaves r)
        numLeaves:: TreeBal Int -> Int
        numLeaves (LeafBal _) =  1
        numLeaves (NodeBal l r) = numLeaves l + numLeaves r


-- 6. Define a function balance :: [a] -> Tree a 
-- that converts a non-empty list into a balanced tree. 
-- First define a function that splits a list into two halves whose length differs by at most 1.

balance :: [a] -> TreeBal a
balance []  =  error "Provide a list that is non-empty!"
balance [x] =  LeafBal x
balance xs  =  NodeBal (balance (fst (halveList xs))) (balance (snd (halveList xs)))  

halveList :: [a] -> ([a],[a])
halveList [] = ([],[])
halveList xs = splitAt (half xs) xs
  where
    half :: [a] -> Int
    half xs = div (length xs) 2 

-- 7. Write a function that will determine the height of a tree, i.e., 
-- the largest number of hops from the root to a leaf.

data TreeDos a = Nil | Node a (TreeDos a) (TreeDos a)
        deriving (Eq,Show)

height :: (Ord a, Num a) => TreeDos a -> a
height Nil = -1
height (Node k l r) = 1 + (max (height l) (height r))