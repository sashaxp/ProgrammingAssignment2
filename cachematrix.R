## Put comments here that give an overall description of what your
## functions do

## This funtcion represent container for original matrix and inverse one if exist
## If new matrix passed to container we have to null inverse 

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This functions return inverse matrix from cache if it is already in special container
## and if not it inverse matrix first, populate container with inverse matrix and
## return inversed matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data)
  x$setsolve(s)
  s
}
