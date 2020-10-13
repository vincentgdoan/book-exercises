# Exercise 2: using `*apply()` functions

# Create a *list* of 10 random numbers. Use the `runif()` function to make a 
# vector of random numbers, then use `as.list()` to convert that to a list
number_vector <- c(runif(10))
number_list <- as.list(number_vector)
# Use `lapply()` to apply the `round()` function to each number, rounding it to 
# the nearest 0.1 (one decimal place)
number_list <- lapply(number_list, round, .1)

# Create a variable 'sentence' that contains a sentence of text (something 
# longish). Make the sentence lowercase; you can use a function to help.
sentence <- "I want to go to sleep because I went to bed late."

# Use the `strsplit()` function to split the sentence into a vector of letters.
# Hint: split on `""` to split every character
# Note: this will return a _list_ with 1 element (which is the vector of letters)
sentence_list <- strsplit(sentence, "")

# Extract the vector of letters from the resulting list
sentence_vector<-sentence_list[[1]]

# Use the `unique()` function to get a vector of unique letters
?unique()
sentence_unique <- unique(sentence_vector)
# Define a function `count_occurrences` that takes in two parameters: a letter 
# and a vector of letters. The function should return how many times that letter
# occurs in the provided vector.
# Hint: use a filter operation!
count_occurences <- function(letter_vector, letter) {

  match <- letter == letter_vector
  number_occurences <-sum(match)
  number_occurences
}

# Call your `count_occurrences()` function to see how many times the letter 'e'
# is in your sentence.
count_occurences(sentence_vector, "s")

# Use `sapply()` to apply your `count_occurrences()` function to each unique 
# letter in the vector to determine their frequencies.
# Convert the result into a list (using `as.list()`).

list_occurence <- as.list(sapply(unique(sentence_vector), count_occurences, sentence_vector))

# Print the resulting list of frequencies
print(list_occurence)
