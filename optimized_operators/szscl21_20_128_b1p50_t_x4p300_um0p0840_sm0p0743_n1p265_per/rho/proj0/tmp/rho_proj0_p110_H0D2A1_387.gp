set key noenhanced
set bars fullwidth
set style data histograms
set style fill solid border -1
set style histogram errorbars gap 5 lw 1
set style line 1 lc rgb "red" 
set style line 2 lc rgb "red" 
set style line 3 lc rgb "red" 
set style line 4 lc rgb "red" 
set style line 5 lc rgb "red" 
set style line 6 lc rgb "red" 
set style line 7 lc rgb "red" 
set style line 8 lc rgb "red" 

set style increment user 
plot "tmp/rho_proj0_p110_H0D2A1_387_.dat" u 1:0:xtic(1) ti col, '' u 2:0 ti col, '' u 3:0 ti col, '' u 4:0 ti col, '' u 5:0 ti col, '' u 6:0 ti col, '' u 7:0 ti col, '' u 8:0 ti col
set yrange [GPVAL_DATA_Y_MIN - 0.2 : GPVAL_DATA_Y_MAX +0.2] 
replot 
