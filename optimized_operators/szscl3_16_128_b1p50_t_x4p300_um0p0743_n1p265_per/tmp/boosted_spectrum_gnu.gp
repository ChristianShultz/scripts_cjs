set terminal x11 enhanced 
set size ratio 2 
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
unset xtics
set object 1 rect from screen 0.90,0.85 to screen 0.95,0.90 fc lt 0 
set object 2 rect from screen 0.90,0.75 to screen 0.95,0.80 fc lt 1 
set object 3 rect from screen 0.90,0.65 to screen 0.95,0.70 fc lt 2 
set object 4 rect from screen 0.90,0.55 to screen 0.95,0.60 fc lt 3 
set object 5 rect from screen 0.90,0.45 to screen 0.95,0.50 fc lt 4 
set object 6 rect from screen 0.90,0.35 to screen 0.95,0.40 fc lt 6 
set label 1 at screen 0.915,0.87 "J0" front 
set label 2 at screen 0.915,0.77 "J1" front 
set label 3 at screen 0.915,0.67 "J2" front 
set label 4 at screen 0.915,0.57 "J3" front 
set label 5 at screen 0.915,0.47 "J4" front 
set label 6 at screen 0.915,0.37 "Hyb" front 
set style fill solid .5 border -1
set title "boosted rest -> D4A2M" 
set ylabel "a_{t} m_{h}"
plot "tmp/boosted_spectrum_gnu.dat" u 1:2:(0.3):(0.005):4 w boxxyerrorbars lc variable, \
"tmp/boosted_spectrum_gnu.dat" u ($1+1):2:3 with labels
set xr [GPVAL_DATA_X_MIN - 0.2 : GPVAL_DATA_X_MAX + 0.2] 
set yr [GPVAL_DATA_Y_MIN - 0.02: GPVAL_DATA_Y_MAX + 0.02]
replot 
