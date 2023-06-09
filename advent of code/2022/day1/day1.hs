import Data.List (sort)
import Data.List.Split (splitOn)

maxCalories :: [[String]] -> [Int]
maxCalories = reverse . sort . map (sum . map read)

main :: IO ()
main = do
   input <- splitOn [""] . lines <$> readFile "input.txt"
   print $ head $ maxCalories input          -- part 1
   print $ sum . take 3 $ maxCalories input  -- part 2
