# Create a numeric vector from 1 to 20. Extract the even numbers only.
vector1 <- c(1:20)
even_numbers <- vector1[vector1 %% 2 == 0]

#Build a data frame with two columns: Name (character) and Score (numeric). Add five rows.
df1 <- data.frame(Name = c("MERON", "RAHWA", "HAILE", "HELEN", "LIDYA"),
                  Score = c(75, 64, 92, 45, 30))

#Extract all rows where Score is above 80.
df1[df1$Score > 80, ]


#Write a function that takes a numeric vector and returns the mean, median, and standard deviation as a list.
function1 <- function(input) {
  mean_output <- mean(input)
  median_output <- median(input)
  sd_output <- sd(input)
  
  result_list <- list("mean_output" = mean_output, "median_output" = median_output, "sd_output" = sd_output)
  return (result_list)
}

#Simulate 100 coin tosses (sample(c("H", "T"), 100, replace=TRUE)). Estimate the proportion of heads.
tosses <- sample(c("H", "T"), 100, replace=TRUE)

paste(round((sum(tosses == "H") / length(tosses) * 100), 2), "% heads", sep = "")
paste(round((mean(tosses == "T") * 100), 2), "% tails", sep = "")

#Save your data frame to a .csv file, then read it back into R.




