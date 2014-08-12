set xtics (  "rho,proj2,p110,H0D2A1" 0 , "rho,proj2,p111,H1D3E2" 1 , "rho,proj2,p200,H1D4E2" 2 , "rho,proj2,p110,H1D2B1" 3 , "rho,proj2,p200,H0D4A1" 4 , "rho,proj2,p100,H1D4E2" 5 , "rho,proj2,p110,H1D2B2" 6 , "rho,proj2,p000,T1" 7 , "rho,proj2,p100,H0D4A1" 8 , "rho,proj2,p111,H0D3A1" 9 ) nomirror rotate by -45 font ",8"  
set style fill solid border -1 
set boxwidth 0.5 relative 
plot 'op_phase_hash_data/rho_proj2' u ($0):3:4:xtic(2) w boxerrorbars 
set xr [GPVAL_X_MIN -1 : GPVAL_X_MAX +1] 
replot 
