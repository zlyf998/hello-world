## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

these functions can be disceribed as below:
 Caching Inverse of a Matrix



# Example usage

# m <- matrix(c(0, 2, 1, 0), nrow = 2, ncol = 2, byrow = TRUE)

# m2 <- makeCacheMatrix(m)

# cacheSolve(m2)

# [,1] [,2]

# [1,]  0.0    1

# [2,]  0.5    0

# cacheSolve(m2)

# inverse is cached

# [,1] [,2]

# [1,]  0.0    1

# [2,]  0.5    0



# Creates a matrix that can cache it's inverse

#

# Args:

#   x: A matrix (Optional)

#

# Returns:

#   A matrix with functions to get/set value & get/set inverse

makeCacheMatrix <- function(x = matrix()) {

  # cached inverse of matrix

  inv <- NULL

  

  ## getter/setter for matrix

  get <- function() x

  set <- function(y) {

    x <<- y

    inv <<- NULL

  }

  

  ## getter/setter for matrix inverse

  getinv <- function() inv

  setinv <- function(inverse) inv <<- inverse

  

  ## return list of functions for matrix

  list(get=get, set=set, getinv=getinv, setinv=setinv)

}



# Computes the inverse of a matrix. If the inverse has already been

# calculated before, the cached inverse is returned.

#

# Args:

#   x: A matrix

#   ...: Extra arguments

#

# Returns:

#   The inverse of the matrix

cacheSolve <- function(x, ...) {

  inv <- x$getinv()



  # return cached matrix inverse if it's been already computed

  if (!is.null(inv)) {

    message("inverse is cached")

    return(inv)

  }

  

  # compute inverse of matrix 

  m <- x$get()

  inv <- solve(m, ...)

  

  # cache inverse

  x$setinv(inv)

  

  # return inverse of matrix

  return(inv)

}
		 	makeCacheMatrix creates the object "matrix" and cache its inverse.
		cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated  the cachesolve should retrieve the inverse from the cache.
		
		 The use of the solve function can generate the inverse of a square matirx