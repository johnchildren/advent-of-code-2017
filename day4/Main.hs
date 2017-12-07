module Main where

import           Control.Applicative ()
import           Data.List           (permutations)
import qualified Data.Set            as Set

isSet :: Ord a => [a] -> Bool
isSet xs = length xs == Set.size (Set.fromList xs)

totalValid :: [Bool] -> Integer
totalValid =
  foldl
    (\x cond ->
       if cond
         then x + 1
         else x)
    0

main :: IO ()
main = do
  input <- readFile "input.txt"
  let phrases = lines input
      validPhrases = isSet . words <$> phrases
      validPhrases' = isSet . concatMap permutations . words <$> phrases
  print $ totalValid validPhrases
  print $ concatMap permutations $ words "oiii ioii"
  print $ totalValid validPhrases'

