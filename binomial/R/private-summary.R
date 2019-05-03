# Description: calculate the expected value of the binomial distribution
# Inputs
#   prob and trials value
# Output
#   mean
aux_mean=function(trials,prob)
{
  mean=prob*trials
  return(mean)
}
# Description: calculate the variance of the binomial distribution
# Inputs
#   prob: success and trials value
# Output
#   variance
aux_variance=function(trials,prob)
{
  variance=trials*prob*(1-prob)
  return(variance)
}
# Description: calculate the mode of the binomial distribution
# Inputs
#   prob: success and trials value
# Output
#   mode
aux_mode=function(trials,prob)
{
  m=prob*trials+prob
  if(floor(m)==m)
  {
    mode=c(m-1,m)
  } else
  {
    mode=floor(m)
  }
  mode=as.integer(mode)
  return(mode)
}
# Description: calculate the skewness of the binomial distribution
# Inputs
#   prob: success and trials value
# Output
#   skewness
aux_skewness=function(trials,prob)
{
  if(prob==0|prob==1)
  {
    return('Undefined')
  } else{
    skewness=(1-2*prob)/sqrt(trials*prob*(1-prob))
    return(skewness)
  }
}
# Description: calculate the kurtosis of the binomial distribution
# Inputs
#   prob: success and trials value
# Output
#   kurtosis
aux_kurtosis=function(trials,prob)
{
  if(prob==0|prob==1)
  {
    return('Undefined')
  } else{
    kurtosis=(1-6*prob*(1-prob))/(trials*prob*(1-prob))
    return(kurtosis)
  }
}

