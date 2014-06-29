import System.IO
import System.Random
import System.Exit

main = do
       handle <- openFile "enable1.txt" ReadMode
       contents <- hGetContents handle
       gen <- newStdGen
       let words = map init (lines contents)
           (n,_) = randomR (0, (length words) - 1) gen :: (Int, StdGen)
	   word = words !! n
       play word (map (\x -> '_') word) 6
       hClose handle

play word known guesses
     | word == known = do
       	       	       putStrLn known
		       putStrLn "You win!"
                       putStrLn ("Would you like to play again? Enter \"yes\" or \"no\"")
		       line1 <- getLine
		       if line1 == "yes"
		          then do
			       putStrLn ("Let's do it!")
 			       main
			  else do
			       exitSuccess
                       main
     | guesses == 0  = do
       	       	       putStrLn known
		       putStrLn "HANGMAN YOU HUNG YOURSELF"
		       putStrLn "  +---+";
		       putStrLn "  |   |";
		       putStrLn "  0   |";
		       putStrLn " /|\\  |";
		       putStrLn " / \\  |"	
		       putStrLn "      |";
		       putStrLn "=========";
		       putStrLn ("You lose. The word was " ++ word ++ ".")
		       putStrLn ("Would you like to play again? Enter \"yes\" or \"no\"")
		       line1 <- getLine
		       if line1 == "yes"
		          then do
			       putStrLn ("Let's do it!")
 			       main
			  else do
			       exitSuccess
                       main
     | otherwise     = do
		       case guesses of
		         1 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
			      	   putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "  0   |";
			           putStrLn " /|\\  |";
			           putStrLn " /    |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
		         2 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
			      	   putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "  0   |";
			           putStrLn " /|\\  |";
			           putStrLn "      |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
			 3 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
			           putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "  0   |";
			           putStrLn " /|   |";
			           putStrLn "      |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
                         4 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
			      	   putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "  0   |";
			           putStrLn "  |   |";
			           putStrLn "      |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
                         5 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
			      	   putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "  0   |";
			           putStrLn "      |";
			           putStrLn "      |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
                         6 -> do { putStrLn "HANGMAN DON'T HANG YOURSELF";
                                   putStrLn "  +---+";
			           putStrLn "  |   |";
			           putStrLn "      |";
			           putStrLn "      |";
			           putStrLn "      |";  
			           putStrLn "      |";
				   putStrLn "=========";
				   putStrLn known;
		       		   putStrLn ("You have " ++ (show guesses) ++ " guesses left.") }
		       line <- getLine
                       if null line
		           then do 
                                putStrLn ("You forgot to put in a letter.")
				play word known guesses
			   else do 
                                let (newKnown, newGuesses) = handle (head line) word known guesses
		                play word newKnown newGuesses



handle letter word known guesses
       | letter `elem` word = (zipWith (\w k -> if w == letter then w else k) word known, guesses)
       | otherwise          = (known, guesses - 1)
       	       	       
