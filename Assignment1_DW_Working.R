

read.bldg = function(file = 'EnergyEfficiencyData.csv'){

bldg.data <- read.csv(file, header=TRUE, stringsAsFactors=FALSE)

#numcols <- c('Orientation','Glazing Area Distribution')

#bldg.data[, numcols]<-lapply(bldg.data[,numcols], as.numeric)

}

bldg.data = read.bldg()

str(bldg.data)
summary(bldg.data)
