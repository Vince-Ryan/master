#------Worksheet #2 in R----
#Vince Ryan Taghap BSIT 2A


#1.Create a vector using : operator

#a. Sequence from -5 to 5. Write the R code and its output. Describe its output.

numseq <- -5:5
numseq

#The output of the object numseq are numbers from negative 5 until positive 5

#b. x <- 1:7. What will be the value of x?
x <- 1:7
x

#The value of object x are numbers from 1 to 7


#2* Create a vector using seq() function

#a. seq(1, 3, by=0.2) # specify step size
#Write the R code and its output. Describe the output.

num <- seq(1, 3, by=0.2)
num

#The value of the object num are sequence number 1 to 3 that has a gap which is 0.2.


#3. A factory has a census of its workers. There are 50 workers in total. The following
#list shows their ages: 34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
#22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
#24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
#18.

ages <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27,
22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
18)
ages

#a. Access 3rd element, what is the value?

third_elem <- c(ages[3])
third_elem

#b. Access 2nd and 4th element, what are the values?

sec_fourth_elem <- ages[c(2,4)]
sec_fourth_elem

#The values are 28 and 36

#c. Access all but the 1st element is not included. Write the R code and its output

all_elem <- ages[c(2:50)]
all_elem

#4.*Create a vector x <- c("first"=3, "second"=0, "third"=9). Then named the vector,
#names(x).
x <- c("first"=3, "second"=0, "third"=9)
x

#a. Print the results. Then access x[c("first", "third")].
#Describe the output.

names <- x[c("first", "third")]
names

#The output are 3 and 9 because we set the value of the character "first" into 3 and "third" into 9.

#b. Write the code and its output.

names <- x[c("first", "third")]
names

#5. Create a sequence x from -3:2.

x <- -3:2
x

#a. Modify 2nd element and change it to 0;
  #x[2] <- 0
  #x
  #Describe the output.

x[2] <- 0
x

#The value of the index 2 in array named x is changed into 0.


#b  Write the code and its output.

x[2] <- 0
x

#6.*The following data shows the diesel fuel purchased by Mr. Cruz.

diesel_fuel <- data.frame (
Month = c("Price per liter(Php)", "Purchase-quantity(Liters)"),
Jan = c(52.50, 25),
Feb = c(57.25, 30),
March = c(60.00, 40),
Apr = c(65.00, 50),
May = c(74.25, 10),
June = c(54.00, 45)
)

diesel_fuel

#b What is the average fuel expenditure of Mr. Cruz from Jan to June? Note: Use weighted.mean(liter, purchase)

Jan = c(52.50, 25)
Feb = c(57.25, 30)
March = c(60.00, 40)
Apr = c(65.00, 50)
May = c(74.25, 10)
June = c(54.00, 45)

Ave_fuel <- weighted.mean(Jan, Feb, March, Apr, May, June)

Ave_fuel


#7 R has actually lots of built-in datasets. For example, the rivers data “gives the lengths
#(in miles) of 141 “major” rivers in North America, as compiled by the US Geological Survey”.

#a. Type “rivers” in your R console. Create a vector data with 7 elements, containing the number of elements (length) in rivers,
#their sum (sum), mean (mean), median (median), variance (var) standard deviation (sd), minimum (min) and maximum (max).
#data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),sd(rivers), min(rivers), max(rivers))

data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

#B. What are the results
#The results are the built-in datasets of major rivers in North America.

#c. Write the code and its outputs


data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data

#8. The table below gives the 25 most powerful celebrities and their annual pay as ranked
#by the editions of Forbes magazine and as listed on the Forbes.com website.

#a. Create vectors according to the above table. Write the codes.

PowerRanking <- 1:25
CelebrityName <- c("Tom Cruise", "Rolling Stones", "Oprah Winfrey", "U2", 
                   "Tiger Woods", "Steven Spielberg", "Howard Stern", "50 Cent", "Cast of the sopranos",
                   "Dan Brown", "Bruce Springsteen", "Donald Trump", "Muhammad Ali", "Paul McCartney",
                   "George Lucas", "Elton John", "David Letterman", "Phil Mickelson", "J.K Rowling",
                   "Bradd Pitt", "Peter Jackson", "Dr. Phil McGraw", "Jay Lenon", "Celine Dion", "Kobe Bryant")

Pay <- c(67, 90, 225, 110, 90, 332, 302, 41, 52, 88, 55, 44, 55, 40,
         233, 34, 40, 47, 75, 25, 39, 45, 32, 40, 31)

Forbes_Data <- data.frame(PowerRanking, CelebrityName, Pay)
Forbes_Data


 #b Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and pay to 90. Write the codes and its output.
PowerRanking [19] <- 15
PowerRanking
Pay [19] <- 90
Pay

Updated_Ranking <- data.frame(PowerRanking, CelebrityName, Pay)
Updated_Ranking

#c Interpret the data

#The data is all about the ranking of the most powerful celebrities and their annual pay. We rank them and make
#a table in order for us to easily identify who is the most and less annual pay based on oue table created.

?\hf
