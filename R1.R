x<- 1+2
v=x**2
x<-rnorm(100)
x
y<-2*x**2
y
plot(x,y)
hist(x)
hist(rnorm(100),mean=8,sd=4)
y<-seq(-pi,pi,0.1)
y1<-seq(-pi,pi)
plot(y,sin(y),col='red',xlab='my', ylab='frequency',main='y vs x')



