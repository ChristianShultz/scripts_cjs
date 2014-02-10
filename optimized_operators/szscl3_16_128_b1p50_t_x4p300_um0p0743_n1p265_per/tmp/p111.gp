set terminal x11 enhanced 
unset key 
set style fill solid 0.25 border 1
set title "Spectrum(p111)" 
set ylabel "a_{t} m_{h}"
set xlabel "hadron"
set xtics ("pion" 1 ,"rho" 2 )
plot "tmp/p111.dat" u ($1):($2):($4):($3):xtic(6) w boxxyerrorbars lc variable 
