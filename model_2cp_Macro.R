#User-defined model
form<-function(t,p,X){
V1_0<-p[1] #f_a
c_V1<-p[2] #alpha
V2_0<-p[3] #f_b
c_V2<-p[4] #beta
y<-(X*(V1_0*exp(-c_V1*t)+V2_0*exp(-c_V2*t)))
return(y)
}
