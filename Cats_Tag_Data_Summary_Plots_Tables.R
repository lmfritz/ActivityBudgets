# This code is to generate a plot of all CATS Tag Deployments to date that will be used for Lauren's first chapter for her dissertation

#Loading packages 
library(tidyverse)
library(lubridate)

# Load data
tags <- read_csv("CATS_Tag_Deployments_By_Month_Year.csv")

# Make Month_Name an ordered factor (important for plotting)
tags <- tags %>%
  mutate(
    Month_Name = factor(
      Month_Name,
      levels = c("January","February","March","April","May","June",
                 "July","August","September","October","November","December")
    )
  )

# When do deployments happen, and does that shift across years?
library(ggplot2)

cool_cb_palette <- c(
  "#08306B",  # very dark navy
  "#08519C",  # dark blue
  "#2171B5",  # strong blue
  "#4292C6",  # medium blue
  "#6BAED6",  # light blue
  "#9ECAE1",  # pale blue
  "#C6DBEF"   # very pale blue
)

ggplot(tags, aes(x = Month_Name, fill = factor(Year))) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = cool_cb_palette) +
  labs(
    x = "Deployment Month",
    y = "Number of Tag Deployments",
    fill = "Year",
    title = "CATS Tag Deployments by Month and Year"
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    text = element_text(size = 12)
  )

# Seasonal deployment intensity - seasonal structure
tags %>%
  count(Month_Name) %>%
  ggplot(aes(x = Month_Name, y = n)) +
  geom_col(fill = "steelblue") +
  labs(
    x = "Month",
    y = "Number of Deployments",
    title = "Seasonal Distribution of CATS Tag Deployments"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    text = element_text(size = 12)
  )

# Do deployments shift spatially across months?

ggplot(tags, aes(x = Longitude, y = Latitude, color = Month_Name)) +
  geom_point(size = 3, alpha = 0.8) +
  coord_fixed() +
  labs(
    x = "Longitude",
    y = "Latitude",
    color = "Month",
    title = "Spatial Distribution of CATS Tag Deployments by Month"
  ) +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    legend.position = "right"
  )

#Creation of austral season bins
tags <- tags %>%
  mutate(
    Season = case_when(
      Month %in% c(11, 12) ~ "Early Summer",
      Month %in% c(1, 2)   ~ "Mid Summer",
      Month %in% c(3, 4)   ~ "Late Summer",
      TRUE ~ NA_character_
    )
  )

#Plots
ggplot(tags, aes(x = Season, fill = Season)) +
  geom_bar() +
  labs(
    x = "",
    y = "Number of Deployments",
    title = "CATS Tag Deployments by Austral Season"
  ) +
  theme_classic() +
  theme(text = element_text(size = 12))

#Generate a table of the tag deployments
tags <- read_excel("CATS_Tag_Deployments_By_Month_Year.xlsx")
deployment_table <- tags %>%
  select(Tag_ID, Year, Month)
deployment_table <- deployment_table %>%
  arrange(Year, Month, Tag_ID)
print(deployment_table, n = Inf)

library(gt)
library(webshot2)
library(dplyr)

deployment_table <- tags %>%
  select(Tag_ID, Year, Month) %>%
  arrange(Year, Month, Tag_ID)

gt_table <- deployment_table %>%
  gt() %>%
  tab_header(
    title = "CATS Tag Deployments by Month and Year"
  ) %>%
  cols_label(
    Tag_ID = "Tag ID",
    Year = "Year",
    Month = "Month"
  )

#Export as PNG
gtsave(
  gt_table,
  filename = "CATS_Tag_Deployments_Table.png"
)

