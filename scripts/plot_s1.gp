

set pm3d
set view map
#set palette negative
set cbrange [0:100]

# output timestep in hours
dt=6

set xrange [-50000:50000]
set yrange [-50000:50000]

do for [ii=0:120:1]{
set title sprintf( "time = %f", ii*dt/24.)
sp 'topo' index ii u 2:3:($4) w pm3d t '', \
   'lol' index ii u 2:3:(0.0):($4*200):($5*200):(0.0) w vectors head filled lt 1 t ''
    pause -1
}

