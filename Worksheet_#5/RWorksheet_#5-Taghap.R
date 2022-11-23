#Worksheet-5 in R
#Worksheet for R Programming

#------------------------------------------------------------------------

# 1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
com_sci <- data.frame(
                    Course  = c("1st", "2nd", "3rd", "4th"),
                    num = c(80, 75, 70, 60)
                    )
names(com_sci) <- list("Course Year", "2019 - 2020")
com_sci


# a. Plot the data using a bar graph. Write the codes and copy the result.

bar_data <- c("1st" = 80, "2nd" = 75, "3rd" = 70, "4th" = 60)
barplot(bar_data)

# b. Using the same table, label the barchart with Title = ” Enrollment of BS Computer Science" 
#horizontal axis = “Curriculum Year” and vertical axis = “number of students”

barplot(bar_data, 
        main = "Enrollment of BS Computer Science", 
        xlab = "Number of Students", 
        ylab = "Course Year")


# 2. The monthly income of De Jesus family was spent on the following: 60% on Food, 
#10% on electricity, 5% for savings, and 25% for other miscellaneous expenses.

# a. Create a table for the above scenario. Write the codes and its result.

De_Jesus_data <- data.frame(
             Facts = c("Food", "Electricity", "Savings", "Miscellaneous Expenses"),
             Spent = c(60, 10, 5, 25)
                        )
De_Jesus_data

tab_data <- table(De_Jesus_data)
tab_data

# b. Plot the data using a pie chart. Add labels, colors and legend. Write the codes and its result.

fam_spent <- c(60,10,5,25) 

pie(fam_spent, col = rainbow(4))


fam_spent_labels <- round(fam_spent/sum(fam_spent) * 100, 10)
fam_spent_labels <- paste(fam_spent_labels, "%", sep = "")

spent_pie <- pie(fam_spent, main = "Expenses", col = rainbow(length(fam_spent)),
                 labels = fam_spent_labels, cex= 0.8)

legend(1.5, 0.5, c(" Food", "Electricity","Savings","Other expenses"), cex= 0.6,
       bty = "n", fill = rainbow(length(fam_spent)) )


                
# 3. Open the mtcars dataset.

# a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#Use $ to select the mpg only. Write the codes and its result.

data("mtcars")
data_mtcars <- (mtcars$mpg)
data_mtcars
                
hist(data_mtcars, col = "skyblue")
                
# b. Colored histogram with different number of bins. hist(mtcars$mpg, breaks=12, col="red") 
#Note: breaks= controls the number of bins.

hist(data_mtcars, breaks=12, col="blue")
                
# c. Add a Normal Curve x <- mtcars$mpg h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon", 
#main="Histogram with Normal Curve") xfit<-seq(min(x),max(x),length=40) yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) yfit <- yfit*diff(h$mids[1:2])*length(x) lines(xfit, yfit, col="blue", lwd=2) Copy the result.
data_curve <- data_mtcars
data_curve
                
data_hist <-hist(
                data_curve, breaks=10, col="red", xlab="Miles Per Gallon",
                main="Histogram with Normal Curve")
                xfit<-seq(min(data_curve),max(data_curve),length=40)
                yfit<-dnorm(xfit,mean=mean(data_curve),sd=sd(data_curve))
                yfit <- yfit*diff(data_hist$mids[1:2])*length(data_curve)
                lines(xfit, yfit, col="blue", lwd=2
                )
data_hist
                

# 4. Open the iris dataset. Create a subset for each species.
# a. Write the codes and its result.
data("iris")

data_iris <- data.frame(iris)
data_iris
                
data_seto <- subset(data_iris, Species == 'setosa' )
data_seto
                
data_versi <- subset(data_iris, Species == 'versicolor' )
data_versi
                
data_virg <- subset(data_iris, Species == 'virginica' )
data_virg
                
# b. Get the mean for every characteristics of each species using colMeans(). 
#Write the codes and its result. Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])

setosa <- colMeans(data_seto[sapply(data_seto,is.numeric)])
setosa
                
versicolor <- colMeans(data_versi[sapply(data_versi,is.numeric)])
versicolor
                
virginica <- colMeans(data_virg[sapply(data_virg,is.numeric)])
virginica

#c. Combine all species by using rbind() The table should be look like this:
  
  
combined_data <- rbind(setosa, versicolor,virginica)
combined_data

combined_DF <- data.frame(combined_data)
combined_DF

#d. From the data in 4-c: Create the barplot(). Write the codes and its result. 
#The barplot should be like this.

barplot (as.matrix(combined_DF), col = rainbow(3), main = "Iris Data",
         ylab = "Mean Scores",
         beside = T)                
install.packages("tinytex")
