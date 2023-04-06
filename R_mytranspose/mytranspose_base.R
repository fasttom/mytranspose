mytranspose_base <- function(x) {
  y <- matrix(1, nrow = ncol(x), ncol = nrow(x))
  for (i in seq_len(nrow(x))) {
    for (j in seq_len(ncol(x))) {
      y[j,i] <- x[i,j]
    }
  }
  return(y)
}