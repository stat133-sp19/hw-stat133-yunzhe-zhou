# Description: check the validity of probability value
# Inputs
#   prob: probability value
# Output
#   error message or TRUE
check_prob=function(prob)
{
  if(length(prob)!=1)
  {
    stop("the length of prob should be 1")
  } else if(class(prob)!="numeric")
  {
    stop("invalid prob value")
  } else if (prob>1 | prob<0) {
    stop("p has to be a number between 0 and 1")
  } else{
    return(TRUE)
  }
}

# Description: check the validity of trials value
# Inputs
#   prob: probability value
# Output
#   error message or TRUE
check_trials=function(trials)
{
  if(length(trials)!=1)
  {
    stop("the length of trials should be 1")
  } else if(class(trials)!="numeric"){
    stop("invalid trials value")
  } else if (floor(trials)!=trials | trials<0) {
    stop("trials should be a non-negative integar")
  } else{
    return(TRUE)
  }
}

# Description: check the validity of success and trials
# Inputs
#   prob: success and trials value
# Output
#   error message or TRUE
check_success=function(success,trials)
{
  judge=function(success)
  {
    for(i in 1:length(success))
    {
      if(success[i]<0 | floor(success[i])!=success[i])
        return(FALSE)
    }
    return(TRUE)
  }
  if(is.vector(success)==FALSE)
  {
    stop("invalid success value")
  } else if(class(success)!="numeric"&class(success)!="integer"){
    stop("invalid success value")
  } else if(judge(success)==FALSE){
    stop("success should be a vector of non-negative intergers")
  } else if(max(success)>trials){
    stop("success cannot be greater than trials")
  } else{
    return(TRUE)
  }
}

