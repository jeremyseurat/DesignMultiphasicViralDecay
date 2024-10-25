#User-defined model
formED<-function(t,y,p){
V0<-p[1]
dec<-p[2]

dy <- -dec*y[1]*(y[1]/V0)


list(c(dy),c(y[1]))
}

