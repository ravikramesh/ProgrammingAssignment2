## This method is used to compute the inverse of matrix. The calculation of matrix inversion is costly and instead of 
## computing everytime, caching the inversion of matrix, so that it won't compure repeatly.

## makeCacheMatrix function contains the following
# 1.set the value of the matrix
# 2.get the value of the matrix
# 3.set the value of inverse of the matrix
# 4.get the value of inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
   	inversemat <- NULL
        set <- function(y) {
                x <<- y
                inversemat <<- NULL
        }
        get <- function() x
        setmatrix <- function(matrix) inversemat <<- matrix
        getmatrix <- function() inversemat
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## This function returns the inverse of the matrix. It will check whether the inverse has been caculated and available in cache, if so
## it will return from the cache, otherwise it will caculate the inverse and set the value in the cache via setmatrix function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	
  	inversemat <- x$getmatrix()
        if(!is.null(inversemat)) {
                message("getting cached data")
                return(inversemat)
        }
        data <- x$get()
        inversemat <- solve(data)
        x$setmatrix(inversemat)
        inversemat
}
### 
#m6 <- matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)
#m7 <- makeCacheMatrix(m6)
#cacheSolve(m7)
#cacheSolve(m7)
