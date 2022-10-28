#Virginica Subset

data(iris)
iris

subset_virginica <- subset(iris, Species == 'virginica' )
subset_virginica

#Mean of each characteristics of the species
sepal_lngt <- mean(subset_virginica$Sepal.Length)
sepal_lngt

sepal_wdth <- mean(subset_virginica$Sepal.Width)
sepal_wdth

petal_lngt <- mean(subset_virginica$Petal.Length)
petal_lngt

petal_wdth <- mean(subset_virginica$Petal.Width)
sepal_wdth

#Total mean of virginica species subset
virginica_mean <- c(sepal_lngt, sepal_wdth, petal_lngt, petal_wdth)
virginica_mean

total_mean <- mean(virginica_mean)
total_mean

