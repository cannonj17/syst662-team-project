load EastCoast.mat
runs = 10;
trips_per_run = 5000;
total_trips = trips_per_run * runs;
trips_long = genlogntrips(G,total_trips,.95,1.0,1.6);
save trips_long.mat