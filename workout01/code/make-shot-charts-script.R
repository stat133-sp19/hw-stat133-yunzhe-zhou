# title: The Shot Charts
# description: The purpose of it is to create the shot charts of the nba players.
# inputs:
# shots-data.csv
# outputs:
# andre-iguodala-shot-chart.pdf
# draymond-green-shot-chart.pdf
# gsw-shot-charts.pdf
# gsw-shot-charts.png
# kevin-durant-shot-chart.pdf
# klay-thompson-shot-chart.pdf
# nba-court.jpg
# stephen-curry-shot-chart.pdf

library(ggplot2)
library(jpeg)
library(grid)

table=read.csv("../data/shots-data.csv")
curry=table[1:1250,]
thompson=table[1251:2470,]
durant=table[2471:3385,]
green=table[3386:3963,]
iguodala=table[3964:4334,]

court_file="../images/nba-court.jpg"
court_image=rasterGrob(
  readJPEG(court_file),
  width=unit(1,"npc"),
  height=unit(1,"npc")
)

pdf(file="../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
 ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
 dev.off()
 
 pdf(file="../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
 ggplot(data = thompson) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart: Klay Thompson (2016 season)') +
   theme_minimal()
 dev.off()
 
 pdf(file="../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
 ggplot(data = durant) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart: Kevin Durant (2016 season)') +
   theme_minimal()
 dev.off()
 
 pdf(file="../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
 ggplot(data = green) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart: Graymond Green (2016 season)') +
   theme_minimal()
 dev.off()
 
 pdf(file="../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
 ggplot(data = iguodala) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart: Andre-iguodala (2016 season)') +
   theme_minimal()
 dev.off()

 pdf(file="../images/gsw-shot-charts.pdf",width=8,height=7)
 ggplot(data = table) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart (2016 season)') +
   facet_wrap(~name) +
   theme_minimal()
 dev.off()
 
 png(filename ="../images/gsw-shot-charts.png",width=8,height=7,units="in",res=300)
 ggplot(data = table) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   ggtitle('Shot Chart (2016 season)') +
   facet_wrap(~name) +
   theme_minimal()
 dev.off()
 
 
 
 