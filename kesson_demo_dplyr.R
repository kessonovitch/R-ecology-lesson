# dplyr tutorial 20Jan20 
# Kesson's demo script

# load tidyverse packages
library(tidyverse)

# load data
surveys <- read_csv("https://ndownloader.figshare.com/files/2292169")

# ways to inspect data
surveys
str(surveys)
# view(surveys)
#nnote how I put a # in front of the line of code view(surveys) because I don't necessarily want to run it every time I run this script. Some people will also include a note saying #NOT RUN before code they leave in place but don't need every time.

# select data
select(surveys, c(plot_id, species_id, weight))

surveys2 <- select(surveys, c(plot_id, species_id, weight))

# exclude varables
select(surveys, -record_id, -species_id)

#select cases
filter(surveys, year == 1977)

#pipes to perform a series of commands
surveys %>%
  filter(., weight<5) %>%
  select(., species_id, sex, weight)

#this makes a new object from our piped creation
surveys3 <- surveys %>%
  filter(., weight<5) %>%
  select(., species_id, sex, weight)

#generate new variables with mutate
surveys %>%
  mutate(weight_kg <- weight/1000)

#overwrite our previous version of surveys with a larger dataset containing two additional variables.
surveys <- surveys %>%
  mutate(weight_kg = weight/1000,
         weight_lbs = weight_kg * 2.2)

# how we might return surveys to its original size
surveys <- surveys %>%
  select(., - weight_kg, - weight_lbs)

# an example of how we might group data, then summarise it.
surveys %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight, na.rm = TRUE))

