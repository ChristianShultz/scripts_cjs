set xtics (  "pion,proj4,p100,H1D4E2" 0 , "pion,proj4,p110,H1D2B1" 1 , "pion,proj4,p110,H1D2B2" 2 , "pion,proj4,p111,H1D3E2" 3 , "pion,proj4,p100,H0D4A1" 4 , "pion,proj4,p110,H0D2A1" 5 , "pion,proj4,p111,H0D3A1" 6 , "pion,proj4,p000,T1" 7 , "pion,proj4,p200,H1D4E2" 8 , "pion,proj4,p200,H0D4A1" 9 ) nomirror rotate by -45 font ",8"  
set style fill solid border -1 
set boxwidth 0.5 relative 
plot 'op_phase_hash_data/pion_proj4' u ($0):3:4:xtic(2) w boxerrorbars 
set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] 
replot 
