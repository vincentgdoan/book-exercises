# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string
is_twice_as_long <- function(word1, word2) {
  boolean <- nchar(word1) >= nchar(word2) * 2
  boolean
}
is_twice_as_long("apple","it")
# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!

is_twice_as_long("apple","five")
is_twice_as_long("applee","six")

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"

describe_difference <- function(word1, word2) {
  if(nchar(word1) > nchar(word2)) {
    n <- nchar(word1)-nchar(word2)
    cat("Your first string is longer by",n,"characters")
  }
  else if(nchar(word1) < nchar(word2)) {
    n <- nchar(word2)-nchar(word1)
    cat("Your second string is longer by",n,"characters")
  }
  else {
    print("Your strings are the same length!")
  }
}

describe_difference("dog","cats")
# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1
describe_difference("pumpkin", "organic")
describe_difference("fall", "organic")
describe_difference("autumn", "fall")
