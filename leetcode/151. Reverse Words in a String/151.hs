-- https://leetcode.com/problems/reverse-words-in-a-string/
import Data.List (intercalate)

reverseWords :: [Char] -> [Char]
reverseWords =  intercalate " " . reverse . words

-- Tests
main :: IO()
main = do
    print $ reverseWords "the sky is blue"      -- "blue is sky the"
    print $ reverseWords "  hello world  "      -- "world hello"
    print $ reverseWords "a good   example"     -- "example good a"
