###week 3 Loop function and debugging

#Loop function 
#1) lapply
x<-list(a=1:5, b= rnorm(10))
lapply(x, mean)

v<-list(a=1:4, b=rnorm(10), c=rnorm(20,1),d=rnorm(100,5))
lapply(v,mean)
z<-1:4
lapply(z,runif)
lapply(z, runif,min=0,max=10)
z<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
z
lapply(z,function(elt)elt[,1])
#sapply similar to lapply- the lapply produces a list but sapply

#2) apply
b<-matrix(rnorm(200),20,10)
apply(b,2,mean)
apply(b,1,sum)
apply(b,1,quantile,prob=c(0.25,0.75))
c<-array(rnorm(2*2*10),c(2,2,10))
apply(c,c(1,2),mean)
rowMeans(c,dims = 2)
 
#3)Mapply: is a multivariate apply of sorts which applies a ffunction in 
#parallel over a set of arguments
str(mapply)
mapply(rep,1:4,4:1)
####
noise<-function(n,mean, sd){
  rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)
mapply(noise, 1:5,1:5,2)

#4) tapply : it is used to apply a futn over subsets of vector
p<-c(rnorm(10),runif(10), rnorm(10,1))
f<-gl(3,10)
f
tapply(p,f,mean)

#5) Split : takes vector or other objects and splits it into 
#groups determined by a factor or a list of factors
h<-c(rnorm(10),runif(10), rnorm(10,1))
f<-gl(3,10)
split(h,f)


lapply(split(h,f),mean)
library(datasets)
head(airquality)
s<-split(airquality,airquality$Month)
lapply(s ,function(h) colMeans(h[,c("Ozone","solar.R","Wind")]))

###Debugging Tools:using the tools
#Traceback
mean(k)
#dwbug
debug(lm)
lm(y-x)

#Recover
options(error=recover)
read.csv("nosuchfile")

# if you don't have data.table installed
# install.packages("data.table")

library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]

4+5
library(datasets)
data(iris)

library(datasets)
data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))

lapply(mtcars, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
mtcars_dt <- as.data.table(mtcars)

mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))

debug(ls)
ls
