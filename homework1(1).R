#mean
baby1<-read.table("babies.txt", header=TRUE)
baby2<-read.table("babies23.txt",header = TRUE)
smoker<- which(baby1['smoke'] == 1)
baby1smoker<-baby1[smoker,]
summary(baby1smoker)
nonsmoker<-which(baby1['smoke']==0)
baby1nonsmoker<-baby1[nonsmoker,]
summary(baby1nonsmoker)
smoker2<-which(baby2['smoke']==1)
baby2smoker<-baby2[smoker2,]
summary(baby2smoker)
baby2<-baby2[!baby2$smoke==9,]
nonsmoker2<-setdiff(rownames(baby2), smoker2)
summary(baby2nonsmoker)
#Calculate standard deviation 
babywt1<-baby2nonsmoker$wt
sd(babywt1)
babywt2<-baby2smoker$wt
sd(babywt2)
#histagram
hist(baby2nonsmoker$wt,ylim=c(0,200),xlim = c(40,180),xlab='babyweight',main='Nonsmoker_Babyweight')
hist(baby2smoker$wt,ylim=c(0,200),xlim = c(40,180),xlab='babyweight',main='Smoker_Babyweight')
#boxplot
baby1<-baby1[!baby1$smoke==9,]
boxplot(bwt~smoke,baby1,ylab='babyweight (ounce)',names=c('nonsmoke','smoke'),col=c('royalblue','sienna'),main='Boxplot of Babyweight')

#frequency
frequency1<-table(baby1smoker$bwt)
frequency1<-as.data.frame(frequency1)
frequency1$Var1<-as.numeric(as.character(frequency1[,1]))
f1<-frequency1[which(frequency1[,1] <88), ]
sum(f1$Freq)

frequency2<-table(baby1nonsmoker$bwt)
frequency2<-as.data.frame(frequency2)
frequency2$Var1<-as.numeric(as.character(frequency2[,1]))
f2<-frequency2[which(frequency2[,1] <88), ]
sum(f2$Freq)

#total babys
sum(frequency1$Freq)
sum(frequency2$Freq)

#hypo 2
old<-which(baby1["age"]>=35)
baby1old<-baby1[old,]
baby1old<-baby1old[!baby1old$age==99,]
young<-which(baby1["age"]<35)
baby1young<-baby1[young, ]
baby1young<-baby1young[!baby1young$age==99,]
summary(baby1old)
summary(baby1young)
sd(baby1old$bwt)
sd(baby1young$bwt)
hist(baby1young$bwt,ylim=c(0,250),xlim=c(40,180),xlab = 'babyweight',main = "Age greater or equal to 35_babyweight")
hist(baby1old$bwt,ylim=c(0,250),xlim=c(40,180),xlab = 'babyweight',main = "Age greater or equal to 35_babyweight")
baby1old$Y=1
baby1young$Y=2
baby1box<-cbind(baby1young,baby1old)
boxplot(bwt~Y,baby1box,ylab='babyweight (ounce)',
        names=c("mother greater or equal to 35 years old","mother less than 35 yearsold"),
        col=c('royalblue','sienna'),main='Boxplot of Babyweight')