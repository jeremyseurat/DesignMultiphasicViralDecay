PFIM 4.0  
 
Option: 1 

 
Project: viraldecay
 
Date: Wed Oct 16 12:02:42 2024
 

 
**************************** INPUT SUMMARY ********************************
 
Differential Equations form of the model:  
 
function(t,y,p){
V0<-p[1]
dec<-p[2]

dy <- -dec*y[1]*(y[1]/V0)


list(c(dy),c(y[1]))
}
<bytecode: 0x000002ea882df380>

 
Initial Conditions at time 0 : 
 
V0 

Error tolerance for solving differential equations system: RtolEQ = 1e-08 , AtolEQ = 1e-08 , Hmax =  Inf
 
Initial design: 

 
Sample times for response: A 
                                      Protocol subjects condinit
1 c=(0, 0.04, 0.12, 0.17, 0.33, 0.67, 1, 2, 3)        1    c(V0)

 
Total number of samples: 9
 
Associated criterion value: 0.2318
 
Identical sampling times for each response: TRUE
 
Variance error model response A : ( 0 + 0.1 *f)^2

 

Optimization step:  
 
Sampling windows for the response: A 
Window 1 : t= 0 0.04 0.08 0.12 0.17 0.21 0.25 0.29 0.33 0.67 0.71 0.75 0.79 0.83 0.88 0.92 0.96 1 2 3 
    Nb of sampling points to be taken in this window, n[ 1 ]= 9 
Maximum total number of points in one elementary protocol : 9 
Minimum total number of points in one elementary protocol : 9 

 

 
BEST ONE GROUP PROTOCOL: 
 
Sample times for response: A 
                                                                                                   times
1 c(`1` = 0, `2` = 0.04, `3` = 0.08, `4` = 0.12, `16` = 0.92, `17` = 0.96, `18` = 1, `19` = 2, `20` = 3)
  freq Subjects condinit
1    1        1    c(V0)

 
Associated criterion: 0.2449
 

 
FIM saved in FIM_dryad_D_9pts_selfblock_opt.txt
 
 
Computation of the Individual Fisher information matrix
 
******************* FISHER INFORMATION MATRIX ******************
 
              [,1]         [,2] [,3]
[1,]  7.222592e-07 -0.004295421    0
[2,] -4.295421e-03 36.844267523    0
[3,]  0.000000e+00  0.000000000 1800

 

 
************************** EXPECTED STANDARD ERRORS ************************
 
------------------------ Fixed Effects Parameters -------------------------
 
     Beta     StdError      RSE  
V0  35300 2124.8452498 6.019392 %
dec     3    0.2975013 9.916711 %

 

 
------------------------ Standard deviation of residual error ------------------------ 
 
           Sigma   StdError      RSE  
sig.slopeA   0.1 0.02357023 23.57023 %

 
******************************* DETERMINANT ********************************
 
0.01468885
 
******************************** CRITERION *********************************
 
0.244904
 

 

 
******************* EIGENVALUES OF THE FISHER INFORMATION MATRIX ******************
 
        FixedEffects VarianceComponents
min         36.84427       2.214855e-07
max       1800.00000       3.684427e+01
max/min     48.85427       1.663507e+08

 
******************* CORRELATION MATRIX ******************
 
          [,1]      [,2] [,3]
[1,] 1.0000000 0.8326725    0
[2,] 0.8326725 1.0000000    0
[3,] 0.0000000 0.0000000    1


 
Time difference of 11.29895 secs
sys.self 
    1.93 

 
