x<-4
m<- 1:20
a<-c(TRUE,FALSE)
y<- vector('numeric', length = 5)
f<-vector()
b<- c(1.7,'a')
as.character(m)
as.logical(m)
as.logical(a)
a1<-list(1,'mylist',TRUE)
m1<-matrix(1:6,nrow = 2,ncol = 3)
m2<- 1:10
dim(m2)<-c(2,5)
b1<-1:3
b2<-10:12
cbind(b1,b2)
rbind(b1,b2)
c1<-factor(c("yes","yes","no","yes","no"))
table(c1)
unclass(c1)
c1<-factor(c("yes","yes","no","yes","no"),levels = c("yes","no")) #change the factors from default
msng<-c(1,2,NA,3,4)
is.na(msng)
df<-data.frame(foo=1:4,bar=c(T,T,F,F))
nrow(df)
ncol(df)
names(m)
m
names(b1)<-c("foo","bar","hert")
b1
names(b1)
dimnames(m1)<-list(c("a","b"),c("X","Y","Z"))
m1
y<-data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
new.y<-dget("y.R")
new.y
str(file)
con <-url("https://www.maths.dur.ac.uk/users/djoko.wirosoetisno/","r")
x<- readLines(con)
head(x)
title(x)
fon<-url("https://aims.ac.za/meet-the-visiting-lecturers/","r")
h<-readLines(fon)
head(h)
#sub-setting
j<-c("a","b","c","d","a")
j[2]
j[1:4] #sequence
j[j>"a"] 
u<-j>"a" #logical index
#subsetting a list
k<-list(foo=1:4,bar=0.6)
k[1]
k[[1]]
k$bar
k[["bar"]]
k["bar"]
l<-list(foo=1:4,bar=0.6,baz="hello")
l[c(1,3)]
name<-"foo"
l[[name]] #compute index for 'foo'
l$name #element 'name' does not exist!
l$foo
z<-list(a=list(10,12,14,15),n=c(3.14, 2.81))
z[[c(1,3)]]
z[[c(2,1)]]
#Subsetting a Matrix
v<-matrix(1:6, 2, 3)
v[1,2]
v[2,1]
v
v[1,2, drop=FALSE]
v[1,]
#Partial Matching
r<-list(aardvark=1:5)
r$a
r[["a"]]
r[["a",exact=FALSE]]
#Removing missing values
mm<-c(1,2,NA,4,NA,5)
bad<-is.na(mm)
mm[!bad]
nn<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(mm,nn)
good
mm[good]
nn[good]
airquality[1:6,]
good<-complete.cases(airquality)
airquality[good, ][1:6, ]
#Vectorized Operation
aa<-1:4; bb<-6:9
aa+bb
aa
aa>2
aa<=2
bb==8
ss=2
aa+ss
ff=12:15
ff
aa*bb
aa/bb
cc<-matrix(1:4,2,2);dd<-matrix(rep(10,4),2,2)
cc*dd
cc/dd
dd
cc
cc %*% dd
