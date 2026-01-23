# Create a gantt chart for the white paper activity budget as this paper needs to be done by the end of the quarter or apparently I will be fired. 
# used Chatgpt to create code based on parameters/timeline I stated in White Paper for activity budget chapter 1

# Start by installing packages needed
install.packages(c("tidyverse", "lubridate", "shadowtext"))
library(tidyverse)
library(lubridate)
library(shadowtext)

#Then we move to listing the data we want to share
tasks <- tribble(
  ~task,                                              ~start,        ~end,          ~type,
  "Time–depth plot workflow (build + QA)",              "2026-01-21",   "2026-02-07",   "Methods",
  "Tag audits (82 total; ~41 workdays)",                "2026-01-21",   "2026-03-20",   "Analysis",
  "Raw data conversions (recent deployments)",         "2026-01-21",   "2026-02-10",   "Data",
  "Exploratory dive assessments (subset-based)",        "2026-02-10",   "2026-03-10",   "Analysis",
  "Activity budget estimations",                        "2026-03-01",   "2026-03-24",   "Analysis",
  "Chapter 1 writing + figures + revisions",            "2026-02-15",   "2026-03-29",   "Writing"
) %>%
  mutate(start = ymd(start),
         end   = ymd(end),
         task  = fct_rev(task))
# milestones
milestones <- tribble(
  ~label,                                ~date,
  "Workflow v1 + ~30 audits complete",   "2026-02-07",
  "Audits ~50% complete (41/82)",        "2026-02-14",
  "Audits ~75% complete (~60/82)",       "2026-03-01",
  "Audits complete (82/82)",             "2026-03-20",
  "Chapter deliverable (end of WQ)",     "2026-03-29"
) %>% mutate(date = ymd(date))

milestones2 <- milestones %>% mutate(task = "Milestones")

# specify color palette
cb_palette <- c(
  "Analysis" = "#4B3F72",
  "Methods"  = "#4A78A6",
  "Data"     = "#3A8F8B",
  "Writing"  = "#9A5C7A"
)

#generate the plot
install.packages("ggforce")
library(ggforce)

bar_height <- 0.35

ggplot(tasks) +
  ggforce::geom_roundrect(
    aes(
      xmin = start,
      xmax = end,
      ymin = as.numeric(task) - bar_height,
      ymax = as.numeric(task) + bar_height,
      fill = type
    ),
    r = unit(3, "pt")
  ) +
  
  # Milestone vertical lines
  geom_vline(
    data = milestones,
    aes(xintercept = date),
    linewidth = 0.5,
    linetype = "dashed",
    alpha = 0.6
  ) +
  
  # Milestone labels with white halo (Option A)
  shadowtext::geom_shadowtext(
    data = milestones2,
    aes(x = date, y = "Milestones", label = label),
    angle = 90,
    size = 3.5,
    colour = "black",
    bg.colour = "white",
    bg.r = 0.12
  ) +
  
  # Scales
  scale_color_manual(values = cb_palette) +
  scale_x_date(
    limits = c(ymd("2026-01-21"), ymd("2026-03-29")),
    date_breaks = "2 weeks",
    date_labels = "%b %d"
  ) +
  scale_y_discrete(expand = expansion(add = c(0.6, 1.8))) +
  
  # Labels
  labs(
    x = NULL,
    y = NULL,
    color = NULL,
    title = "Chapter 1 (Activity Budget) – Winter Quarter Gantt (82 Tag Audits)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    # Text label sizes
    plot.title  = element_text(size = 14, face = "bold"),
    axis.text.y = element_text(size = 11),
    axis.text.x = element_text(size = 10),
    legend.text = element_text(size = 10),
    
    # Make it truly white (and remove the "looks gray" gridlines)
    panel.background = element_rect(fill = "white", colour = NA),
    plot.background  = element_rect(fill = "white", colour = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    
    panel.grid.major.y = element_blank(),
    plot.margin = margin(20, 30, 10, 10)
  )


  



