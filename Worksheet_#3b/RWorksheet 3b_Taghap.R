#Worksheet-3b in R
#Worksheet for R Programming

#------------------------------------------------------------------------
#1.Create a data frame.

#a. Write the codes.
table <- data.frame(
                    Respondents = c(1:20),
                    Sex = c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2),
                    Father= c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1),
                    Persons = c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6),
                    Siblings = c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2),
                    Houses = c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

                    )


names(table) <- list("Respondents", "Sex", "Fathers occupation", "Persons at Home",
                      "Siblings at School", "Types of Houses")

table

#b.Describe the data. Get the structure or the summary of the data
sum_table <- summary(table)

sum_table

#c. Is the mean number of siblings attending is 5?
table_mean <-mean(table$Siblings)

table_mean
#NO

#d.Extract the 1st two rows and then all the columns using the subsetting functions.
#Write the codes and its output.

extract_1 <- subset(table[1:2,1:6])

extract_1

#e Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its
#result.

extract_2 <- subset(table[c(3,5), c(2,4)])

extract_2

#f. Select the variable types of houses then store the vector that results as types_houses.
#Write the codes.

types_houses <- table$"Types of Houses"

types_houses

#g.Select only all Males respondent that their father occupation was farmer. Write
#the codes and its output.

male_subset <- subset(table, Sex == '1', 'Fathers Occupation'== '1') 
male_subset

#There is no result because in the data frame there is no male respondents that their father 
#occupation is farmer.


#h. Select only all females respondent that have greater than or equal to 5 number
#of siblings attending school. Write the codes and its outputs.

female_subset <- subset(table[c(1:20), c(2,5)])
female_subset

female <- female_subset[table$`Siblings at School` >= '5',]
female

#2. Write a R program to create an empty data frame. Using the following codes:

  df = data.frame(Ints=integer(),
                  Doubles=double(), Characters=character(),
                  Logicals=logical(),
                  Factors=factor(),
                  stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))

#a. Describe the results.
#The data frame is an empty data frame. It has zero columns, 5 rows and zero level.


#3. Interpret the graph.

#Figure 1: Sentiments of Tweets per day - Donald Trump

#There are more negative comments than neutral and positive comments from July 14 to July 21.








