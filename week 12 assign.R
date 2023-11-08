setwd("C:/Users/G VISHAL/Downloads/")

getwd()
data_file <- "MERGED2015_16_PP.csv"

my_data <- read.csv(data_file, na.strings = c("NULL", "PrivacySuppressed"))

head(my_data, n = 10)
data_dimensions <- dim(my_data)
num_colleges <- data_dimensions[1]  
num_variables <- data_dimensions[2] 

summary(as.numeric(my_data$ADM_RATE))
hist(as.numeric(my_data$ADM_RATE), main = "admission rate", xlab = "Rate")

summary(my_data$SATVRMID)
hist(my_data$SATVRMID, main = "median SAT critical reading score", xlab = "Score")

summary(my_data$MD_INC_DEBT_MDN)
hist(my_data$MD_INC_DEBT_MDN, main = "median debt for middle income families", xlab = "Debt")
