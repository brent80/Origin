main :: IO ()
main = do
     putStrLn "Let's divide some numbers, please enter the Numerator: "
     numerator <- getLine
     putStrLn "Please enter the Denominator: "
     denominator <- getLine
     putStr (numerator ++ " / " ++ denominator ++ " =") 
     if numerator >= "a"
          then do putStrLn "Not a number you twit."
	  else if numerator >= "A"
	    then do putStrLn "Capital letter really?"
	    else if denominator >= "a"
	     then do putStrLn "Not a number silly Twit."
	     else if denominator >= "A"
	      then do putStrLn "No Capital Letters."
   	      else if show (read numerator / read denominator) == "Infinity"
     	       then do putStrLn "You can't divide by zero you idiot!"
     	        else putStrLn (" " ++ show (read numerator / read denominator)) 
	     
