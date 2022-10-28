#Versicolor Subset

data(iris)
iris

subset_versicolor <- subset(iris, Species == 'versicolor' )
subset_versicolor

#Mean of each characteristics of the species
sepal_lngt <- mean(subset_versicolor$Sepal.Length)
sepal_lngt

sepal_wdth <- mean(subset_versicolor$Sepal.Width)
sepal_wdth

petal_lngt <- mean(subset_versicolor$Petal.Length)
petal_lngt

petal_wdth <- mean(subset_versicolor$Petal.Width)
sepal_wdth

#Total mean of versicolor species subset
versicolor_mean <- c(sepal_lngt, sepal_wdth, petal_lngt, petal_wdth)
versicolor_mean

total_mean <- mean(versicolor_mean)
total_mean

