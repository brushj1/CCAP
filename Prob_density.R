#ARCH MECH PDF
#Jared Brush
#####################
library(readr)
library(plyr)
library(dplyr)
library(tidyr)
library(ggplot2) 
library(lubridate)
library(data.table)
library(zoo)
library(scales)
library(extrafont)
#####################

#set working Directory
setwd("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF")

#load elevation data
data_all=read_csv("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF/elevation.csv")
data_all88=read_csv("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF/elevationNAVD88.csv")

ne_data = read_csv("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF/northeast.csv")
se_data = read_csv("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF/southeast.csv")
sw_data = read_csv("A:/Climate Change Adaptation/Jared_Brush_Workplan/RPDF/southwest.csv")

#load fonts
windowsFonts(Calibri=windowsFont("Calibri"))
par(family="Calibri")

#plot density of daily max tides
fill <- "yellow"
line <- "red"

#for ALL plants, in ft
all_plants <-ggplot(data_all, aes(x=elevation)) + 
  geom_density(fill = fill, colour = line, alpha = 0.4)
all_plants

all_plants <-ggplot(data_all, aes(x=elevation)) + xlab("Plant Datum, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

all_plants +geom_vline(xintercept=c(94.13,104.75,109.44,112.38,113.6),linetype='dashed', color = "black", size=1)+
  geom_text(aes(x=93, label="25th percentile = 94.13", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=103.4, label="50th percentile = 104.75", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=108.2, label="75th percentile = 109.44", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=111.2, label="90th percentile = 112.38", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=114.3, label="95th percentile = 113.6", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=75, y=0.04, label="All plants, Plant Datum",color="black")


#for ALL plants in NAVD88
all_plants88 <-ggplot(data_all88, aes(x=Elevation)) + 
  geom_density(fill = fill, colour = line, alpha = 0.4)


all_plants88 <-ggplot(data_all88, aes(x=Elevation)) + xlab("NAVD88, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

all_plants88+geom_vline(xintercept=c(-1.25,9.38,14.67,17.46,18.24),linetype='dashed', color = "black", size=1)+
  geom_text(aes(x=-2.25, label="25th percentile = -1.25", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=8.2, label="50th percentile = 9.38", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=13.2, label="75th percentile = 14.67", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=16.1, label="90th percentile = 17.46", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=19, label="95th percentile = 18.24", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=-20, y=0.04, label="All plants, NAVD88",color="black")

#northeast
northeast <-ggplot(ne_data, aes(x=ft)) + xlab("Plant Datum, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

northeast +geom_vline(xintercept=c(98.17,106.04,110.5,113.28,114.9),linetype='dashed', color = "black", size=1)+
  geom_text(aes(x=97, label="25th percentile = 98.17", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=105, label="50th percentile = 106.04", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=109.5, label="75th percentile = 110.5", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=112.3, label="90th percentile = 113.27", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=115.4, label="95th percentile = 114.9", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=75, y=0.04, label="Northeast Plant, Plant Datum",color="black")

northeast88 <-ggplot(ne_data, aes(x=NAVD88))+ xlab("NAVD88, ft")+ 
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

northeast88 +geom_vline(xintercept=c(2.8,10.7,15.1,17.9,19.6),linetype='dashed', color = "black", size=1)+
  geom_text(aes(x=1.8, label="25th percentile = 2.8", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=9.7, label="50th percentile = 10.7", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=14.1, label="75th percentile = 15.1", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=16.9, label="90th percentile = 17.9", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=20.5, label="95th percentile = 19.5", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=-20, y=0.04, label="Northeast Plant, NAVD88",color="black")

#southeast Plant Datum
southeast <-ggplot(se_data, aes(x=ft)) + xlab("Plant Datum, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

southeast +geom_vline(xintercept=c(95.58,104.17,107.92,110.3,110.5),linetype='dashed', color = "black", size=.5)+
  geom_text(aes(x=94.5, label="25th percentile = 95.58", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=103, label="50th percentile = 104.17", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=107, label="75th percentile = 107.92", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=109.3, label="90th percentile = 110.3", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=111, label="95th percentile = 110.5", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=75, y=0.04, label="Southeast Plant, Plant Datum",color="black")

#southeast NAVD88
southeast88 <-ggplot(se_data, aes(x=NAVD88)) + xlab("NAVD88, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

southeast88 +geom_vline(xintercept=c(1.29,9.88,13.63,16.01,16.21),linetype='dashed', color = "black", size=.5)+
  geom_text(aes(x=.29, label="25th percentile = 1.29", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=8.88, label="50th percentile = 9.88", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=12.6, label="75th percentile = 13.63", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=15, label="90th percentile = 16.01", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=17, label="95th percentile = 16.21", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=-20, y=0.04, label="Southeast Plant, NAVD88",color="black")

#southwest plant datum
southwest <-ggplot(sw_data, aes(x=ft)) + xlab("Plant Datum, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

southwest +geom_vline(xintercept=c(90,103,107.31,109.5,111.66),linetype='dashed', color = "black", size=1)+
  geom_text(aes(x=89, label="25th percentile = 90", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=102, label="50th percentile = 103", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=106.5, label="75th percentile = 107.3", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=108.8, label="90th percentile = 109.5", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=111, label="95th percentile = 111.6", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=83, y=0.04, label="Southwest Plant, Plant Datum",color="black")

#southeast NAVD88
southwest88 <-ggplot(sw_data, aes(x=NAVD88)) + xlab("NAVD88, ft")+
  geom_density(fill = fill, colour = line, alpha = 0.4)+ theme(
    panel.background = element_rect(fill = "gray91",
                                    colour = "gray91",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                    colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                    colour = "white")
  )

southwest88 +geom_vline(xintercept=c(-5.37,7.63,11.94,14.13,16.29),linetype='dashed', color = "black", size=.5)+
  geom_text(aes(x=-6, label="25th percentile = -5.37", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=6.9, label="50th percentile = 7.63", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=11.3, label="75th percentile = 11.94", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=13.5, label="90th percentile = 14.13", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  geom_text(aes(x=15.5, label="95th percentile = 16.29", y=0.009), color = "black", angle=90, size=4, family="Calibri")+
  annotate(geom="text", x=-13, y=0.04, label="Southwest Plant, NAVD88",color="black")
#Find different percentiles and mean
quantile(ne_data$NAVD88, c(.25, .5, .75, .90, .95))
mean(data$elevation)
median(data$elevation)

