set terminal x11 enhanced 
set xtics (  "unknown"  -2 , "0--"  0 , "0-+"  1 , "0+-"  2 , "0++"  3 , "1--"  4 , "1-+"  5 , "1+-"  6 , "1++"  7 , "2--"  8 , "2-+"  9 , "2+-"  10 , "2++"  11 , "3--"  12 , "3-+"  13 , "3+-"  14 , "3++"  15 , "4--"  16 , "4-+"  17 , "4+-"  18 , "4++"  19 ) 
unset key 
set style fill solid .5 border -1
set title "Spectrum(p000)" 
set ylabel "a_{t} m_{h}"
set xlabel "channel"
plot "tmp/p000.dat" u ($1+$6):2:4:3:7 w boxxyerrorbars lc variable 
set xr [GPVAL_DATA_X_MIN - 0.1 : GPVAL_DATA_X_MAX + 0.1] 
set yr [0: GPVAL_DATA_Y_MAX + 0.1]
replot 
