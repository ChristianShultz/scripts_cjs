set xtics (  "pion,proj1,p111,H0D3A2" 0 , "pion,proj1,p100,H0D4A2" 1 , "pion,proj1,p110,H0D2A2" 2 , "pion,proj1,p000,A1" 3 , "pion,proj1,p200,H0D4A2" 4 ) nomirror rotate by -45 font ",8"  
set style fill solid border -1 
set boxwidth 0.5 relative 
plot 'op_phase_hash_data/pion_proj1' u ($0):3:4:xtic(2) w boxerrorbars 
set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] 
replot 
