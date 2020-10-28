# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(dplyr)
library(nycflights13)
# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
colnames(flights)
??flights
# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- mutate(flights,
                  flight_delay = arr_delay - dep_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)

descending_flights <- arrange(flights, -flight_delay)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
descending_flights <- flights %>%
  mutate(flight_delay = arr_delay - dep_delay) %>%
  arrange(-flight_delay)


# Make a histogram of the amount of time gained using the `hist()` function
hist(descending_flights[["flight_delay"]], na.rm = TRUE)
?hist()
# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(descending_flights[["flight_delay"]], na.rm = TRUE)
# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created

headed_to_sea<- flights %>%
  filter(dest == "SEA") %>%
select(origin, dest, flight_delay)
  

# On average, did flights to SeaTac gain or loose time?
mean(headed_to_sea[["flight_delay"]], na.rm = TRUE)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
summary_air_time <- flights %>%
  filter(origin == "JFK") %>%
  filter(dest == "SEA") %>%
  summarize(
    average_air_time = mean(air_time, na.rm = TRUE),
    min_air_time = min(air_time, na.rm = TRUE),
    max_air_time = max(air_time, na.rm = TRUE)
  )
View(summary_air_time)  
