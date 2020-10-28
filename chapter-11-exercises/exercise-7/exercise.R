# Exercise 7: using dplyr on external data

# Load the `dplyr` library


# Use the `read.csv()` function to read in the included data set. Remember to
# save it as a variable.
nba_teams_2016 <- read.csv("data/nba_teams_2016.csv")

# View the data frame you loaded, and get some basic information about the 
# number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" following
# the names of teams that made it to the playoffs that year.
View(nba_teams_2016)
ncol(nba_teams_2016)
nrow(nba_teams_2016)
# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
nba_teams_2016 <- mutate(
  nba_teams_2016, 
  turnover_steal_ratio = TOV / STL)

# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest turnover/steal ratio?
nba_teams_2016 <- arrange(nba_teams_2016, -turnover_steal_ratio)
tail(nba_teams_2016)
# Using the pipe operator, create a new column of assists per game (AST / G) 
# AND sort the data.frame by this new column in descending order.
nba_teams_2016 <- nba_teams_2016 %>%
  mutate(assists_per_game = AST / G) %>%
  arrange(-assists_per_game)

# Create a data frame called `good_offense` of teams that scored more than 
# 8700 points (PTS) in the season
good_offense <- nba_teams_2016 %>%
  filter(PTS > 8700)

# Create a data frame called `good_defense` of teams that had more than 
# 470 blocks (BLK)
good_defense <- nba_teams_2016 %>%
  filter(BLK > 470)

# Create a data frame called `offense_stats` that only shows offensive 
# rebounds (ORB), field-goal % (FG.), and assists (AST) along with the team name.
offense_stats <- nba_teams_2016 %>%
  select(Team, ORB, FG., AST)

# Create a data frame called `defense_stats` that only shows defensive 
# rebounds (DRB), steals (STL), and blocks (BLK) along with the team name.
defense_stats <- nba_teams_2016 %>%
  select(Team, DRB, STL, BLK)

# Create a function called `better_shooters` that takes in two teams and returns
# a data frame of the team with the better field-goal percentage. Include the 
# team name, field-goal percentage, and total points in your resulting data frame
better_shooters <- function(team_one, team_two) {
  row_team_one <- filter(nba_teams_2016, Team == team_one)
  row_team_two <- filter(nba_teams_2016, Team == team_two)
  if(row_team_one[["FG."]] > row_team_two[["FG."]]) {
    select(row_team_one, Team, FG., PTS)
  }
  else{
    select(row_team_two, Team, FG., PTS)
  }
}

# Call the function on two teams to compare them (remember the `*` if needed)
better_shooters("Boston Celtics*", "Denver Nuggets")
