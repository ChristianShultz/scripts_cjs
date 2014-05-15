set xrange[-0.1:4.1] 
t = 6.2831853 
l = 16 
f = (t/l)*(t/l) 
g(x) = m*m + (f/(a*a))*x
fit g(x) 'tmp/dat_144.dat' using 1:2 via m,a 
plot 'tmp/dat_144.dat' using 1:2:3 w yerr ti 'E^2(p^2)' lt 5, \
g(x) ti sprintf("g=m^2 + x*(2pi/Ls/xi)^2, m=%.4f, xi=%.4f", m, a)  
set xr [GPVAL_DATA_X_MIN-0.1:GPVAL_DATA_X_MAX+0.1]
set yr [GPVAL_DATA_Y_MIN-0.01:GPVAL_DATA_Y_MAX+0.01]
replot 
set term x11 1
plot 'tmp/dat_144.dat' using 1:(sqrt($2)):3 w yerr ti 'E(p^2)' lt 5, \
sqrt( g(x) ) ti sprintf("g=root(m^2 + x*(2pi/Ls/xi)^2), m=%.4f, xi=%.4f", m, a)  
set xr [GPVAL_DATA_X_MIN-0.1:GPVAL_DATA_X_MAX+0.1]
set yr [GPVAL_DATA_Y_MIN-0.01:GPVAL_DATA_Y_MAX+0.01]
replot 
set terminal postscript eps color 
set out 'plot.eps' 
replot 
set term pop 
