###Str Function
str(str)
str(lm)
str(ls)
f<-gl(40,10)
f
str(f)
library(datasets)
head(airquality)
str(airquality)
m<-matrix(rnorm(100),10,10)
str(m)
m[,1]
s<-split(airquality,airquality$Month)
str(s)

###Simulation
x<-rnorm(10)
x
x<-rnorm(10,20,2)
x
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10,1)
rpois(10,2)
rpois(10,20)

ppois(6,1)


#Generating Random Number From a Linear Model 
set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<-0.5+2*x+e
summary(y)
plot(x,y)

###########
set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)

##Random Sample 
set.seed(1)
sample(1:10,4) #without replacement 
sample(1:10,4)
sample(letters,5) #we can also sample letters 
sample(1:10) #permuation 
sample(1:10,replace=TRUE) #Sample with replacement

##R  profiler 
##Elapse time >User time
system.time(readLines("http://www.hesgoal.com"))

##Elapse time<User time
hilbert<-function(n){
  i<-1:n
  1/outer(i-1,i,"+")
  
}
x<-hilbert(1000)
system.time(svd(x))




