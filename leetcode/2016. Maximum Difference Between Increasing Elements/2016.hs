-- https://godbolt.org/z/5nKKfqT9M
maxDifference :: (Ord a, Num a) => [a] -> a
maxDifference 
    = (\x -> if x <1 then -1 else x)
    . foldl max (-1) 
    . (zipWith (-) <*> scanl1 min)

main :: IO ()
main = do
    print $ maxDifference [7, 1, 5, 4] -- 4
    print $ maxDifference [9, 4, 3, 2] -- -1
    print $ maxDifference [1, 5, 2, 10] -- 9
