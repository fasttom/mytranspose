mytranspose_matrix <- function(x) {
  y <- matrix(1, nrow = ncol(x), ncol = nrow(x))
  for (i in 1:nrow(x)) {
    for (j in 1:ncol(x)) {
      y[j,i] <- x[i,j]
    }
  }
  return(y)
}


mytranspose_dataframe <- function (x) {
  x_mat <- as.matrix(x)
  y <- mytranspose_matrix(x)
  return(y)
}


mytranspose_vector <- function (x) {
  # type vector treated as column vector
  # so convert into row vector
  # since R interprets scalar as vector
  # scalar also falls into this case
  x_mat <- as.matrix(x)
  y <- mytranspose_matrix(x_mat)
  return(y)
}

mytranspose_null <- function (x) {
  y <- x
  return(y)
}

mytranspose_scalar <- function (x) {
  y <- x
  return(y)
}

mytranspose <- function (x) {
  # Null
  if (length(x) == 0) {
    y <- mytranspose_null(x)
  }

   # Scalar
  else if (length(x) == 1) {
    y <- mytranspose_scalar(x)
  }

  # vector
  else if (is.vector(x)) {
     y <- mytranspose_vector(x)
   }

  # dataframe
  else if (is.data.frame(x)) {
    y <- mytranspose_dataframe(x)
  }

  # matrix
  else if (is.matrix(x)) {
    y <- mytranspose_matrix(x)
  }

  # unsupported type
  else {
    print("transpose of this type is not supported.")
    print("x should have type [null], [scalar], [vector], [dataframe] or [matrix]")
    y <- x
  }
  return(y)
}



