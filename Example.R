# Example
rm(list = ls())
dir = "~/Desktop/For github"
setwd(dir)
set.seed(123)
RNGkind(sample.kind = "default")
source("Tests.R")
P = runif(1000, min = 0, max = 1) # a random draw of p-values
id = 1 #no dependence
p_min = 0
p_max = 1
d_point = 0.05 #the target cutoff for the discontinuity test
J = 10 #use 10 bins for CS1 and CS2B tests

# Tests (each test returns the corresponding p-value)
Bin_test = Binomial(P, p_min, p_max, "c")
Discontinuity = Discontinuity_test(P,d_point)
LCM_sup = LCM(P, p_min,p_max)
CS_1 = CoxShi(P,id,  p_min, p_max, J, 1, 0) #Test for 1-monotonicity
CS_2B = CoxShi(P,id,  p_min, p_max, J, 2, 1) #Test for 2-monotonicity and bounds
FM = Fisher(P, p_min, p_max)