set terminal x11 enhanced 
set xtics (  "unknown"  -2 , "0-+"  1 , "1--"  2 , "2--"  3 , "2-+"  4 , "3--"  5 , "4--"  6 , "4-+"  7 , "0++"  8 , "1+-"  9 , "1++"  10 , "2++"  11 , "3++"  12 , "3+-"  13 , "4++"  14 , "0--"  15 , "0+-"  16 , "1-+"  17 , "2+-"  18 , "3-+"  19 , "4+-"  20 ) 
unset key 
unset linetype 0 
unset linetype 1 
unset linetype 2 
unset linetype 3 
unset linetype 4 
unset linetype 5 
unset linetype 6 
unset linetype 7 
unset linetype 8 
set style fill solid .5 border -1
set title "Spectrum(p000)" 
set ylabel "a_{t} m_{h}"
set xlabel "channel"
plot "tmp/p000.dat" u ($1+$6):2:4:3:7 w boxxyerrorbars lc variable, \
"tmp/p000.dat" u ($1 + $6 + 0.4):2:8 with labels font ",8"
set xr [GPVAL_DATA_X_MIN - 0.1 : GPVAL_DATA_X_MAX + 0.1] 
set yr [0: GPVAL_DATA_Y_MAX + 0.1]
replot 
