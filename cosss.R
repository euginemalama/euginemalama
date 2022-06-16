makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y         # Assign the input argument to the x object in the parent envi
    m <<- NULL      # Assign the NULL to the inv object in the parent envir
  }
  get <- function() x     # R retrieve the x from parent envir of makeCacheMatrix 
  setmean <- function(mean) m <<- mean      # Assign the input argument to the m object
  getmean <- function() m         # R retrieve the m from parent envir of makeCacheMatrix
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}