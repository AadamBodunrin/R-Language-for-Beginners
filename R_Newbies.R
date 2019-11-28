#Naming a string using =
d = "What's good?"

#Requesting for user input
username <- readline("What's your preferred username? ")

#Concatenate username, and "d". Print the output
print(paste(username,",", d))

#view the first few rows of the iris dataset
print(head(iris))

#print the dimension of the iris dataset i.e. row V column
print(dim(iris))

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
x <- 1:6

#Print the sequence of the cummaltive addition of numbers in x
z <- cumsum(x)
z

#Print the sqaure root of all the numbers in x
y <- sqrt(x)
y

#Print the result of x divided by 2
a <- x/2
a

#Find the length of characters in a string
nchar("The boy")

#Find the length of characters in series of string
nchar(c("the", "boy", "goes"))



