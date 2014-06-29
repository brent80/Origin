import System.Random

main = do
     gen1 <- newStdGen
     putStr $ take 1 (randomRs ('a','z') gen1)
     gen2 <- newStdGen
     putStr $ take 1 (randomRs ('#','&') gen2)
     gen3 <- newStdGen
     putStr $ take 2 (randomRs ('A','Z') gen3)
     gen4 <- newStdGen
     putStr $ take 2 (randomRs ('0','9') gen4)
     gen5 <- newStdGen
     putStr $ take 2 (randomRs ('a','z') gen5)
     gen6 <- newStdGen
     putStrLn $ take 2 (randomRs ('0','9') gen6)