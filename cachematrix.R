## makeCacheMatrix creates a matrix object that can cache its inverse.
## cacheSolve computes the inverse of the matrix returned above.  If 
## already calculated, it will retrieve the inverse from the cache.

## The first function is the cache (a placeholder) for a matrix and
## for its inverse.

makeCacheMatrix <- function(x = matrix()) { 
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() m
  list(set=set, get=get)
}


## The next function 'solves' for the inverse of the matrix and 
## assignes it to the cache, or retrieves it from the cache if 
## already present.

cacheSolve <- function(x) {
  m <- solve(x)
  if(!is.null(m)) {
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$set(m)
  m
}