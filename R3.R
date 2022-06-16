#Control Structure-if -else
# IF-STATEMENT
x<- 2
if (x>3) {y<- 10 }else {y<-0}
z<-if (x>3){10}else {0}

#FOR loop
for(i in 1:10){print (i)}
v<-c("a","b","c","d")
for (i in 1:4) {print(v[i])
  
}
for (i in seq_along(v)) {print(v[i])
  
}
for (letter in v) {print(letter)
  
}
for (i in 1:4) print(v[i])
#Nested FOR Loop
s<-matrix(1:6,2,3)  
for (i in seq_len(nrow(s))) {
  for (j in seq_len(ncol(s))) {
    print(s[i,j])
  
}
  
}
#WHILE Loop
count <-0
while(count < 10){
  print(count) 
  count <-count+1
}
z<-5

while(z>=3 && z<=10) {
  print(z)
  coin<-rbinom(1, 1, 0.5)
  
  if(coin== 1){ ##random walk 
    z<-z+1
  }else {
      z<-z-1
    }
}
###########
h<-5
if(h>=3 && h<=10) {
  print(h)
  coin<-rbinom(1, 1, 0.5)
  
  if(coin== 1){ ##random walk 
    h<-h+1
  }else {
    h<-h-1
  }
}

#REPEAT
x0<-1
tol<-1e-8

repeat{
  x1<- computeEstimate()
  
  if (abs(x1-x0)< tol){
    break
  }else{
    x0<-x1
  }
}
#next,return skip the flow of program
for (i in 1:100){
  if (i <=20){
    ##skip the first 20 iterations
    next
  } ## Do something here
}

########
###FUNCTIONS
add2 <- function(x,y){
    x+y
}
add2(4.5,6)
above10<-function(x){
  use<- x>10
  x[use]
}

above <-function(x,n){
  use<-x>n
  x[use]
}
x<-1:20
above(x,12)

#Columnmean 
columnmean <- function(y){
  nc<-ncol(y)
  means<-numeric(nc)
  for (i in 1:nc) {
    means[i]<- mean(y[,i])
    
  }
  means
}
columnmean(airquality)
####removing NA
columnmean <- function(y,removeNA=TRUE){
  nc<-ncol(y)
  means<-numeric(nc)
  for (i in 1:nc) {
    means[i]<- mean(y[,i], na.rm=removeNA)
    
  }
  means
}
columnmean(airquality)

columnmean(airquality,FALSE) ##To get back

mydata<-rnorm(100)
sd(mydata)
sd(x=mydata)

##Defining a function 
f<- function(a,b){
  a^2
}
f(2)

g<-function(a,b){
  print(a)
  print(b)
  
}
f(45) ###This one will give an error

###SCOPING RULES -SYMBOL BINDING 
f1<-function(x,y){x^2+y/z
}
f1(2,1) ##z is the free variable 

#Lexical Scoping 
make.power<- function(n){
  pow<-function(x){
    x^n
  }
  pow
}
cube<-make.power(3)
square<-make.power(2)
cube(4)
square(5)

#Exploring a function closure (what is the function environment??)
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))

#Lexical vs Dynamical scoping 
y<-10
f <- function(x){
  y<-2
  y^2+g(x)
  
}
g<-function(x){
  x*y
}
f(3)

##OPTIMIZATION EXAMPLE(Maximizing a Normal Likelihood)
make.NegLogLik<-function(data, fixed=c(FALSE,FALSE)){
  params<-fixed
  function(p){
    params[!fixed]<-p
    mu<-params[1]
    sigma<-params[2]
    a<- -0.5*length(data)*log(2*pi*sigma^2)
    b<- -0.5*sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}

set.seed(1);normals<- rnorm(100,1,2)
nLL<-make.NegLogLik(normals)
nLL

ls(environment(nLL))
#Estimating parameters
optim(c(mu=0,sigma=1),nLL)$par
#fixing sigma=2
nLL<- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL,c(-1,3))$minimum
#Fixing mu=1
nLL<- make.NegLogLik(normals, c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum

#plotting the Likelihood 
nLL<- make.NegLogLik(normals, c(1,FALSE))
x<- seq(1.7, 1.9, len=100)
y<- sapply(x, nLL)
plot(x, exp(-(y-min(y))),type = "l") 

nLL<- make.NegLogLik(normals, c(FALSE,2))
x<- seq(0.5, 1.5, len=100)
y<- sapply(x, nLL)
plot(x, exp(-(y-min(y))),type = "l") 
##DATES IN R
x<-as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
##TIME in R
x<-Sys.time()
x
p<-as.POSIXlt(x)
names(unclass(p))
p$sec
datestring<-c("January 10,2012 10:40","December 9, 2011 8:10")
k<-strptime(datestring,"%B %d, %Y %H:%M")
k
r<-as.Date("1980-01-01")
x<-as.POSIXlt(x)
r<-as.POSIXlt(r)
r-x
x-r
