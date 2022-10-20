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

## USER-DEFINED FUNCTIONS
name_of_function <- function(argument1, argument2) {
  statements or code that does something
  return(something)
}

square_it <- function(x) {
  square <- x * x
  return(square)
} # check env for variable 

# using the variable
square_it(5)

square_it <- function(x) {
  10 * 10
}


## EXCERISE 1.3 USER-DEFINED FUNCTIONS:
# Write a function called multiply_it, which takes two inputs: a numeric value x, and a numeric value y. The function will return the product of these two numeric values, which is x * y. For example, multiply_it(x=4, y=6) will return output 24.
multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}

multiply_it(6,4)




## PART 1.4: READING AND INSPECTING DATA ##
?read.csv

# Create a dataframe by reading in a file 
metadata <- read.csv(file="data/mouse_exp_design.txt")
# Check top 6 lines of df using 
head(metadata)


## EXERCISE 1.4 READING IN DATA 
# Download this tab-delimited .txt file and save it in your project’s data folder.
# Read it in to R using read.table() and store it as the variable proj_summary. As you use read.table(), keep in mind that:
#   all the columns in the input text file have column names
# you want the first column of the text file to be used as row names (hint: look up the input for the row.names = argument in read.table())
proj_summary <- read.table(file="data/project-summary.txt", header = TRUE, row.names = 1)

# Display the contents of proj_summary in your console
proj_summary


## EXERCISE 1.4 DATA INSPECTION
# 1. Use the class() function on glengths and metadata, how does the output differ between the two?
class(glengths) #numeric - datatype
class(metadata) #dataframe

# 2. Use the summary() function on the proj_summary dataframe, 
summary(proj_summary)
## 2.1 what is the median “rRNA_rate”? 0.005345

# 2.2 How long is the samplegroup factor?
length(samplegroup)

# 3. What are the dimensions of the proj_summary dataframe?
nrow(proj_summary) # 9 ROWS
ncol(proj_summary) # 8 COLUMNS
# OR
dim(proj_summary) # 9 x 8

# 4. When you use the rownames() function on metadata, what is the data structure of the output?
str(rownames(metadata)) # characters

# 5. [Optional] How many elements in (how long is) the output of colnames(proj_summary)? Don’t count, but use another function to determine this.
length(colnames(proj_summary)) # 8


#####################

### PART 2.1: DATA WRANGLING: SUBSETTING VECTORS AND VALUES ###

## VECTORS ##
# create a vector called age
age <- c(15, 22, 45, 52, 73, 81)
age

# If we only want the 5th value:
age[5]
# If we wanted all values except the fifth,
age[-5]

# If we wanted more than one element, use [ ]with vector of several index values:
age[c(3,5,6)]   ## nested

# OR
## create a vector first then select
idx <- c(3,5,6) # create vector of the elements of interest
age[idx]

# select sequences of values in vector 
age[1:4]


## EXERCISE 2.1 DATA WRANGLING WITH VECTORS
# Create a vector called alphabets with the following letters, C, D, X, L, F.
alphabets <- c(C, D, X, L, F)
alphabets
# Use the associated indices along with [ ] to do the following:
# only display C, D and F
alphabets[c(1,2,5)]
# display all except X
alphabets[-3]
# display the letters in the opposite order (F, L, X, D, C)
alphabets[5:1]


# Selecting using indices with logical operators
age
## which elements in age vector are greater than 50 (t/R values)
age >50

# select all values in the age vector over 50 or age less than 18:
age > 50 | age < 18
age
age[age > 50 | age < 18]

# OR
# create vector first then select
idx <- age > 50 | age <18
age[idx]


# Indexing with logical operators using the which() function
# to show output of indices where the values are TRUE

which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR
## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

# Indexing with logical operators using the which() function
# to show output of indices where the values are TRUE

which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR
## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]


## FACTORS ##
# categories: low, medium, high
# Extracting values of the factor with high expression
expression[expression == "high"] # returns elements in the factor equal to "high"

# The piece of code above was more efficient with nesting; we used a single step instead of two steps as shown below:
# Step1 (no nesting): idx <- expression == "high"
# Step2 (no nesting): expression[idx]


# EXERCISE 2.1 DATA WRANGLING WITH FACTORS
# Extract only those elements in [samplegroup] that are not KO (nesting the logical operation is optional).
samplegroup
samplegroup[samplegroup != "KO"] # use != for not equal to


# To view integer assignments under the hood, use str():
expression

str(expression)
# outputs: Factor w/ 3 levels "high","low","medium": 2 1 3 1 2 3 1

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)
# outputs: Factor w/ 3 levels "low","medium",..: 1 3 2 3 1 2 3


# EXERCISE 2.1 DATA WRANGLING WITH FACTORS 2
# Use the samplegroup factor we created in a previous lesson, 
# and relevel it such that KO is the first level followed by CTL and OE.
samplegroup

samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))
str(samplegroup)


########################

### PART 2.2: PACKAGES AND LIBRARIES ###
# check with libraries are loaded in your current R session using:
sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages


# R packages
install.packages("ggplot2")


# Loading Libraries
library(ggplot2)


## EXERCISE 2.2: PACKAGES 
# The ggplot2 package is part of the tidyverse suite of integrated packages which 
# was designed to work together to make common data science operations more user-friendly. 
# We will be using the [tidyverse] suite in later lessons, and so let’s install it. 
# NOTE: This suite of packages is only available in CRAN.
install.packages("tidyverse")



## PART 2.3: DATA WRANGLING: DATAFRAMES, MATRICES, LISTS
# DATAFRAMES #
metadata[1, 1] # Extract value 'Wt'
metadata[1, 3] # Extract value 1 from 1st row, third column
metadata[3. ] # Extract third row
metadata[ , 3] # Extract third column 
metadata[ , 3, drop = FALSE]# Extract third column as a df

metadata[ ,1:2] # create df using first 2 columns
metadata[c(1,3,6), ]# create df using row 1, 3, 6

# Extract celltype column for the first 3 samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 

colnames(metadata) # check column names of metadata
rownames(metadata) # Check row names of metadata

metadata$genotype # Extract genotype column using df_name$column_name
metadata$genotype[1:5] # Extract first 5 values of genotype column



## EXERCISE 2.3: DATA WRANGLING WITH DATAFRAMES
# Return a data frame with only the genotype and replicate column values for sample2 and sample8.
metadata
metadata[c("sample2", "sample8"), c("genotype", "replicate")]
# Return the fourth and ninth values of the replicate column.
metadata[ c(4,9), "replicate"]
# Extract the replicate column as a data frame.
metadata[ ,3, drop = FALSE]
# OR
metadata$replicate

# Selecting using indices with logical operators
## Looking for values equal to typeA (outputs True/False values)
metadata$celltype == "typeA"

# Extract the TRUE values from the above
logical_idx <- metadata$celltype == "typeA"
metadata[logical_idx, ]

# or which() also outputs the TRUE values
which(metadata$celltype =="typeA")

# returns the values one through six, indicating that the first 6 values or rows are true, or equal to typeA
idx <- which(metadata$celltype == "typeA")
metadata[idx, ]

# Extract the rows of the metadata data frame for only the replicates 2 and 3
which(metadata$replicate > 1)


idx <- which(metadata$replicate > 1) # save those indices into a variable idx
# use idx variable to extract those corresponding rows from the metatable
metadata[idx, ]

# OR: nesting to perform command in a single step
metadata[which(metadata$replicate > 1), ]

# save output as new variable sub_meta
sub_meta <- metadata[which(metadata$replicate > 1), ]

## EXERCISE 2.3: DATA WRANGLING WITH DATAFRAM AND MATRICES
# Subset the metadata dataframe to return only the rows of data with a genotype of KO.
which(metadata$genotype == "KO") # outputs the row numbers where value is TRUE
metadata # double-check


## LISTS ##
# Use [[ ]] to select specific component of list
list1[[2]]

comp2 <- list1[[2]]
class(comp2) # shows datatype, comp2 is dataframe

list1[[1]] 
# outputs: [1] "ecoli" "human" "corn" 

# To reference first element of first component use [ ]
list1[[1]][1]
# outputs: ecoli


## EXERCISE 2.3: DATA WRANGLING USING LISTS
# Create a list named random with the following components: metadata, age, list1, samplegroup, and number.
random <- list(metadata, age, list1, samplegroup, number)
random

#Extract the samplegroup component.
random[[4]]  # using number bc names for components havent been set yet


## EXERCISE 2.3: DATA WRANGLING WITH LISTS 2
# Let’s practice combining ways to extract data from the data structures we have covered so far:
# Set names for the random list you created in the last exercise.
names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
names(random)

# Extract the age component using the $ notation
random$age
