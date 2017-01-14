#UW Data Science - Winter 2017
#Assignment #1
#Dave Wine 8430191

#file read function
read.bldg = function(file = 'EnergyEfficiencyData.csv'){

bldg.data <- read.csv(file, header=TRUE, stringsAsFactors=FALSE)

factcols <- c('Orientation','Glazing.Area.Distribution')

bldg.data[, factcols]<-lapply(bldg.data[,factcols], as.numeric)
#bldg.data[, factcols]<-lapply(bldg.data[,factcols], as.character)
#cut('Orientation',4)
bldg.data[complete.cases(bldg.data),]
}

#read data in
bldg.data = read.bldg()

#view dataset and summary statistics
str(bldg.data)
summary(bldg.data)

#Create Factors from appropriate variables
factOrient <- cut(bldg.data$Orientation,breaks=4,labels=1:4)
factDist <- cut(bldg.data$Glazing.Area.Orientation,breaks=2,labels=1:2)
ggplot(bldg.data, aes(x = factor(Orientation), y = Heating.Load)) + geom_boxplot() + xlab('Orientation') + ggtitle('Heating Load by Orientation')
ggplot(bldg.data, aes(x = factor(Orientation), y = Cooling.Load)) + geom_boxplot() + xlab('Orientation') + ggtitle('Heating Load by Orientation')
ggplot(bldg.data, aes(x = factOrient, y = Cooling.Load)) + geom_boxplot() + xlab('Orientation') + ggtitle('Heating Load by Orientation')
ggplot(bldg.data, aes(x = factor(Orientation), y = Heating.Load)) + geom_violin(trim = FALSE, draw_quantiles = c(0.25, 0.5, 0.75)) + xlab('Orientation')  + ggtitle('Heating Load by Orientation')

ggplot(bldg.data, aes(x = Orientation, y = Heating.Load)) + geom_point() + 
  xlab('Orientation') + ylab('Heating.Load') + 
  ggtitle('Relationship between Orientation and Heating Load')
