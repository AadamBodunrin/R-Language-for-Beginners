#view the csv as a table
zagat = read.table('Zagat.csv',
                    sep = ',',
                    header = TRUE,
                    stringsAsFactor = TRUE)
View(zagat)

#View the first few rows
head(zagat)

#view the first few items in food
head(zagat$Food)

#View zagat as a dimension
dim(zagat)

#Show the object type
class(zagat)

#show the object type of column food
class(zagat$Name)

#show the structure of the object
str(zagat)

#returns basic statistics summary 
summary(zagat)

#return basic statistics about price
summary(zagat$Price)

#return the first three items in column price
print(zagat[1:3, 'Price'])

#find the mean of variable price
m_price = mean(zagat$Price)
print(m_price)

#find the standard deviation of price
sd_price = sd(zagat$Price)
print(sd_price)

#plot the empirical distribution of price
lm = ecdf(zagat$Price)
plot(lm)

#Show the column price as a histogram
hist(zagat$Price)

#Show the coulmn price as a histogram indicating its max and min values
hist(zagat$Price,breaks=seq(8,80,by = 1))

hist(zagat$Price, breaks=seq(8,80,by = 1), main="Price")
axis(1,at=seq(8,80,1))
