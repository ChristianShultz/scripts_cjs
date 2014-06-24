set xtics (  "pion,proj0,p110,H0D2A2" 0 , "pion,proj0,p000,A1" 1 , "pion,proj0,p111,H0D3A2" 2 , "pion,proj0,p100,H0D4A2" 3 , "pion,proj0,p200,H0D4A2" 4 ) nomirror rotate by -45 font ",8"  
set style fill solid border -1 
set boxwidth 0.5 relative 
plot 'op_phase_hash_data/pion_proj0' u ($0):3:4:xtic(2) w boxerrorbars 
set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] 
replot 
