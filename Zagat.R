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
ec = ecdf(zagat$Price)
plot(ec)

#Show the column price as a histogram
hist(zagat$Price)

#Show the coulmn price as a histogram indicating its max and min values
hist(zagat$Price,breaks=seq(8,80,by = 1))

#Show the coulmn price as a histogram indicating its max and min values with "Price" as its title
hist(zagat$Price, breaks=seq(8,80,by = 1), main="Price")
axis(1,at=seq(8,80,1))

#Find the percent of price that falls within 1 standard deviation
U1=ec(m_price+sd_price)
D1=ec(m_price-sd_price)
SD1 = U1-D1
print(SD1)

#Find the percent of price that falls within 2 standard deviation
U2=ec(m_price+2*sd_price)
D2=ec(m_price-2*sd_price)
SD2 = U2-D2
print(SD2)

#Find the percent of price that falls within 3 standard deviation
U3=ec(m_price+3*sd_price)
D3=ec(m_price-3*sd_price)
SD3 = U3-D3
print(SD3)


#Find the percent of restaurant that have "price" less than or equal to 40
f <- length(subset(zagat$Name, zagat$Price >= 40))
percent <- (f/300)*100
print(percent)

#Let's take a look at Multiple regression

#1. Import the zagat file. This action is the first code in this file.

#2. Use the Multiple regression command and iew the summary of the command
zagatmod= lm(Price~ Food +Decor+Service, data = zagat)
print(summary(zagatmod))

#3. Using the leaps library, find the r2 of the predictors to pick the best predictors for the model
library(leaps)
leaps= regsubsets(Price~ Food+Decor+Service, data=zagat, nbest=3)
plot(leaps, scale="r2")

#4. Find the correlation of the numeric variables in the dataset
y <- cor(zagat[,unlist(lapply(zagat, is.numeric))])
print(y)
