#Worksheet 1 Vince Ryan Taghap BSIT 2A

#1
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
age

#2
reciprocal <- 1/age
reciprocal

#3
new_age <- c(age, 0, age)
new_age
#The value inside the object new_age  has a value of object age, added a value 0 and again the value of object age.In conclusion, if you prints the object new_age it prints value of age twice but has a 0 between the two object age.

#4 
sort(age)

#5
min(age)
max(age)

#6

data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7)
data

#7
data2 <- (data)*2
data2

#8.1
seq(1:100)

#8.2
seq(20,60)

#8.3 
mean(20:60)

#8.4
sum(51:91)

#8.5
seq(1, 1000, by = 100)

#9
filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100)) #error
Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100)) #no error

#10
seq(100,1)

#11
multiple_by3 <- c(3,6,9,12,15,18,21,24)
multiple_by5 <- c(5,10,15,20)
sum(multiple_by3)
sum(multiple_by5)
sum(multiple_by3, multiple_by5)

#12
{ x <- 0+ x + 5 + } 

#13
score <- c(72,86,92,63,88,89,91,92,75,75,77)
score[2]
score[3]

#14
a = c(1,2,NA,4,NA,6,7)
print(a,na.print="-999")
#The NA changed to -999 

#15
class(x) <- "foo"
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ")
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)




