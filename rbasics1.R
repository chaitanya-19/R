#assign a particular value
x<-6
y<-5
#assign a char
h<-"feew"
k<-'gbw'
#arithmetic operations
x+y
x-y
x/y
x*y
#special operations
sqrt(x)
x^2
log(x)
log2(x)
exp(x)
logb(x,base=6)
#r specific funtions
#removes a varible
rm(h)
#########
#create a vector
q<-c(1,3,5,6,7)
w<-c('f','f','m')
#creating vector of sequencing numbers starting at 2 and ending at 5 in this case
a<-2:5
#starting at 1 ending at 10  in steps of 2 in this case
b<-seq(1,10,2)
#repeating a certain char or number,repeats x 2 times in this case
rep(x,2)
rep(a,3)
#adds\subs\mult\div  2(in this case) from every element of given sequnce
a+2
#if two vectors ar of same length we can add\sub\mul\div corresponding elements
c<-1:4
a+c
a*c
#to extract a particular element of a vector [] is used specifying the index inside
#note that indices start from 1 in R
a[1]
#specifying a negative index will print all the numbers except in that index
#in the above case it will prrint all the numbers except number in index 2
a[-2]
#prints number starting from index 2 to index 4
a[2:4]
#prints numbers in indices 1,3,5 as there is no element in5 it prints NA
a[c(1,3,5)]
#prints all nubers excpet in index 1and 3
a[-c(1,3)]
#prints all the values of which are less than 4
a[a<4]
######
#mtarix
#byrow command helps putting numbers row wise or column wise
matrix(c(1,2,3,4),nrow=2,ncol=2,byrow=TRUE)
mat=matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow=FALSE)
mat
mat[1,2]
mat[1,]
#usage of slicing operator as shown before
mat[1:2,1:3]
