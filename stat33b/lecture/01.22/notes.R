# Stat 33B - Lecture 1
# Jan 22, 2020
#
# Instructor: Nick Ulle <nick.ulle@berkeley.edu>
#
# Lecture notes will usually be posted to bCourses by the end of the day.


# R Basics / Review
# =================
#
# R is an interactive language designed for statistical computing.
# 
# RStudio (a separate piece of software) is an integrated development
# environment (IDE) for R.
#
# We'll use both in this course. RStudio bundles in R, so you only need to
# install RStudio. More details in this week's lab.


# R has a Read-Eval-Print Loop (REPL):
#   1. Type an expression at the R prompt and hit the enter key.
#   2. R reads the expression.
#   3. R evaluates the expression to compute a result.
#   4. R prints the result in the console.
#   5. R loops back to waiting for you to enter an expression.
#
# This is similar to Python, Julia, Lisp, etc.
2 + 2

# We can also save code in R scripts (.R files). For example: this file.
#
# R has many built-in functions for doing math and stats:

sum(1, 2, 3)

2 + 2

sum

log(3)
sqrt(4)

sin(10)

# Getting Help
# ============
# R has built-in documentation.
#
# The `?` command gets documentation about a specific function or topic:
?sum

# The `??` command searches the documentation:

??graphics

# Surround text with single or double quotes to make a string (there is no
# difference).
#
# The help commands work with strings or with unquoted names.

?"+"
?"for"

# Order of Operations
# ===================
# The order of operations in R is similar to math and most programming
# languages.
#
# To see the full list:
?Syntax


# Attendance Question
# ===================
# Go to
#
#     https://www.yellkey.com/travel
#
# to answer. You have until approximately 5pm today.


# Variables
# =========
# A variable is a name with an associated value.
#
# We can assign variables in R with `=` or `<-` (they are mostly equivalent):

x = 5

x <- 5

log(base = 2, x = y <- 10)
log(base = 2, x = y = 10) # one case where <- is different

# Choose one and be consistent. I prefer `=`.
#
# We use can use variables to:
#   * Store results to avoid redundant computations.
#
#   * Write general expressions, such as `a*x + b`
#
#   * Break code into small steps, so it is easier to understand and to avoid
#     bugs.


# Named functions are just variables:


# Vectors & Vectorization
# =======================
# There's no such thing as a scalar in R.
#
# We can combine values (or vectors) into a single vector with the `c()`
# function:
x = c(5, 12, 6)
x

y = c("hi", 'hello')
y

c(5, "hi")
c("hi", 5)

c(TRUE, 5)

c(5, 5i)

c(5, c(6, 7))

c(x, 8)

# Many (but not all!) R functions are vectorized, which means they operate
# element-by-element when passed a vector argument:

c(1, 2, 3) + c(1, 2, 3)

sin(c(1, 2, 4))

# Vectorization is much faster than R's other methods for iterative
# computations!

c(1, 2, 3) + c(4, 5, 6, 7)

mean(c(1, 2, 3, 4))


# Copy-on-Write Semantics
# =======================
# R uses copy-on-write semantics for assignment.
#
# This means that if we assign `x` to `y`:
x = c(1, 2)
y = x

# And then modify `y`:
y[1] = 7

# Then `x` remains unchanged:
x

# Originally, `x` and `y` referred to the same value in memory.
# 
# When we modified `y` (a "write"), R automatically copied its value in memory.
