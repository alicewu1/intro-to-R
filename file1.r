# Intro to R Lesson
# October 12, 2022

### PART 1.1: INTRODUCTION TO R AND R STUDIO ###

# I am adding 3 and 5. R is fun!
3+5

# Ctrl + Enter: Run command from script editor in console
# esc: escape current command to return to the command promp
# Ctrl + 1: Move cursor from console to script editor
# Ctrl + 2:  Move cursor from script editor to console
# Tab: Use this key to complete a file path
# Ctrl + Shift + C = comment block of highlighted text


## ASSIGNMENT OPERATOR ##
x <- 3 # assigns values on teh right to variables on the left 
y <- 5 
y # to print variables
x + y
number <- x + y
number

## EXERCISES Part 1.1 ASSIGNMENT OPERATOR: ##
# 1. Try changing the variables x to 5. What happens to number?
x <- 5
number # 8
# 2. Now try changing the value of variable y to contain the value 10. What do you need to do, to update the variable number?
y <- 10
number
# to change number variable you need to rerrun
number <- x + y
number




### PART 1.2: R SYNTAX AND DATA STRUCTURE ###
## VECTORS ##
# Create a numeric vector as 'glengths' and combine it into a vector using c() combine function
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species
# Forget to put quotes around corn
species <- c("ecoli", "human", corn) # tip: highlight corn and hit quotes keys 
# Re-run: Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species 

## EXCERCISE PART 1.2 VECTORS: ##
# Try to create a vector of numeric and character values by combining the two vectors that we just created (glengths and species). 
# Assign this combined vector to a new variable called combined. Hint: you will need to use the combine c() function to do this. 
# Print the combined vector in the console, what looks different compared to the original vectors?
combined <- c(glengths, species)
combined


## FACTORS ##
# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")
expression
# Turn 'expression' vector into a factor
expression <- factor(expression)
expression

# EXERCISES: Part 1.2 FACTORS:
# Let’s say that in our experimental analyses, we are working with three different sets of cells: 
# normal, cells knocked out for geneA (a very exciting gene), and cells overexpressing geneA. We have three replicates for each celltype.

# Create a vector named samplegroup with nine elements: 3 control (“CTL”) values, 3 knock-out (“KO”) values, and 3 over-expressing (“OE”) values.
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", 'OE')
samplegroup
# Turn samplegroup into a factor data structure. So, what exactly happened when we applied the factor() function? 
samplegroup <- factor(samplegroup)
samplegroup


## DATAFRAMES ##
# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
df

# EXCERCISE PART 1.2 DATAFRAME:
# Create a data frame called favorite_books with the following vectors as columns
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)

favorite_books <- data.frame(titles, pages)
favorite_books


## LISTS ##
list1 <- list(species, df, number)
list1

# EXERCISE 1.2 DATAFRAME:
# Create a list called list2 containing species, glengths, and number.
list2 <- data.frame(species, glengths, number)
list2


## PART 1.3: FUNCTIONS AND ARGUMENTS 
# The general usage for a function is the name of the function followed by parentheses:
function_name(input)

## BASIC FUNCTIONS 
glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning
glengths

sqrt(81)
sqrt(glengths)


## EXERCISE 1.3 BASIC FUNCTIONS:
# 1. Let’s use base R function to calculate mean value of the glengths vector. You might need to search online to find what function can perform this task.
mean(glengths)
# 2. Create a new vector test <- c(1, NA, 2, 3, NA, 4). Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the test vector. The output should be 2.5.
test <- c(1, 2, 3, 4)
mean(test)
# 3. Another commonly used base function is sort(). Use this function to sort the glengths vector in descending order.
sort(glengths, decreasing=TRUE)

## DIFFERENCE BTWN SORT AND ORDER IN R 
my_vec <- c(1, 5.2, 22, 9, -5, 2)

# order sorts vector in ascending order
ii <- order(my_vec)
ii

#  sorted in ascending order:
my_vec[ii]
# sort(0 method used to achieve same results 
sort(my_vec, index.return = TRUE)

## ORDER VECTOR IN R
x <- c(56, 14, 1, 28)

# function used to verify if the vector is sorted or not
is.unsorted(x) # TRUE

# Ascending Order
x[order(x)]
# Equivalent to:
ii <- order(x)
x[ii]
# Equivalent to:
sort(x)

# Descending Order
x[order(-x)]
# Equivalent to:
x[order(x, decreasing = TRUE)]
# Equivalent to:
sort(x, decreasing = TRUE)

# Order by other vector/index
# You can order some vector using other of the same length as the index vector.
y <- c(2, 3, 1, 4)
x[y]

# order(y) # 3 1 2 4
x[order(y)]

#ORDER DATAFRAME OR MATRIX IN R
my_df <- attitude[, c(2, 3, 4)]
head(my_df)

