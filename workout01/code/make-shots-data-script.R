# title: The Shots Data
# description: This file is related to the shots data of the nba players. The purpose if it is to summarize and process the data.
# inputs: 
# stephen-curry.csv
# kevin-durant.csv
# klay-thompson.csv
# draymond-green.csv
# andre-iguodala.csv
# outputs:
# stephen-curry-summary.txt
# klay-thompson-summary.txt
# kevin-durant-summary.txt
# draymond-green-summary.txt
# andre-iguodala-summary.txt
# shots-data-summary.txt
# shots-data.csv

library(dplyr)
curry=read.csv("../data/stephen-curry.csv",stringsAsFactors = FALSE)
thompson=read.csv("../data/klay-thompson.csv",stringsAsFactors = FALSE)
durant=read.csv("../data/kevin-durant.csv",stringsAsFactors = FALSE)
green=read.csv("../data/draymond-green.csv",stringsAsFactors = FALSE)
iguodala=read.csv("../data/andre-iguodala.csv",stringsAsFactors = FALSE)
curry=mutate(curry,name="Stephen Curry")
curry=curry[c(1,14,2,3,4,5,6,7,8,9,10,11,12,13)]
thompson=mutate(thompson,name="Klay Thompson")
thompson=thompson[c(1,14,2,3,4,5,6,7,8,9,10,11,12,13)]
durant=mutate(durant,name="Kevin Durant")
durant=durant[c(1,14,2,3,4,5,6,7,8,9,10,11,12,13)]
green=mutate(green,name="Graymond Green")
green=green[c(1,14,2,3,4,5,6,7,8,9,10,11,12,13)]
iguodala=mutate(iguodala,name="Andre Iguodala")
iguodala=iguodala[c(1,14,2,3,4,5,6,7,8,9,10,11,12,13)]
for (i in 1: length(curry$team_name))
{
  if(curry[i,8]=="n")
  {
    curry[i,8]="shot_no"
  }
  else
  {
    curry[i,8]="shot_yes"
  }
}
for (i in 1: length(thompson$team_name))
{
  if(thompson[i,8]=="n")
  {
    thompson[i,8]="shot_no"
  }
  else
  {
    thompson[i,8]="shot_yes"
  }
}
for (i in 1: length(durant$team_name))
{
  if(durant[i,8]=="n")
  {
    durant[i,8]="shot_no"
  }
  else
  {
    durant[i,8]="shot_yes"
  }
}
for (i in 1: length(green$team_name))
{
  if(green[i,8]=="n")
  {
    green[i,8]="shot_no"
  }
  else
  {
    green[i,8]="shot_yes"
  }
}
for (i in 1: length(iguodala$team_name))
{
  if(iguodala[i,8]=="n")
  {
    iguodala[i,8]="shot_no"
  }
  else
  {
    iguodala[i,8]="shot_yes"
  }
}

curry=mutate(curry,minute=curry$period*12-curry$minutes_remaining)
thompson=mutate(thompson,minute=thompson$period*12-thompson$minutes_remaining)
durant=mutate(durant,minute=durant$period*12-durant$minutes_remaining)
green=mutate(green,minute=green$period*12-green$minutes_remaining)
iguodala=mutate(iguodala,minute=iguodala$period*12-iguodala$minutes_remaining)

sink(file="../output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file="../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file="../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file="../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file="../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

table=rbind(curry,thompson,durant,green,iguodala)

write.csv(
  x=table,
  file="../data/shots-data.csv"
)

sink(file="../output/shots-data-summary.txt")
summary(table)
sink()




