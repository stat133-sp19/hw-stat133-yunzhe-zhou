# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


source("R/private-summary.R")
source("R/private-checker.R")

#' @title the number of combinations
#' @description calculates the number of combinations
#' @param n the number of trials (numeric)
#' @param k a vector of number of success (numeric)
#' @return computed combinations
#' @export
#' @examples
#' bin_choose(n=5,k=2)
#' bin_choose(5,4)
#' bin_choose(4,1:3)
bin_choose=function(n,k)
{
       if(length(n)!=1){
        stop("length of n should be 1")
      } else if(max(k)>n){
      stop("k cannot be greater than n")
      } else if(floor(n)!=n){
        stop("n should be an integer")
      } else if(TRUE %in% (floor(k)!=k)){
        stop("k should be an integer")
      } else if(n<0){
        stop("n should be non-negative")
      } else if(TRUE %in% (k < 0)){
        stop("k should be non-negaive")
      }
    combination=factorial(n)/(factorial(k)*factorial(n-k))
  return(combination)
}

#' @title binomial probability
#' @description calculates the binomial probability
#' @param trials number of trials (numeric)
#' @param success a vector of number of successes (numeric)
#' @param prob probability (numeric)
#' @return computed combinations
#' @export
#' @examples
#' bin_probability(success=2,trials=5,prob=0.5)
#' bin_probability(success=0:2,trials=5,prob=0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability=function(success,trials,prob)
{
  check_prob(prob)
  check_trials(trials)
  check_success(success,trials)
  bin_probability=bin_choose(trials,success)*prob^success*(1-prob)^(trials-success)
  return(bin_probability)
}

#' @title binomial distribution
#' @description calculates the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed binomial distribution
#' @export
#' @examples
#' bin_distribution(trials=5,prob=0.5)
bin_distribution=function(trials,prob)
{
  success=c()
  probability=c()
  for(i in 1:(trials+1))
  {
    success[i]=i-1
    probability[i]=bin_probability(i-1,trials,prob)
  }
  table=data.frame(success,probability)
  class(table)=c("bindis","data.frame")
  return(table)
}

#' @export
plot.bindis=function(x,...)
{
  barplot(x$probability,names.arg = x$success,xlab="successes",ylab="probability")
}

#' @title binomial cumulative distribution
#' @description calculates the binomial cumulative distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed binomial cumulative distribution
#' @export
#' @examples
#' bin_cumulative(trials=5,prob=0.5)
bin_cumulative=function(trials,prob)
{
  table=bin_distribution(trials,prob)
  for(i in 1:trials)
  {
    table[i+1,2]=table[i,2]+ table[i+1,2]
  }
  class(table)=c("bincum","data.frame")
  return(table)
}



#' @export
plot.bincum=function(x,...)
{
  plot(x$success,x$probability,type="o",xlab="successes",ylab="probability")
}

#' @title object of class "binvar"
#' @description return an object of class "binvar"
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return ls (binvar)
#' @export
#' @examples
#' bin_variable(trials=5,prob=0.5)
bin_variable=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  ls=list(trials=trials,prob=prob)
  class(ls)="binvar"
  return(ls)
}

#' @export
print.binvar=function(x,...)
{
  string=paste0('"Binomial variable" \n \nParameters \n-number of trials: ',x[1],"\n-prob of success: ",x[2])
  cat(string)
  invisible(x)
}

#' @export
summary.binvar=function(object,...)
{
  trials=object$trials
  prob=object$prob
  mean=aux_mean(trials,prob)
  variance=aux_variance(trials,prob)
  mode=aux_mode(trials,prob)
  skewness=aux_skewness(trials,prob)
  kurtosis=aux_kurtosis(trials,prob)
  summary=c(trials,prob,mean,variance,mode,skewness,kurtosis)
  class(summary)="summary.binvar"
  return(summary)
}

#' @export
print.summary.binvar=function(x,...)
{
  string=paste0('"Summary Binomial" \n\nParameters \n-number of trials: ',x[1],"\n-prob of success: ",x[2],"\n\n","Measures","\n-mean    :",x[3],"\n-variance:",x[4],"\n-mode    :",x[5],"\n-skewness:",x[6],"\n-kurtosis:",x[7])
  cat(string)
  invisible(x)
}

#' @title the expected value of the binomial distribution
#' @description calculate the expected value of the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed expected value
#' @export
#' @examples
#' bin_mean(trials=5,prob=0.5)
bin_mean=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  mean=aux_mean(trials,prob)
  return(mean)
}

#' @title the variance of the binomial distribution
#' @description calculate the variance of the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed variance value
#' @export
#' @examples
#' bin_variance(trials=5,prob=0.5)
bin_variance=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  variance=aux_variance(trials,prob)
  return(variance)
}

#' @title the mode of the binomial distribution
#' @description calculate the mode of the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed mode value
#' @export
#' @examples
#' bin_mode(trials=5,prob=0.5)
bin_mode=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  mode=aux_mode(trials,prob)
  return(mode)
}

#' @title the skewness of the binomial distribution
#' @description calculate the skewness of the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed skewness value
#' @export
#' @examples
#' bin_skewness(trials=5,prob=0.5)
bin_skewness=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  skewness=aux_skewness(trials,prob)
  return(skewness)
}

#' @title the kurtosis of the binomial distribution
#' @description calculate the kurtosis of the binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability (numeric)
#' @return computed kurtosis value
#' @export
#' @examples
#' bin_kurtosis(trials=5,prob=0.5)
bin_kurtosis=function(trials,prob)
{
  check_trials(trials)
  check_prob(prob)
  kurtosis=aux_kurtosis(trials,prob)
  return(kurtosis)
}
