source("R_mytranspose/mytranspose.R")
# test case matrix
mymat1 <- matrix(1:10, nrow=5, ncol=2) # common matrix
mymat2 <- matrix(NA, nrow = 0, ncol = 0) # null matrix
mymat3 <- matrix(c(1,2), nrow = 1, ncol = 2) # row vector matrix
mymat4 <- matrix(c(1,2), nrow = 2, ncol = 1) # col vector matrix

# test case vector
myvec1 <- c(1, 2, NA, 3)
myvec2 <- NA
myvec3 <- NULL

#test case dataframes
d <- c(1,2,3,4)
e <- c("red", "white", "red", "NA")
f <- c(TRUE, TRUE, TRUE, FALSE)
mydata1 <- data.frame(d,e,f)

#compare ignoring na
compare_with_na <- function (x,y) {
  same <- (x==y) | (is.na(x)&is.na(y)) #both na of same
  all_same <- all(same) #for all element
  return(all_same)
}


check_transpose <- function (x) {
  correct <- FALSE
  mytp <- mytranspose(x)

  if (length(mytp)==0 && length(x)==0){ # 0 size Null
    if (all(is.na(mytp))&&all(is.na(x))) {
    correct <- TRUE
    }
  }

  else {
    tp <- t(x)
    correct <- compare_with_na(mytp, tp)
  }
  return(correct)
}


test_mytranspose <- function (x) {
  if (check_transpose(x)) {
    print("==========")
    print("mytranspose.R successfully transposed")
    print(x)
    print("into")
    print(mytranspose(x))
    print("==========")
    print("")
  }
  else {
    print("========")
    print("failed to transpose")
    print("original is")
    print(x)
    print("result is")
    print(mytranspose(x))
  }
}

print("#####TESTING VECTOR TRANSPOSE#####")
test_mytranspose(myvec1)
test_mytranspose(myvec2)
test_mytranspose(myvec3)

print("#####TESTING MATRIX TRANSPOSE#####")
test_mytranspose(mymat1)
test_mytranspose(mymat2)
test_mytranspose(mymat3)
test_mytranspose(mymat4)

print("#####TESTING DATAFRAME TRANSPOSE#####")
test_mytranspose(mydata1)


# Adding mixed type case
mixed_vector <- c(1, "a", TRUE, NA)
mixed_matrix_1 <- matrix(data=c(1, 2, 3, "a", "b", "c", TRUE, NA, FALSE), nrow=3, ncol=3)
mixed_matrix_2 <- matrix(c(1, "a", TRUE, NA, Inf, 0.01), nrow=2, ncol=3)

mixed_col_1 <- c(1,"a",TRUE, NA)
mixed_col_2 <- c("b", FALSE, Inf, 2)
mixed_col_3 <- c("TRUE",NA,0.1,"d")

mixed_data <- data.frame(mixed_col_1,mixed_col_2,mixed_col_3)

print("#####TESTING MIXED CLASSED DATASET#####")
test_mytranspose(mixed_vector)
test_mytranspose(mixed_matrix_1)
test_mytranspose(mixed_matrix_2)
test_mytranspose(mixed_data)

# =====new testcase added=====
# scalar case
new_scalar1 <- NA
new_scalar2 <- Inf
new_scalar3 <- "text"
new_scalar4 <- 1234567

print("#####TESTING SCALAR TRANSPOSE#####")
test_mytranspose(new_scalar1)
test_mytranspose(new_scalar2)
test_mytranspose(new_scalar3)
test_mytranspose(new_scalar4)

# vector case
new_vector_1 <- c("this", "is", "a", "vector")
new_vector_2 <- c(1, 0.1, 0.01, 0.001, 0)
new_vector_3 <- c(NA, Inf, NA, Inf)

print("#####TESTING VECTOR TRANSPOSE#####")
test_mytranspose(new_vector_1)
test_mytranspose(new_vector_2)
test_mytranspose(new_vector_3)

# matrix case
new_matrix_1 <- matrix(c("this", "is", "a", "matrix"), nrow = 2)
new_matrix_2 <- matrix(c(10, 1, 0.1, 0.01, 0.001, 0), nrow = 3)
new_matrix_3 <- matrix(c(Inf, Inf, Inf, NA, NA, NA), nrow = 3)

print("#####TESTING MATRIX TRANSPOSE#####")
test_mytranspose(new_matrix_1)
test_mytranspose(new_matrix_2)
test_mytranspose(new_matrix_3)

