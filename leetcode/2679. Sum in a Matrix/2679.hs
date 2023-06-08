-- // https://leetcode.com/problems/sum-in-a-matrix/
import Data.List (transpose, sort)

matrixSum :: [[Int]] -> Int -- Generic: (Ord a, Num a) => [[a]] -> a
matrixSum = sum . map maximum . transpose . map sort

-- Tests
main :: IO()
main = do
    print $ matrixSum [[7,2,1],[6,4,2],[6,5,3],[3,2,1]] -- 15
    print $ matrixSum [[1]] -- 1
