-- https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
countNegatives :: [[Int]] -> Int
countNegatives = length . filter (<0) . concat 

-- Tests
main :: IO()
main = do
    print $ countNegatives [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]] -- 8
    print $ countNegatives [[3,2],[1,0]] -- 0
