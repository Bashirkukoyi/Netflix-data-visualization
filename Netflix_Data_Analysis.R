# Load necessary libraries
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("readr")) install.packages("readr")

library(ggplot2)
library(dplyr)
library(readr)

# Load the dataset
df <- read_csv('netflix_shows_movies.csv')

# Display the first few rows of the dataset
print(head(df))

# Ensure that the 'type' column is present
if (!"type" %in% colnames(df)) {
  stop("Required column 'type' is not present in the dataset.")
}

# Most watched types
type_counts <- df %>%
  count(type) %>%
  arrange(desc(n)) %>%
  head(10)  # Adjust the number of types to display if needed

# Plot the bar plot using ggplot2
ggplot(type_counts, aes(x = reorder(type, n), y = n)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +  # Flip the coordinates for better readability
  labs(title = "Most Watched Genre",
       x = "Genre",
       y = "Count") +
  theme_minimal()
