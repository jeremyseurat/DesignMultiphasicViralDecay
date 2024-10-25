#User-defined model
form<-function(t,p,X){
A<-p[1]
alpha<-p[2]
B<-p[3]
beta<-p[4]
y<-(X*(A*exp(-alpha*t)+B*exp(-beta*t)))
return(y)
}
