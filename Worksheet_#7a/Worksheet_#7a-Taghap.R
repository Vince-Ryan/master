#R Worksheet 7a
#Vince Ryan Taghap BSIT 2A

#1. Create a data frame for the table below 
  scores_df <- data.frame(
    Student = seq(1:10),
    Pre_test = c(55,54,47,57,51,61,57,54,63,58),
    Post_test = c(61,60,56,63,56,63,59,56,62,61)
                )
  names(scores_df) <- list("Student", "Pre-test", "Post-test")
  
  scores_df

#a. Compute the descriptive statistics using different packages 
#(Hmisc and pastecs).

#Write the codes and its result.
install.packages("Hmisc")

library(Hmisc)
library(pastecs)

  describe(scores_df)
  stat.desc(scores_df)

#2. The Department of Agriculture was studying the effects of several levels 
#of a fertilizer on the growth of a plant. For some analyses, it might be
#useful to convert the fertilizer levels to an ordered factor.

  Dept_of_Agri <- c(10,10,10,20,20,50,10,20,10,50,20,50,20,10)



#a. Write the codes and describe the result.
ord <- sort(Dept_of_Agri, decreasing = FALSE)
ord

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense

  Subjects <- c("l","n","n","i","l","l","n","n","i","l")

#a. What is the best way to represent this in R?

# Answer: Dataframe 

  subs <- data.frame(Subjects)
  subs 

#4.Sample of 30 tax accountants from all the states and territories of 
#Australia and their individual state of origin is specified by a character 
#vector of state mnemonics
#as:

  state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")
  state  

#a. Apply the factor function and factor level. Describe the results.

  ff <- factor(state)
  ff


#5. From #4 - continuation:

#• Suppose we have the incomes of the same tax accountants in another vector 

  incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():

  cal <- tapply(state, incomes, mean)
  cal

#b. Copy the results and interpret.

# 40 41 42 43 46 48 49 51 52 54 56 58 59 60 61 62 64 65 69 70 
#NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

#6.Calculate the standard errors of the state income means (refer again to 
#number 3)

  stdError <- function(x) sqrt(var(x)/length(x))
  stdError(subs)
  incster <- tapply(incomes, state, stdError)

#a. What is the standard error? Write the codes.
  # Answer: NA

#b. Interpret the result.
  #Because some variables are character types, the result is unavailable. 
  #Therefore, the standard error cannot be determined.

#7. Use the titanic dataset.
  data("Titanic")

  titanic_df<- data.frame(Titanic)

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.

  hsbst <- subset(titanic_df, select = "Survived")
  hsbst

#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as 
#Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.

#a. describe what is the dataset all about.
  #The dataset is all about Breast Cancer.

#b. Import the data from MS Excel. Copy the codes.

library("readxl")
  data <- read_excel("C:/Users/TAGHAP/Desktop/Master Vinsoy/VINCE RYAN TAGHAP/BSIT 2A (1st sem)/DATA SCIENCE/worksheet 7a/Breast_Cancer.xlsx")
  
  data

#c. Compute the descriptive statistics using different packages. Find the values of:

#c.1 Standard error of the mean for clump thickness.

  clump <- length(data$`CL. thickness`)
  clump1 <- sd(data$`CL. thickness`)
  clump2 <- clump1/sqrt(data$`CL. thickness`)
  clump2

#c.2 Coefficient of variability for Marginal Adhesion.

  cov <- sd(data$`Marg. Adhesion`) / mean(data$`Marg. Adhesion`)* 100
  cov

#c.3 Number of null values of Bare Nuclei.

  nv <- subset(data,`Bare. Nuclei` == "NA")
  nv

#c.4 Mean and standard deviation for Bland Chromatin

  mean(data$`Bl. Cromatin`)
  sd(data$`Bl. Cromatin`)

#c.5 Confidence interval of the mean for Uniformity of Cell Shape

#Calculate the mean
  calm <- mean(data$`Cell Shape`)
  calm

#Calculate the standard error of the mean

  se <- length(data$`Cell Shape`)
  se1 <- sd(data$`Cell Shape`)
  ser <- se1/sqrt(se)
  ser


#Find the t-score that corresponds to the confidence level

  tscore = 0.05
  tse = se - 1
  cl = qt(p = tscore/ 2, df = tse,lower.tail = F)
  cl

#Constructing the confidence interval

  ci <- cl * ser

#Lower

  lower <- calm - ci


#Upper

  upp <- calm + ci

  grpLU <- c(lower,upp)


#d. How many attributes?

  att <- attributes(data)
  att

#e. Find the percentage of respondents who are malignant. Interpret the results.

  perres <- subset(data, Class == "malignant")
  perres

#There 18 respondents who are malignant dnd there are total of 49 respondents.

#Getting the percentage

  getper <- 17  / 49 * 100
  getper

#9. Export the data abalone to the Microsoft excel file. Copy the codes.

  install.packages("AppliedPredictiveModeling")

library("AppliedPredictiveModeling")
  data("abalone")
  View(abalone)
  head(abalone)
  summary(abalone)

#Exporting the data abalone to the Microsoft excel file
  install.packages("xlsxjars")

  library(xlsx)
  write.xlsx(abalone, "abalone.xlsx")
  
