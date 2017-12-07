module Main where

import           Control.Applicative ()
import           Data.List           (sort)

checksumRow :: [Integer] -> Integer
checksumRow xs = last sorted - head sorted
  where
    sorted = sort xs

checksum :: [[Integer]] -> Integer
checksum = sum . map checksumRow

evenDivisors :: [Integer] -> [(Integer, Integer)]
evenDivisors xs =
  [(x, y) | x <- sorted, y <- reverse sorted, (x `mod` y) == 0, x /= y]
  where
    sorted = sort xs

diffFirstEvenDivisors :: [Integer] -> Integer
diffFirstEvenDivisors xs = uncurry div $ head $ evenDivisors xs

main :: IO ()
main = do
  input <- readFile "input.txt"
  let vals = map read . words <$> lines input
  print $ checksum vals
  print $ sum $ diffFirstEvenDivisors <$> vals
