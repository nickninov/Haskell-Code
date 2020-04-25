-- 1. The lecture discussed an implementation of an instance of the Functor class 
-- for a binary tree with data in the leaves only. 
-- Define instances of the Functor class for the following type of binary trees:

-- a) Data in leaves and nodes: 
--      data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving Show

data Tree a = Leaf a | Node (Tree a) a (Tree a) 
    deriving Show

instance Functor Tree where
    fmap function (Leaf a) = Leaf (function a)
    fmap function (Node a b c) = Node (fmap function a) (function b) (fmap function c)

-- Demo of the fmap function
treeF :: IO()
treeF = do
    let a = Node (Leaf 8) 10 (Leaf 2)
    putStrLn $ show $ fmap (+3) a
    -- Creating a function fmap is the equivalent of using <$>
    putStrLn $ show $ (+3) <$> a


-- b) Data in nodes: 
--      data Tree a = Leaf | Node (Tree a) a (Tree a) deriving Show


data Tree a = Leaf | Node (Tree a) a (Tree a) 
    deriving Show

instance Functor Tree where
    fmap function Leaf = Leaf
    fmap function (Node a b c) = Node (fmap function a) (function b) (fmap function c)

-- Demo of the fmap function
treeF :: IO()
treeF = do
    let a = Node (Node (Leaf) 2 (Leaf)) 1 (Node (Leaf) 3 (Leaf))
    putStrLn $ show $ fmap (+3) a
    -- Creating a function fmap is the equivalent of using <$>
    putStrLn $ show $ (+3) <$> a


-- 2. The lecture discussed an example of a simple, 
-- hardcoded Finite State Machine (FSM) with three states. 
-- Implement in the same fashion a hardcoded FSM for the following four states:

data State = S0 | S1 | S2 | S3

transition :: State -> String -> Bool
-- State 0 transitions
transition S0 ('a':xs) = transition S1 xs
transition S0 ('b':xs) = transition S2 xs
-- State 1 transitions
transition S1 ('a':xs) = transition S2 xs
transition S1 ('b':xs) = transition S3 xs
-- State 2 transitions
transition S2 ('b':xs) = transition S2 xs
transition S2 ('a':xs) = transition S0 xs
-- State 3 transitions
transition S3 ('a':xs) = transition S3 xs
transition S3 ('b':xs) = transition S0 xs
-- Accept states
transition S2 [] = True
transition S3 [] = True
-- Reject states
transition S0 [] = False
transition S1 [] = False

-- Run the Finite State Machine
finiteStateMachine :: String -> Bool
finiteStateMachine string = transition S0 string
