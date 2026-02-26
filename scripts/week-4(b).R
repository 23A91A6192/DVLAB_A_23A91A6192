# Load dataset
data(airquality)

# Inspect the data
?airquality
View(airquality)
str(airquality)
class(airquality)

# Boxplot for Solar.R
boxplot(airquality$Solar.R,
        main = "Box plot for Solar Radiation",
        ylab = "Solar Radiation",
        col = "orange")

# Convert Month into factor
airquality$Month <- as.factor(airquality$Month)

# Grouped Boxplot for Solar.R by Month
boxplot(Solar.R ~ Month,
        data = airquality,
        main = "Solar Radiation by Month",
        xlab = "Month",
        ylab = "Solar Radiation",
        col = c('pink','lightgreen','skyblue','orange','purple'))

# Multi-variable box plot (only Solar.R column)
boxplot(airquality$Solar.R,
        main = "Solar Radiation Box Plot",
        col = "skyblue")

# Custom Color Palette
month_colors <- c(
  "5" = "red",
  "6" = "steelblue",
  "7" = "green",
  "8" = "purple",
  "9" = "orange"
)


boxplot(Solar.R ~ Month,
        data = airquality,
        main = "Solar Radiation by Month (Custom Color Palette)",
        col = month_colors)

# Using ggplot
library(ggplot2)

# Basic ggplot boxplot
ggplot(airquality,
       aes(x = Month, y = Solar.R, fill = Month)) +
  geom_boxplot()

# Manual Color Palette in ggplot
ggplot(airquality,
       aes(x = Month, y = Solar.R, fill = Month)) +
  geom_boxplot() +
  scale_fill_manual(
    values = c(
      "5" = "red",
      "6" = "steelblue",
      "7" = "green",
      "8" = "purple",
      "9" = "orange"
    )
  ) +
  theme_minimal()