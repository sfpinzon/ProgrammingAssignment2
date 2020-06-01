## Put comments here that give an overall description of what your
## functions do

# #Creates environment for caching matrix inverse

makeCachematrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
  inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

#Caches matrix inverse and returns its value
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv
}
