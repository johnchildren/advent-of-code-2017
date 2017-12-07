module Main where

import           Control.Applicative ()
import           Data.Char           (digitToInt)

solve :: (Integer, Integer) -> [Integer] -> (Integer, Integer)
solve (n, total) [] = (n, total)
solve (n, total) [x]
  | n == x = (n, total + x)
  | otherwise = (n, total)
solve (n, total) (x:xs)
  | x == head xs = solve (n, total + x) xs
  | otherwise = solve (n, total) xs

splitHalf :: [a] -> ([a], [a])
splitHalf xs = splitAt ((length xs + 1) `div` 2) xs

addIfEqual :: Integer -> Integer -> Integer
addIfEqual a b =
  if a == b
    then a + b
    else 0

solve' :: [Integer] -> Integer
solve' vals = sum $ zipWith addIfEqual xs ys
  where
    (xs, ys) = splitHalf vals

main :: IO ()
main = do
  fileContents <- readFile "input.txt"
  let vals = (fromIntegral . digitToInt) <$> init fileContents
  putStrLn "Part 1"
  print $ solve (0, head vals) vals
  putStrLn "Part 2"
  print $ solve' vals
