## Put comments here that give an overall description of what your
## functions do

## The first function, is similar to makeVector that show in in the cachemean.R

makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    im <<- NULL
  }
  get <- function() x
  setinvmat <- function(invmat) im <<- invmat
  getinvmat <- function() im
  list(set = set, get = get,
       setinvmat = setinvmat,
       getinvmat = getinvmat)
}


## This is the actual function that does the inverse of the matrix after ...
## .. confirming it's not cached.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  im <- x$getinvmat()
  if(!is.null(im)) {
    message("getting cached data")
    return(im)
  }
  data <- x$get()
  im <- solve(data, ...)
  x$setinvmat(im)
  im
  
}


