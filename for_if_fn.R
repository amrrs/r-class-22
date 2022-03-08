# function - base-R, package fn, UDF 

# loop - for

# conditions - if & else 


sum_fn <- function(num1, num2) {
  result = num1 + num2 
  return(result)
}


for(i in 1:20){
  result = i * 5 
  print(result)
}

multiply_n <- function(which_table = 3, how_long = 10){
  
  result_vector = vector()
  
  for(i in 1:how_long){
    result = i * which_table
    if(result %% 2 != 0){
      result_vector = c(result_vector, result) #appending
    }else{
      
    }
    
  }
  
  return(result_vector)
}


