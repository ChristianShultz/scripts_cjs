set terminal x11 enhanced 
set xtics (  "unknown"  -2 , "1--"  4 , "0-+"  1 ) 
unset key 
set style fill solid .5 border -1
set title "Spectrum(p000)" 
set ylabel "a_{t} m_{h}"
set xlabel "hadron"
plot "tmp/p000.dat" u ($1+$6):2:4:3:7 w boxxyerrorbars lc variable 
