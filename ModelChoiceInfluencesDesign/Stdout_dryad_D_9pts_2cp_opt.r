PFIM 4.0  
 
Option: 1 

 
Project: viraldecay
 
Date: Wed Oct 16 13:52:41 2024
 

 
**************************** INPUT SUMMARY ********************************
 
Analytical function model:  
 
function(t,p,X){
A<-p[1]
alpha<-p[2]
B<-p[3]
beta<-p[4]
y<-(X*(A*exp(-alpha*t)+B*exp(-beta*t)))
return(y)
}

 

 
Initial design: 

 
Sample times for response: A 
                                      Protocol subjects doses
1 c=(0, 0.04, 0.12, 0.17, 0.33, 0.67, 1, 2, 3)        1     1

 
Total number of samples: 9
 
Associated criterion value: 0.0357
 
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
1 c(`1` = 0, `2` = 0.04, `3` = 0.08, `5` = 0.17, `6` = 0.21, `7` = 0.25, `18` = 1, `19` = 2, `20` = 3)
  freq Subjects doses
1    1        1     1

 
Associated criterion: 0.038
 

 
FIM saved in FIM_dryad_D_9pts_2cp_opt.txt
 
 
Computation of the Individual Fisher information matrix
 
******************* FISHER INFORMATION MATRIX ******************
 
              [,1]          [,2]          [,3]          [,4] [,5]
[1,]  1.660007e-05 -1.035691e-01  2.682469e-07 -3.600894e-04    0
[2,] -1.035691e-01  1.413965e+03 -7.375326e-05  1.612330e-01    0
[3,]  2.682469e-07 -7.375326e-05  9.845747e-08 -4.094931e-05    0
[4,] -3.600894e-04  1.612330e-01 -4.094931e-05  6.207200e-02    0
[5,]  0.000000e+00  0.000000e+00  0.000000e+00  0.000000e+00 1800

 

 
************************** EXPECTED STANDARD ERRORS ************************
 
------------------------ Fixed Effects Parameters -------------------------
 
          Beta     StdError       RSE  
A      6460.00 3.767852e+02  5.832589 %
alpha     0.18 3.815877e-02 21.199317 %
B     31540.00 3.745362e+03 11.874958 %
beta     39.00 5.119255e+00 13.126295 %

 

 
------------------------ Standard deviation of residual error ------------------------ 
 
           Sigma   StdError      RSE  
sig.slopeA   0.1 0.02357023 23.57023 %

 
******************************* DETERMINANT ********************************
 
7.947773e-08
 
******************************** CRITERION *********************************
 
0.03802324
 

 

 
******************* EIGENVALUES OF THE FISHER INFORMATION MATRIX ******************
 
        FixedEffects VarianceComponents
min     7.059119e-06       7.128573e-08
max     1.800000e+03       7.059119e-06
max/min 2.549893e+08       9.902569e+01

 
******************* CORRELATION MATRIX ******************
 
            [,1]        [,2]        [,3]      [,4] [,5]
[1,]  1.00000000  0.71703981 -0.04655519 0.3906209    0
[2,]  0.71703981  1.00000000 -0.03564157 0.2695931    0
[3,] -0.04655519 -0.03564157  1.00000000 0.4634684    0
[4,]  0.39062092  0.26959311  0.46346837 1.0000000    0
[5,]  0.00000000  0.00000000  0.00000000 0.0000000    1


 
Time difference of 11.09805 secs
sys.self 
    4.36 

 
