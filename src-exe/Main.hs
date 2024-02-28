module Main where
import Prelude
import System.Random

words = ["chipi", "chapa", "dubi", "daba"]
correct = [0..3]

--Basic "replace element x with y in list z" kinda function
replace::Int -> a -> [a] -> [a]
replace a b x = take a x ++ [b] ++ drop (a+1) x

--Swap elements around using replace function
swap::Int -> Int -> [b] -> [b]
swap a b x = replace b (x!!a) $ replace a (x!!b) x

--Random shuffle with recursion
shuffle:: RandomGen gen =>[Int] -> [Int] -> gen -> [Int]
shuffle x [] _ = x
shuffle [] _ _ = []
shuffle x (y:ys) gen
  | len <= 0 = x
  | otherwise = shuffle (swap y randIndex x) ys gen'
  where
    len = length ys
    (randIndex, gen') = randomR (0, len-1 ) gen

--Loop shuffle til index == correct
loop::[Int] -> [Int] -> IO ()
loop x y = do
  gen <- newStdGen
  let index = shuffle x y gen

  mapM_ (\i -> putStr (show (Main.words!!i) ++ " " ++ show (Main.words!!i) ++ " ")) index
  
  if index == correct then return () else loop x y


main :: IO ()
main = do

  loop correct correct
  
  putStr "mágico mi dubi dubi boom boom boom boom\n"
