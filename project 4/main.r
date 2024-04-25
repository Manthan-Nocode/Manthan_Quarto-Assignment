library(readxl)
library(dplyr)
library(ggplot2)
library(ggmap)
library(broom)

# Load data
indicator_data <- read_excel("unicef_indicator_1.xlsx")
metadata_data <- read_excel("unicef_metadata.xlsx")

# Merge data based on country codes and year
combined_data <- merge(indicator_data, metadata_data, by.x = c("alpha_2_code", "time_period"), by.y = c("alpha_2_code", "year"))

# Select relevant columns and filter out NA values for GDP for simplicity
combined_data <- combined_data %>%
  select(Country = Country.x, alpha_2_code, year = time_period, Child_Deprivation = obs_value,
         GDP_per_capita = `GDP per capita (constant 2015 US$)`) %>%
  na.omit()