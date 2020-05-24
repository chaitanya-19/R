#a funtion which takes two numbers and retrns the sum 
#note that  it return the last statement
add<-function(x,y)
{
  x+y
}
#giving in defalt values
add2<-function(a,b=2)
{
  a+b
}
#a function which returns all the value in avector which are above 10
above10<-function(x)
{
  check<-x>10
  x[check]
}
#other way of writing same function
above10_2<-function(x,leng)
{
  z<-numeric(leng)
  for(i in x)
  {
    if(x[i]>10)
    {
      z[i]<- x[i] 
      
    }
  }
  z
}
#this function takes a data frame and return the means of each column
#read some data first 
mean_coloumn<-function(x)
{
  nc<-ncol(x)
  means<-numeric(nc)
  for(i in 1:nc)
  {
    means[i]<-mean(x[,i])
  }
  means
}
#this function removes the NAs so that we can calculate the means
mean_coloumn_removeNA<-function(x,removeNA=TRUE)
{
  nc<-ncol(x)
  means<-numeric(nc)
  for(i in 1:nc)
  {
    means[i]<-mean(x[,i],na.rm = removeNA)
  }
  means
}
#intresting inbuit functions
currenttime<-Sys.time()
print(currenttime)
currenttimezone<-Sys.timezone()
print(currenttimezone)