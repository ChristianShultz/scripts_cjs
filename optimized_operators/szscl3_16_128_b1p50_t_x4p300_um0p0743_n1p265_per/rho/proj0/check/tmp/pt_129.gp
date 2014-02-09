f(x) = sqrt( m*m + 0.3926989525*0.3926989525*x/z/z )
m = 0.1483; z = 3.45; 
fit f(x) 'tmp/dat_129.dat' using 1:2 via m, z
plot 'tmp/dat_129.dat' using 1:2:3 w yerr,\
f(x) ti "er = m , xi = z " 