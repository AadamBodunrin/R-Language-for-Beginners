library(AppliedPredictiveModeling)

data(segmentationOriginal)

segData <- subset(segmentationOriginal, Case == "Train")

CellID <- segData$Cell
Class <- segData$Class
Case <- segData$Case

segData <- segData[, -(1:3)]

statusColNum <- grep("Status", names(segData))

segData <- segData[, -statusColNum]

library(e1071)
skewness(segData$AngleCh1)
skewValues <- apply(segData, 2, skewness)
head(skewValues)


library(caret)
Ch1AreaTrans <- BoxCoxTrans(segData$AreaCh1)
Ch1AreaTrans


head(segData$AreaCh1)
predict(Ch1AreaTrans, head(segData$AreaCh1))
(819^(-.9) - 1)/(-.9)


pcaObject <- prcomp(segData,center = TRUE, scale. = TRUE)
percentVariance <- pcaObject$sd^2/sum(pcaObject$sd^2)*100
percentVariance[1:3]

head(pcaObject$x[, 1:5])
head(pcaObject$rotation[, 1:3])


trans <- preProcess(segData, method = c("BoxCox", "center", "scale", "pca"))
trans

transformed <- predict(trans, segData)
head(transformed[, 1:5])

nearZeroVar(segData)

correlations <- cor(segData)
dim(correlations)

correlations[1:4, 1:4]


library(corrplot)
corrplot(correlations, order = "hclust")

highCorr <- findCorrelation(correlations, cutoff = .75)
length(highCorr)

head(highCorr)

filteredSegData <- segData[, -highCorr]

data(cars)
type <- c("convertible", "coupe", "hatchback", "sedan", "wagon")
cars$Type <- factor(apply(cars[, 14:18], 1, function(x) type[which(x == 1)]))
carSubset <- cars[sample(1:nrow(cars), 20), c(1, 2, 19)]
head(carSubset)

levels(carSubset$Type)


simpleMod <- dummyVars(~Mileage + Type, data = carSubset, levelsOnly = TRUE)
simpleMod


predict(simpleMod, head(carSubset))




withInteraction <- dummyVars(~Mileage + Type + Mileage:Type, data = carSubset, levelsOnly = TRUE)
withInteraction

predict(withInteraction, head(carSubset))


#Chapter-4

library(AppliedPredictiveModeling)
data(twoClassData)

set.seed(1)

library(caret)
trainingRows <- createDataPartition(classes,p = .80,list= FALSE)
head(trainingRows)

trainPredictors <- predictors[trainingRows, ]
trainClasses <- classes[trainingRows]

testPredictors <- predictors[-trainingRows, ]
testClasses <- classes[-trainingRows]

str(trainPredictors)
str(testPredictors)

set.seed(1)
repeatedSplits <- createDataPartition(trainClasses, p = .80, times = 3)
str(repeatedSplits)


set.seed(1)
cvSplits <- createFolds(trainClasses, k = 10,returnTrain = TRUE)
str(cvSplits)

fold1 <- cvSplits[[1]]
cvPredictors1 <- trainPredictors[fold1,]
cvClasses1 <- trainClasses[fold1]
nrow(trainPredictors)
nrow(cvPredictors1)



trainPredictors <- as.matrix(trainPredictors)
knnFit <- knn3(x = trainPredictors, y = trainClasses, k = 5)
knnFit

testPredictions <- predict(knnFit, newdata = testPredictors,type = "class")
head(testPredictions)

str(testPredictions)

