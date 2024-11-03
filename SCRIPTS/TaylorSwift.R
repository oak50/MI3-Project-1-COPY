---
title: "Hotdog"
output: html_document
date: '2024-01-23'
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r pressure, echo=FALSE}
library(tidyverse)
library(dplyr)
library(ggplot2)
library(kableExtra)

# Script to create the following graphs and tables
## Number of Lines per Song for each Album
## Number of Tracks per Album
## Sentiment Analysis by Album and Tracker (with neutral scores)
## Sentiment Analysis by Album and Tracker (without neutral scores)
## Average Sentiment Scores per Album
## Distribution of Sentiment Scores
## Summary Statistics for the final dataset. 

# Import and prepare data
taylor_swift <- read.csv("C:/Users/evely/OneDrive/Documents/DS 4002 - Data Science Project/MI3-Project-1/DATA/taylor_swift.csv")
taylor_swift$albumn_name <- factor(taylor_swift$albumn_name, levels = c("Taylor Swift", "Fearless (Taylor’s Version)", "Speak Now (Deluxe)", "Red (Deluxe Edition)", "1989 (Deluxe)", "reputation", "Lover", "folklore (deluxe version)", "evermore (deluxe version)"))

```

```{r pressure, echo=FALSE}

# Graphs for number of tracks per album

# Get the albums and number of tracks per album
a <- c("Taylor Swift", "Fearless (Taylor's Version)", "Speak Now (Deluxe)", "Red (Deluxe Edition)", "1989 (Deluxe)", "Reputation", "Lover", "Folklore (Deluxe Version)", "Evermore (Deluxe Version)")
t <- c(15, 26, 17, 22, 16, 15, 18, 17, 17)

# Organize in a data frame
df <- data.frame(Album=a, Tracks=t)

# Graph the data
ggplot(df, aes(x=factor(Album, level=a), y=Tracks, fill=Album)) + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + ggtitle("Number of Tracks per Album") + labs(x="Album")



```

```{r pressure, echo=FALSE}



# Table displaying number of lines per track for each album

# Organize the table by album name
sort <- taylor_swift[order(taylor_swift$albumn_name),]

# Display table as data frame
song <- as.data.frame(table(sort$track_title))

# Rename columns
colnames(song) <- c("track_title","total_lines")

# Merge data frame with original taylor_swift.csv dataset 
song <- merge(taylor_swift, song, by="track_title")

# Subset out the necessary columns
sub <- subset(song, select=c("albumn_name", "track_title", "total_lines", "track_number"))

# Keep only unique rows
song <- unique(sub)


# Plot the graph
ggplot(song, aes(x = track_number, y = total_lines, fill = albumn_name)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Track Number", y = "Lines per Song", title = "Number of Lines per Song for each Album") +
  facet_wrap(~ albumn_name, scales = "free") 




```

```{r pressure, echo=FALSE}

# Graph displaying average sentiment scores for each song per album

# Find the average scores for each song
negative_scores <- aggregate(negative ~ albumn_name + track_title, data=taylor_swift, FUN = mean)
neutral_scores <- aggregate(neutral ~ albumn_name + track_title, data=taylor_swift, FUN = mean)
positive_scores <- aggregate(positive ~ albumn_name + track_title, data=taylor_swift, FUN = mean)

# Combine into one data frame
average_scores <- merge(negative_scores, neutral_scores, by="track_title")
average_scores <- merge(average_scores, positive_scores, by="track_title")


# Remove duplicate album column
average_scores <- average_scores[, -which(names(average_scores) == "albumn_name.x")]
average_scores <- average_scores[, -which(names(average_scores) == "albumn_name.y")]


# Melt the data frame to long format
average_scores_long <- pivot_longer(average_scores, cols = c("positive", "negative", "neutral"), names_to = "sentiment_type", values_to = "sentiment_score")

# Find track title and track number
unique_values <- taylor_swift %>%
  distinct(track_title, .keep_all = TRUE) %>%
  select(track_title, track_number)


# Merge with track number and set album order
scores <- merge(average_scores_long, unique_values, by="track_title")
scores$albumn_name <- factor(scores$albumn_name, levels = c("Taylor Swift", "Fearless (Taylor’s Version)", "Speak Now (Deluxe)", "Red (Deluxe Edition)", "1989 (Deluxe)", "reputation", "Lover", "folklore (deluxe version)", "evermore (deluxe version)"))


# Create the plot

ggplot(scores, aes(x = track_number, y = sentiment_score, fill = sentiment_type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Track Number", y = "Sentiment Score", title = "Sentiment Analysis by Album and Track Number") +
  facet_wrap(~ albumn_name, scales = "free") +
    labs(fill = "Sentiment Type")



# Graph displaying average positive and negative sentiment scores for each song per album

# Melt the data frame to long format
average_scores_long2 <- pivot_longer(average_scores, cols = c("positive", "negative"), names_to = "sentiment_type", values_to = "sentiment_score")
average_scores_long2

# Find track title and track number
unique_values <- taylor_swift %>%
  distinct(track_title, .keep_all = TRUE) %>%
  select(track_title, track_number)


# Merge with track number and set album order
scores2 <- merge(average_scores_long2, unique_values, by="track_title")
scores2$albumn_name <- factor(scores2$albumn_name, levels = c("Taylor Swift", "Fearless (Taylor’s Version)", "Speak Now (Deluxe)", "Red (Deluxe Edition)", "1989 (Deluxe)", "reputation", "Lover", "folklore (deluxe version)", "evermore (deluxe version)"))


# Create the plot

ggplot(scores2, aes(x = track_number, y = sentiment_score, fill = sentiment_type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Track Number", y = "Sentiment Score", title = "Sentiment Analysis by Album and Track Number") +
  facet_wrap(~ albumn_name, scales = "free") +
  labs(fill = "Sentiment Type")


```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.


```{r pressure, echo=FALSE}

# Table displaying average sentiment scores for each album


average_scores_album <- aggregate(cbind(positive, negative, neutral) ~ albumn_name, data = taylor_swift, FUN = mean)

# Make table aesthetic
pretty_table <- knitr::kable(average_scores_album, 
                             caption = "Average Sentiment Scores per Album", 
                             align = "c",
                             format = "html",
                             col.names = c("Album", "Average Positive Score", "Average Negative Score", "Average Neutral Score")) 

# Print the pretty table
print(pretty_table)

```

```{r pressure, echo=FALSE}


# Density curve plotting positive, negative, and neutral sentiment scores

# Create the graph
ggplot() +
  geom_density(data = taylor_swift, aes(x = positive, color = "Positive"), fill = "skyblue", alpha=0.3) +
  geom_density(data = taylor_swift, aes(x = negative, color = "Negative"), fill = "salmon", alpha=0.3) +
  geom_density(data = taylor_swift, aes(x = neutral, color = "Neutral"), fill = "lightgreen", alpha=0.3) +
  scale_color_manual(values = c("Positive" = "blue", "Negative" = "red", "Neutral" = "green")) +
  labs(x = "Scores", y = "Density", title = "Distribution of Sentiment Scores") +
  theme_minimal()

```

```{r pressure, echo=FALSE}


# Create summary statistics table for the dataset


# Print out the summary table
kable(summary(taylor_swift), format = 'html')

```


