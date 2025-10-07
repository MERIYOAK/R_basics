#stat 101 
#At its simplest, data are measured observations — numbers, categories, or characteristics that describe something.
#Population: the entire group you’re interested in (for example, all students in a school).
#Sample: a subset of that population that you actually collect data from.
#Variable: any measurable feature or characteristic (for example, Score or Gender).


students <- data.frame(
  Name   = c("Sara", "John", "Helen", "Daniel", "Meron", "Liya","Robel"),
  Gender = c("F", "M", "F", "M", "M", "F", "M"),
  Score  = c(78, 85, 92, 67, 88, 75, 100)
)

#“Name” and “Gender” are categorical variables (qualitative).
#“Score” is a numerical variable (quantitative).
mean(students$Score)
median(students$Score)

#R doesn’t have a built-in mode() function. so we have to make a function for it.
mode <- function(v) {
  unique_values <- unique(v)
  counts <- tabulate(match(v, unique_values))
  unique_values[counts == max(counts)]
}

mode(students$Gender)

#to get variance we do this
var(students$Score)

#to get standard deviation we say
sd(students$Score)

#to get the range
range(students$Score)
diff(range(students$Score))


#to summarize all variables
summary(students)


# Quick visualization with six types of graphs

#plots are used for Showing changes over time (trend data). they use numeric variables
#helps us To detect correlation or patterns — like positive, negative, or no relationship.
plot(students$Score,
     main = "Students' Scores",
     ylab = "Students",
     col = "blue",
     pch = 18,
     type = "b",
     xlim = c(1,10),
     ylim = c(50, 100))

#If y is missing, R plots the values of x against their index (position in the vector).



#histograms also use numeric variables
#It reveals shape (normal, skewed, bimodal), spread, and central tendency of data.

hist(students$Score,
     main = "Histogram of Student Scores",
     xlab = "Score",
     col  = "skyblue",
     border = "white")



#box and whisker plots also use numerical variables
#It shows median, quartiles, and outliers clearly.

boxplot(students$Score,
        main = "Boxplot of Scores",
        ylab = "Score",
        col = "orange")



#pie chart uses categorical variables
#It’s visually appealing, but less precise than bar charts — best for showing simple proportions.

pie(table(students$Gender))



#bar chart is also use categorical variables
#It shows how many observations fall into each category, making category comparisons easy.

barplot(table(students$Gender))


