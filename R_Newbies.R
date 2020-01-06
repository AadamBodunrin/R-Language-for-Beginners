#Basic Calculations

a <- 4
b <- 2
A <- 3
print(a+b-A)

print(factorial(6))

print(sqrt(49))

print(round(4.456))

print(round(4.456, 1)) #Round takes an additional number to specify how the number should be rounded

print(factorial(round(2.005) + 1))

#Quick Exercise. Pick a number, add two to it, multiply the result by 3, substract 6 and divide the result by three. You should get your original number as answer.
c <- 7
d <- c + 2
e <- d * 3
f <- e - 6
g <- f/3
print(g)

print(log10(1000) + log10(100))

print(factorial(g))

#Vector, Matrix and array

vect <- c(1,3,5,7,9)
vect

vectmult <- vect * 3
vectmult

bin <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
bin
print(t(bin)) #to transpose a matrix

arr <- array(c(2,3,4,5,6,7), dim = c(2,2,3))
arr

#List

a_list <- list(c(1,2,4), TRUE, FALSE, 1, "Hello", c(4,6,8))
a_list
a_list[5]

#Dataframe

df <- data.frame(number = c(1,2,3,4), letter = c("R", "P", "Q", "S"), Bool = c(TRUE, FALSE, FALSE, TRUE), stringsAsFactors = FALSE)
df

#Naming a string 
d <- "What's good?"

#Requesting for user input
username <- readline("What's your preferred username? ")

#Concatenate username, and "d". Print the output
print(paste(username,",", d))

#print all the numbers from 1 to 25 using. 
print(seq_len(25))

#Create a series of numbers and call out the first item in the series
shade <- c(10,20,30)
print(shade[1])

#Create a list of three items
example_list <- list(a = 10, b = 20, c = 30)

print (example_list[3]) #Print the value of the third item

#Print the value of the item stored as b
print(example_list["b"]) 
print(example_list$b)

#create a series of number from 1 to 6
aa <- 1:6

#Print the sequence of the cummaltive addition of numbers in x
zz <- cumsum(x)
zz

#Print the sqaure root of all the numbers in x
yy <- sqrt(x)
yy

#Print the result of x divided by 2
ab <- x/2
ab

#Find the length of characters in a string
nchar("The boy")

#Find the length of characters in series of string
nchar(c("the", "boy", "goes"))


#view the first few rows of the iris dataset
print(head(iris))

#print the dimension of the iris dataset i.e. row V column
print(dim(iris))

#Print the unique items in the species column
print(levels(iris$Species))

data("mtcars")
summary(mtcars)

efficient <- subset(mtcars, mtcars$mpg >= 23)
dim(efficient)
efficient


subset(mtcars, mtcars$mpg > 30 & mtcars$hp >100)

