
import Data.Char
import Data.List

type Link = String
type Name = String
type Email = String
type HTML = String
type URL = String

-- 1. Write a function sameString :: String -> String -> Bool
-- that returns True when two strings are the same, 
-- but ignores whether a letter is in upper- or lowercase. For example:

-- sameString "aa" "bb" False
-- sameString "aa" "aa" True

toLowerWord :: String -> String
toLowerWord word = [toLower letter | letter <- word]

sameString :: String -> String -> Bool
sameString str1 str2 
    | toLowerWord str1 == toLowerWord str2 = True
    | otherwise = False


-- 2. Write a function prefix :: String -> String -> Bool 
-- that checks whether the first string is a prefix of the second, 
-- like the library function isPrefixOf that you used before, but 
-- this time it should be case - insensitive.

-- prefix "bc" "abCDE" False
-- prefix "bc" "BcabCDE" True

prefix :: Eq a => [a] -> [a] -> Bool
prefix [] [] = True
prefix [] _ = True
prefix _ [] = False
prefix (x:xs) (y:ys) = (x == y) && (prefix xs ys)


-- 3. Write a case-insensitive function contains that checks 
-- if the second string is a substring of the first. For example:

-- contains "abcde" "bd" False
-- contains "abCDe" "Bc" True

contains :: String -> String -> Bool
contains string word = isInfixOf (toLowerWord word) (toLowerWord string)

-- 4. (a) Write a case-insensitive function takeUntil :: String -> String -> String 
-- that returns the contents of the second string before the first occurrence 
-- of the first string. If the second string does not contain the first as a substring, 
-- return the whole string. E.g.:

-- takeUntil "cd" "abcdef" "ab"
takeUntil :: String -> String -> String
takeUntil [] [] = []                           --don't need this
takeUntil xs [] = [] 
takeUntil [] ys = [] 
takeUntil xs (y:ys) = 
    if isPrefixOf (toLowerWord xs) (toLowerWord (y:ys))
        then []
    else y : (takeUntil xs (tail (y:ys)))
        


-- (b) Write a case-insensitive function dropUntil :: String -> String -> String 
-- that returns the contents of the second string after the first occurrence of 
-- the first string. If the second string does not contain the first as a substring, 
-- return the empty string. E.g.:

-- dropUntil "cd" "abcdef" 
-- "ef"
dropUntil :: String -> String -> String
dropUntil substr [] = ""
dropUntil substr str 
    | prefix (toLowerWord substr) (toLowerWord str) = drop (length substr) str
    | otherwise = dropUntil substr (tail str)


-- 5. (a) Write a case-insensitive function split :: String -> String -> [String] 
-- that divides the second argument at every occurrence of the first, 
-- returning the results as a list. The result should not include the separator. 
-- For example:

-- split "," "comma,separated,string" ["comma","separated","string"]
-- split "the" "to thE WINNER the spoils!" ["to "," WINNER "," spoils!"]
-- split "end" "this is not the end" ["this is not the "]

split :: String -> String -> [String]
split "" str  = error "Cannot split an empty string"
split sep str  
    | (toLowerWord str) `contains` (toLowerWord sep) = takeUntil sep str : split sep (dropUntil sep str)
    | otherwise = [str]



-- (b) Write a function reconstruct :: String -> [String] -> String 
-- that reverses the result of split. That is, it should take a string 
-- and a list of strings, and put the list of strings back together into one string,
-- with the first string everywhere in between (but not at the start or at the end).

-- reconstruct "a" ["faf","af"] "fafaaf"
-- reconstruct "," ["faf","af"] "faf,af"

reconstruct :: String -> [String] -> String
reconstruct _ [] = []
reconstruct _ [str] = str
reconstruct sep (str:strs) = str ++ sep ++ reconstruct sep strs

-- 6. Challenge – Write a screen scraper!
-- A “screen scraper” is a tool used to extract data from web sites, 
-- by looking at their source. In this exercise, you will write 
-- one of the most hated screen scrapers: 
-- one that extracts email addresses. Why is it hated? 
-- Because people use screen scrapers like that to collect email addresses 
-- to send spam to. However, in this exercise we will show you a useful purpose
-- of the email screenscraper! We are going to be extracting names and emails 
-- from web pages written in HTML (HyperText Markup Language). 


testAddrBook :: [(Name,Email)]
testAddrBook = [ ("Don Sannella","dts@inf.ed.ac.uk"), ("Chris Banks","c.banks@ed.ac.uk")]

testHTML :: String
testHTML =    "<html>"
           ++ "<head>"
           ++ "<title>FP: Tutorial 4</title>"
           ++ "</head>"
           ++ "<body>"
           ++ "<h1>A Boring test page</h1>"
           ++ "<h2>for tutorial 4</h2>"
           ++ "<a href=\"http://www.inf.ed.ac.uk/teaching/courses/inf1/fp/\">FP Website</a><br>"
           ++ "<b>Lecturer:</b> <a href=\"mailto:dts@inf.ed.ac.uk\">Don Sannella</a><br>"
           ++ "<b>TA:</b> <a href=\"mailto:c.banks@ed.ac.uk\">Chris Banks</a>"
           ++ "</body>"
           ++ "</html>"

linksFromHTML :: HTML -> [Link]
linksFromHTML doc = tail (split "<a href=\"" doc)

testLinksFromHTML :: Bool
testLinksFromHTML = linksFromHTML testHTML == testLinks

takeEmails :: [Link] -> [Link]
takeEmails links = [link | link <- links, prefix "mailto:" link]

link2pair :: Link -> (Name, Email)
link2pair link 
    | link `contains` "mailto:" = (name, email)
    | otherwise = error "link2pair: not a mail adress"
    where 
        email = takeUntil "\">"  (dropUntil "mailto:" link)
        name  = takeUntil "</a>" (dropUntil "\">" link)

emailsFromHTML :: HTML -> [(Name,Email)]
emailsFromHTML html = nub [link2pair link | link <- takeEmails (linksFromHTML html)]

testEmailsFromHTML :: Bool
testEmailsFromHTML = emailsFromHTML testHTML == testAddrBook

findEmail :: Name -> [(Name, Email)] -> [(Name, Email)]
findEmail name addrs = [(n, e) | (n, e) <- addrs, n `contains` name]

emailsByNameFromHTML :: HTML -> Name -> [(Name,Email)]
emailsByNameFromHTML html name = findEmail name (emailsFromHTML html)