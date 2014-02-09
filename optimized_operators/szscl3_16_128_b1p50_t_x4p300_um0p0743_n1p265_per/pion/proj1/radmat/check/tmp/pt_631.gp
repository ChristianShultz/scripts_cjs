t = 6.2831853 
l = 16 
f = (t/l)*(t/l) 
g(x) = m*m + (f/(a*a))*x
fit g(x) 'tmp/dat_631.dat' using 1:2 via m,a 
plot 'tmp/dat_631.dat' using 1:2:3 w yerr ti 'E^2(p^2)', \
g(x) ti sprintf("g=m^2 + x*(2pi/Ls/xi)^2, m=%.4f, xi=%.4f", m, a)  
set terminal postscript eps color 
set out 'plot.eps' 
replot 
set term pop 
