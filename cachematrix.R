## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  ## list contains the environments, where the object is stored
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  ## assign a potential cached result to m
  m <- x$getsolve()
  
  ## If matrix has allready been stored, get results out of cache.
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## otherwise, do the calculation and 
  matrix <- x$get()
  m <- solve(matrix, ...)
  ## and cache result with setsolve
  x$setsolve(m)
  m
}
