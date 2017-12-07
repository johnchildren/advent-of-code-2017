module Main where

oddSquares :: [Integer]
oddSquares = map (^ 2) [1,3 ..]

subtractors :: Integer -> [Integer] -> [Integer]
subtractors x = map (x -)

isPositive :: Integer -> Bool
isPositive x = signum x == 1

main :: IO ()
main = do
  input <- readFile "input.txt"
  let target = read input
      targetSubtractors = subtractors target oddSquares
      positiveTargetSubtractors = takeWhile isPositive targetSubtractors
      targetRemainer = last positiveTargetSubtractors

      lastSpiral = fromIntegral $ length positiveTargetSubtractors
      finalSpiral = lastSpiral + 1
      finalSpiralSideLength = (finalSpiral * 2) - 1

      sidePos = targetRemainer `mod` (finalSpiralSideLength - 1)
      displacement = abs $ sidePos - ((finalSpiralSideLength - 1) `div` 2)
    
  print $ finalSpiral + displacement - 1
