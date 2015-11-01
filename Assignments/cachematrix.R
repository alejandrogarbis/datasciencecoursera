## With the following functions, the inverse of a matrix can be calculated.
## The first function calculates creates a special object matrix which stores
## 4 functions and can cache its inverse. 
## The second function, first check wether the inverse of matrix can already be
## found in the cache and, if not, calculates then 
## the inverse of that matrix.

## The following function actually stores 4 functions inside it: set, get, 
##setsolve and getsolve;

makeCacheMatrix <- function(x = matrix()) {
        ## s will be the value of the matrix inverse, and it's firs assigned
        ## to be NULL
        s <- NULL
        ## the value of the main function is changed from x to y; at the same
        ## time the inverse of the previous matrix is set to NULL (the previous
        ## inverse is not necessary anymore).
        set <- function(y) {
                x <<-y
                s <<- NULL
        }
        ## the function "get" returns the matrix stored in the main function.
        get <- function ()x
        ## the following function store the value of the inverse of the matrix
        ## indicated in the main function.
        setsolve <-function(solve) s <<- solve
        ## returns the value of the inverse of the matrix stored in the main
        ## function.
        getsolve <- function () s
        ## with the "list" function the 4 functions are stored in the 
        ## "makeCacheMatrix" function.
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}

## The following function will return the inverse of a given matrix. If the 
## inverse of the matrix is already stored in chache, the function will no 
## continue and will return the stored value instead and a message
## "getting cached data".

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
        ## the function checks if the value is stored in cache and it's not NULL
        if(!is.null(s)) {
                ## if the inverse value already exist, the function will show
                ## the message "getting cached data" and will return the stored
                ## vale.
                message("getting cached data")
                return(s)
        }
        ## if the inverse of the matrix was not already stored in cache, is then
        ## calculated, retrieved and stored in cache.
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}

