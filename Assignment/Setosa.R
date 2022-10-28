#Setosa Subset

data(iris)
iris

subset_setosa <- subset(iris, Species == 'setosa' )
subset_setosa

#Mean of each characteristics of the species
sepal_lngt <- mean(subset_setosa$Sepal.Length)
sepal_lngt

sepal_wdth <- mean(subset_setosa$Sepal.Width)
sepal_wdth

petal_lngt <- mean(subset_setosa$Petal.Length)
petal_lngt

petal_wdth <- mean(subset_setosa$Petal.Width)
sepal_wdth

#Total mean of Setosa species subset
setosa_mean <- c(sepal_lngt, sepal_wdth, petal_lngt, petal_wdth)
setosa_mean

total_mean <- mean(setosa_mean)
total_mean

