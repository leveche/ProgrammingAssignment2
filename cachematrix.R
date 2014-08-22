## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    # (cached) inverse
    inv <- NULL

    # methods to operate on the cached inverse
    getinv <- function() inv
    setinv <- function(matrixInverse) inv <<- matrixInverse
    
    ## getter and setter methods are boilerplate

    get <- function() x
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    # Return the handle to myself
    list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    inv <- x$getinv()

    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
