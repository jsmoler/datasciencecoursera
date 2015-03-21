## this function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(matrix = matrix()) {
  
  invertedmatrix <- NULL #initializes the inverted matrix
  
  setinverse <- function(inverse) matrixinverse <<- inverse    #assigns inverse value from different environment
  
  getmatrix <- function() matrix      #obtains matrix
  
  getinverse <- function() matrixinverse    #obtains inverse
  
  list(setinverse = setinverse, getmatrix = getmatrix, getinverse = getinverse)
  #sets the inverse and retrieves both the matrix and inverse matrix for use in list form for proceeding computations
}


##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(matrix, ...) {
	
  if(is.null(matrix$getinverse()))   #checks for prior inverse calculation
    
    matrix$setinverse(solve(matrix$getmatrix()))       #if matrix hasn't changed, it retreives the cached matrix
  
  matrix$getinverse()
}