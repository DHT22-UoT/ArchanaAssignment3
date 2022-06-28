# Special Topics in Biomedical Communications
# Assignment 3
# June 24, 2022
# Archana Jeyagaran

# load txt file with dictionary of words 
setwd("~/Users/olivia/Desktop/Masters/Summer 2022 Term/Special Topics - Coding in R/ArchanaAssignment3")
# get working directory 
getwd()

# Read word list 
fruits <- scan(file="HangmanFruits.txt", what="", sep = "\n")

# separate elements with one or more whitespace
fruitsdata <- strsplit(fruits, "[[:space:]]+") # you should use this on the random chosen word instead to create
# a list of letters that the user must guess from 

# Choose a random element from the list
randomword <- fruitsdata[sample(1:length(fruitsdata),size=1)]
# removed second set of square brackets around as they were not necessary 

# Inform the user on the length of the secret word
numberofletters<-nchar(randomword, allowNA = F)
letters <- as.list(strsplit(randomword, "")[[1]]) 

print(letters) 
print(paste("Your word contains",numberofletters, "letters"))


# Inform the user about the number of wrong guesses/tries allowed
incorrectattempts <- as.integer(0)
# incorrectattempts <- 0
# typeof(incorrectattempts) this can just be checked in the console

print(incorrectattempts) #instead of printing incorrect attempts let the user know
# how many incorrect attempts they have
print("You have 3 incorrect attempts. Good luck!")

# Ask for user input. The user is expected to enter one character only
while (incorrectattempts < 3) {
  input <- readline(paste("Please input one letter a-z. 
                          You have the following number of incorrect attempts left:", 
                          (3-incorrectattempts)))
 # if (input == "exit") { # gives the user an option to quit the game
   # break
  #} else if (input == randomword) { #gives the user the option to guess the entire word at once
  #  break
  #} else if (grepl("^[A-Za-z]+$", input_lettr, perl = T) == F) {
  #cat("\n Input letters ONLY!\n")) { 
  # } else if (nchar(input_lettr) > 1) {
  #cat("\n-> Please only guess ONE letter at a time!\n\n")
  #} else { ...} 

  # You could add something like this to help check for invalid inputs and give the users the option of exiting or 
  # guessing the entire word at once
  
  # Check to see if the user input is in the secret word
  if( input %in% letters) {
    # remove the input letter from the list of letters in randomword
    letters = letters[letters != input]
    print(letters)
    # If yes, notify user and ask for next letter
    print("This was a correct attempt")
    
  } else {
    # If not, notify user.
    print("Sorry your guess was incorrect")
    incorrectattempts = incorrectattempts + 1
  }
  # If user guesses all the letter, notify user that they’ve won. Reveal secret and exit.
  
  if(length(letters) == 0) {
    print("You Win! :)")
    print(paste("Your word was:", randomword))
  }
}
# If tries are exhausted, notify user that they’ve lost. Reveal secret and exit.
if (incorrectattempts >=3) {
  print("Sorry you lost :(")
  print(paste("The word was: ", randomword))

  }

# Really good game!! It runs smoothly and was fun to play. 
# I think that the vector holding "letters" is the only issue, if you could find a way to make 
# letter = a list of only the letters in randomword, this would fix any bugs in the game. 
