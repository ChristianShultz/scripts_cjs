set key noenhanced
set bars fullwidth
set style data histograms
set style fill solid border -1
set style histogram errorbars gap 5 lw 1
set style line 1 lc rgb "black" 

set style increment user 
plot "tmp/pion_proj0_p000_A1_374_.dat" u 1:0:xtic(1) ti col
set term x11 1 
set yrange [GPVAL_DATA_Y_MIN - 0.2 : GPVAL_DATA_Y_MAX +0.2] 
replot 
