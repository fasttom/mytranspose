source("R_mytranspose/mytranspose.R")
# test case matrix
mymat1 <- matrix(1:10, nrow=5, ncol=2) # common matrix
mymat2 <- matrix(NA, nrow = 0, ncol = 0) # null matrix
mymat3 <- matrix(c(1,2), nrow = 1, ncol = 2) # row vector matrix
mymat4 <- matrix(c(1,2), nrow = 2, ncol = 1) # col vector matrix

# test case vector
myvec1 <- c(1, 2, NA, 3)
myvec2 <- c(NA)
myvec3 <- c()

#test case dataframes
d <- c(1,2,3,4)
e <- c("red", "white", "red", "NA")
f <- c(TRUE, TRUE, TRUE, FALSE)
mydata1 <- data.frame(d,e,f)

#compare ignoring na
compare_with_na <- function (x,y) {
  same <- (x==y) | (is.na(x)&is.na(y)) #both na of same
  all_same = all(same) #for all element
  return(all_same)
}


check_transpose <- function (x) {
  correct = FALSE
  mytp = mytranspose(x)

  if (length(mytp)==0 && length(x)==0){ # 0 size Null
    if (all(is.na(mytp))&&all(is.na(x))) {
    correct = TRUE
    }
  }

  else {
    tp = t(x)
    correct = compare_with_na(mytp,tp)
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

