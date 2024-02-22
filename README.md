# DesignMultiphasicViralDecay

README for Design evaluation or optimization, and inference of multiphasic decay of infectious virus particles

###Design evaluation or optimization###
Follow these steps before first design evaluation or optimization
 
1 - install R packages from the CRAN: nlme, combinat, deSolve, numDeriv. For instance, you can execute the following in R console:
install.packages(c('nlme', 'combinat', 'deSolve', 'numDeriv'))

2 - download PFIM 4.0. Program (from this github or at www.pfim.biostat.fr)

3 - change the paths in the PFIM.R file (lines 18 and 19)
directory is where are located the stdin and model files
directory.program is where is located the PFIM 'Program' folder

4 - source the PFIM file 
source("C:/.../PFIM.r")

5 - make your changes, following the commented script and execute lines VariableDecayRates_2pop_PFIM.R for design evaluation or local optimization 
OR
ParamUncertainty_cV1-cV2-V_0-7times_PFIM-FW for robust design optimization

###Data fitting###
Download Monolix at https://lixoft.com/products/monolix/, ask lixoft for a license (free for academics), monolix scripts (.mlxtran) are available for biexponential (decayWT_D9_2cp_proportions.mlxtran) and triexponential (decayWT_D9_3cp_proportions.mlxtran) models.

###Credits/list of collaborators
Weitz group and Meyer Lab: Jérémy Seurat, Krista Gerbino, Justin Meyer, Joshua Borin, Joshua Weitz
---
École Normale Supérieure, Georgia Institute of Technology (previous affiliation), University of California San Diego, University of Maryland

