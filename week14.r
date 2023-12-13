library(tidyverse)
library(gridExtra)



gun_data <- read.csv("C:/Users/G VISHAL/Downloads/final R/full_data.csv", na = "NA")

# Question 1a
suicides <- filter(gun_data, intent == 'Suicide')
size = 2
outline = '#FAEBEFFF'
fillcolor = '#333D79FF'
data_about_males <- filter(suicides, sex == 'M')  # Updated variable name
data_about_females <- filter(suicides, sex == 'F')

plot_males <- ggplot(data = data_about_males) +
  geom_histogram(aes(age), color = outline, fill = fillcolor, binwidth = size) +
  ggtitle("Gun Suicides in Males") +
  scale_x_continuous(breaks = round(seq(min(data_about_males$age, na.rm = TRUE), max(data_about_males$age, na.rm = TRUE), by = 10), 1))

plot_females <- ggplot(data = data_about_females) +
  geom_histogram(aes(age), color = outline, fill = fillcolor, binwidth = size) +
  ggtitle("Gun Suicides in Females") +
  scale_x_continuous(breaks = round(seq(min(data_about_females$age, na.rm = TRUE), max(data_about_females$age, na.rm = TRUE), by = 10), 1))

grid.arrange(plot_males, plot_females, nrow = 2)

# Question 1b
homicides <- filter(gun_data, intent == 'Homicide')
data_about_males <- filter(homicides, sex == 'M')  # Updated variable name
data_about_females <- filter(homicides, sex == 'F')

plot_males <- ggplot(data = data_about_males) +
  geom_histogram(aes(age), fill = fillcolor, color = outline, binwidth = size) +
  ggtitle("Gun Homicides in Males") +
  scale_x_continuous(breaks = round(seq(min(data_about_males$age, na.rm = TRUE), max(data_about_males$age, na.rm = TRUE), by = 10), 1))

plot_females <- ggplot(data = data_about_females) +
  geom_histogram(aes(age), fill = fillcolor, color = outline, binwidth = size) +
  ggtitle("Gun Homicides in Females") +
  scale_x_continuous(breaks = round(seq(min(data_about_females$age, na.rm = TRUE), max(data_about_females$age, na.rm = TRUE), by = 10), 1))

grid.arrange(plot_males, plot_females, nrow = 2)

# Question 1c
# Change variable name from filtered_data to cleaned_data
cleaned_data <- gun_data %>% filter(intent %in% c("Suicide", "Homicide", "Accidental") & sex %in% c("M", "F") & !is.na(age))

# Create the table using group_by and summarise
intermediate_data <- cleaned_data %>%
  group_by(intent, sex) %>%
  summarise(mean = mean(age, na.rm = TRUE))

result <- spread(intermediate_data, key = sex, value = mean)

# Print the final table
print(result)


cleaned_data <- gun_data %>% filter(intent %in% c("Suicide", "Homicide", "Accidental") & !is.na(age))

# Create the table using group_by and summarise (rounding to two digits)
result1 <- cleaned_data %>%
  group_by(intent, sex) %>%
  summarise(mean_age = round(mean(age, na.rm = TRUE), 2))

# Pivot the table for better presentation
result_df1 <- spread(result1, key = sex, value = mean_age)

# Create a tableGrob
table_grob1 <- tableGrob(result_df1)

# Create a new plot with the table
new_plot <- grid.arrange(table_grob1)

# Show the new plot
print(new_plot)





