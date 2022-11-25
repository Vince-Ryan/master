#Worksheet-6 in R
#Worksheet for R Programming

#-----------------------------------------------------------------------------

library(dplyr)
library(ggplot2)

data(mpg)

mpg_df <- as.data.frame(mpg)
mpg_df

# 1. How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.

mpg_data <- glimpse(mpg_df)


#There are 234 rows and 11 columns.

#2. Which manufacturer has the most models in this data set? Which model has the most
#variations? Ans:

#Dodge, it has 37 models. While the most variations for model are the caravan2wd

man_count <- mpg_data %>% group_by(manufacturer,model) %>% count()
colnames(man_count) <- list("Manufacturer","Model","Counts")

man_count


#a. Group the manufacturers and find the unique models. Copy the codes and result.

grp_unique <- mpg_data %>% group_by(manufacturer, model) %>% distinct() %>% count()
grp_unique

colnames(grp_unique) <- list("Manufacturer", "Model","Counts")

#b. Graph the result by using plot() and ggplot(). Write the codes and its result
#Plot
plot(man_count)

#GGPlot
ggplot(man_count, aes(Manufacturer, Model)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the model and
#the manufacturer.

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
#It shows in the point graph what is the manufacturer of the said model. It helps 
#the user to analyze the data easily and informative.
ggplot(mpg_df, aes(model, manufacturer)) + geom_point()

#b. For you, is it useful? If not, how could you modify the data to make it more
#informative?
#The data is already useful. It is simple and easy to analyze.

#4. Using the pipe (%>%), group the model and get the number of cars per model. 
#Show codes and its result.

grp_data <- mpg_data %>% group_by(model) %>% count()

colnames(grp_data) <- c("Model","Counts")

grp_data

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show
#codes and its result.

qplot(model,data = mpg_df,
      main = "Number of Cars per Model",
      xlab = "Model",
      ylab = "Number of Cars", geom = "bar", fill = manufacturer) + coord_flip()

#b. Use only the top 20 observations. Show code and results.

top_20 <- grp_data[1:20,] %>% top_n(2)
top_20

colnames(top_20) <- c("Model","Counts")
                        
ggplot(top_20,aes(x = Model, y = Counts)) +
  geom_bar(stat = "Identity") +coord_flip()

#5. Plot the relationship between cyl - number of cylinders and displ - engine displacement using geom_point with aesthetic colour = engine displacement. Title should be
#“Relationship between No. of Cylinders and Engine Displacement”.

#a. Show the codes and its result

ggplot(data = mpg_data , mapping = aes(x = displ, y = cyl, main = "Relationship
between No. of Cylinders and Engine Displacement")) +
  geom_point(mapping=aes(colour = "engine displacement"))

#b. How would you describe its relationship?

#The scatter plot shows that the cyl is in y axis and the displ are in the x axis 
#to easily distinguish the clustered data, which indicate the engine displacement.

#6. Get the total number of observations for drv - type of drive train (f = front-wheel drive,
#r = rear wheel drive, 4 = 4wd) and class - type of class (Example: suv, 2seater, etc.).
#Plot using the geom_tile() where the number of observations for class be used as a
#fill for aesthetics

#a. Show the codes and its result for the narrative in #6

ggplot(data = mpg_data, mapping = aes(x = drv, y = class)) +
  geom_tile(aes(fill=class))

#b. Interpret the result.

#By mapping a geometric tile, it graph the data in a tile graph that was shown in
#different colors.The data shows the drv of each class.

#7. Discuss the difference between these codes. Its outputs for each are shown below.
# Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#+Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#The difference between these two codes are they have the same color value which is blue 
#but in the output in the code #1 it has a color red dots while the code #2 has 
#a color blue dots. It is because the value of the color in code #1 is belong in
#the aes function, thats why the value of the color don't matter. Unlike in the code #2
#whereas the value of the color are outside in the value of function aes.

#8. Try to run the command ?mpg. What is the result of this command?

?mpg

#a. Which variables from mpg dataset are categorical?

#The variables that are categoral in mpg dataset are the manufacturer, model, 
#trans, drv, fl, class are the categorical variables from the data-set of mpg.

#b. Which are continuous variables?

#The consinuous variable of the mpg data-set are the dsipl, year,
#cyl, cty, and hwy.

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles
#per gallon). Mapped it with a continuous variable you have identified in #5-b. 
#What is its result? Why it produced such output?

ggplot(mpg, aes(x = cty, y = hwy, colour = displ)) + geom_point()

#The data that have been graph shows that they are in the positive rate using the displ for
#hwy and cty scattered plot.The data tracks the cty by placing cty at color that having a variations
#of color blue.

#9. Plot the relationship between displ (engine displacement) and hwy(highway miles
#per gallon) using geom_point(). Add a trend line over the existing plot using
#geom_smooth() with se = FALSE. Default method is “loess”.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)

#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set the
#se = FALSE to remove the confidence interval and method = lm to check for linear modeling.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)





