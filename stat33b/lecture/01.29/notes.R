# Stat 33B - Lecture 2
# Jan 29, 2020

# Announcements
# =============
#
# Assignment 1 will be posted to bcourses later today.
#
# Please make sure you have access to Piazza.
#
# Today's attendance question:
#
#   yellkey.com/law


# Review: Copy-on-Write Semantics
# ===============================
# R uses copy-on-write semantics for assignment.
#
# This means that if we assign `x` to `y`:
x = c(1, 2)
y = x

# And then modify `x`:
x[1] = 7

# Then `y` remains unchanged:
y

# Originally, `x` and `y` referred to the same value in memory.
#
# When we modified `y` (a "write"), R automatically copied its value in memory.


# Data Frames
# ===========
# For the next few lectures, we'll use the "dogs" data set. You can download a
# copy from bcourses. The data set is originally from:
#
#   https://informationisbeautiful.net/visualizations/
#     best-in-show-whats-the-top-data-dog/


# You can load the file from an absolute path, or a path relative to the
# working directory. Helpful functions:
#
# getwd() -- get the current working directory
# setwd() -- set the current working directory
#
# Idiomatic R: use paths relative to your .R file, and avoid setting the
# working directory.
getwd()
setwd("/home")

getwd()

list.files()

# Use "/" in paths in R even if you are on Windows.

# ".." in a path means the directory above the current directory:

list.files("..")

# The dogs data set on bcourses is saved in RDS format.
#
# RDS stands for "R Data Serialized", and is R's native serialization format.
# (for Python users, RDS is similar to pickle)
#
# You can read an RDS file with `readRDS`:
dogs = readRDS("data/dogs/dogs_full.rds")


# Not a good idea to print an entire unfamiliar data set!
#
# Instead, we can inspect the data set with functions such as:
#
# head()  -- print first 6 rows
# tail()  -- print last 6 rows
# dim()   -- print dimensions
# nrow()  -- print number of rows
# ncol()  -- print number of columns
# str()   -- summarize structure of an object
# summary() -- summarize an object
#
head(dogs)

tail(dogs)

nrow(dogs)

str(dogs)

summary(dogs)


# In statistics, tabular data usually has:
#   * Observations as rows
#   * Features as columns
#
# R's data structure for tabular data is the "data frame".
#
# The dogs data is an example of a data frame.
head(dogs)


# Data types in each column must be homogeneous (like a vector).
#
# Data types in each row can be heterogeneous.
#
# For instance, if we get an individual column with `$`:
dogs$breed

dogs$"breed"

# To create a data frame:
data.frame(x = c(1, 5, 7), height = c(2.1, 3.1))

# Q: Is there a way to combine data frames?
#
# A: `rbind()`, `cbind()` to add rows or columns respectively.
# We'll learn about these later.

# Types & Classes
# ===============
# How do we know the dogs data is a data frame?


# In R, every object has at least one class.
#
# Class specifies how the object behaves in R.
#
# Class answers the question "How does this thing behave?"
#
# Check S3 class with `class`:
class(dogs)

class(5.1)

class("hi")

class(c("hi","hello"))

class(lm)

# We can create a sequence with `:`
1:3
2:7

# Data frames created with `data.frame()` only have one class:
class(data.frame(x = 1:3))


# Every object has exactly one type, too.
#
# Type specifies how the object is stored in memory.
#
# Type answers the question "What is this thing?"
#
# Check type with `typeof`:
typeof("hi")

typeof(3.1)

typeof(dogs)


# R "sees" scalars as 1-vectors.
#
# Scalars and vectors have the same type and class:
typeof(1)

typeof(c(1, 2, 3))

# Append L to an integer to make an integer-type value:
typeof(1L)

# Technically, class and type are independent.
#
# So we could tell an integer that it's a data frame:
x = 1L
class(x)

class(x) = "data.frame"

x

class(x)

# Of course, this is silly. Most of the time, each class corresponds to a
# specific type or set of types.


# R can automatically coerce types upward in this ordering:
#
# * list
# * character (strings)
# * complex
# * double / numeric
# * integer
# * logical
#
# Most notably, this happens when making a vector with `c`:

c(T, F, 6) # coerced upwards to double/numeric, since 6 is numeric

# R usually won't coerce types downward, but it depends on the function.
rnorm(3)

rnorm("3.1")

# Some types exist outside the ordering:
typeof(lm)


# A Few More Data Structures
# ==========================
# Lists are general-purpose containers for heterogeneous objects:
list(4.1, "hi", lm)

typeof(c(4.1, sin))
class(c(4.1, sin))

# Every (ordinary) data frame is a list:
typeof(dogs)

# We can really see this if we remove the class from the data frame:
unclass(dogs)

# More about subtleties of lists next week.


# Matrices are useful for homogeneous tabular data:
matrix(c("a", "b", "c", "d"), 2, 2)

# Type of the matrix is the same as the type of its elements.
typeof(matrix(c("a", "b", "c", "d"), 2, 2))

# R matrices are stored in column order in memory.
#
# So it's usually faster to operate on columns rather than rows.


# In R, "arrays" generalize vectors and matrices to higher dimensions:

array(1:12, 2, 2, 3) # a 2 x 2 x 3 object

# R does not provide built-in stack, queue, or tree data structures.
#
# R provides a limited hash table data structure; we'll see it later on.
#
# Some of these are also provided in R packages.
