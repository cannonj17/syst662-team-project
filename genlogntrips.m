function [trips] = genlogntrips(road_graph,samples,conf_intrvl,mu,sigma,uniqueness)
% Description: Generates a random set of trips with log-normal distributed distances 
%       from a large graph containing the road network for a geographic area.
%
%       An accept-reject approach is first used to generate an approximately
%       log-normally distributed random sample pool from the Weibull 
%       distrubuted road_graph using the distances defined by shortestpath
%       and truncated by useful distance based on conf_intrvl.
%       The inverse approach is then used to select log-normally distributed 
%       samples from the sample pool to match the target distribution. 
%       The Parallel Processing Toolbox can be used to speed up processing
%       but is not required.
% Inputs:
%		road_graph – a graph of road distances and locations
%		samples – the number of sample trips requested
%		conf_intrvl – the confidence interval the trips represent
%		mu,sigma – lognormal parameters for the output sample
%       uniqueness (optional - default 20) 
%           if < 1, the target ratio of unique samples in the output
%           if >= 1, the oversample multiplier. Sample generation time is
%           directly porporational to the oversample multiplier
% Outputs:
%		trips – matrix of trips (start node, end node, distance*100) 
%           representing lognormally distributed sample trips from road_graph

% Define variables and constants
% Set oversample
% Define mapping of unique rate to oversampling
uniqueRatio =      [0.000 0.415 0.543 0.663 0.781 0.797 0.870 0.907 0.957 0.963 0.985 0.990];
oversampleValue =  [  1     1     2     4     8    10    20    40    80   100   200   400  ];
oversample = 20; % ~87% unique (default)
if nargin==6
    oversample = round(interp1(uniqueRatio,oversampleValue,uniqueness,'linear',400));
end
max_distance=logninv(1-(1-conf_intrvl)/samples,mu,sigma); % max useful distance
trips = zeros(samples,3);
trip_start = zeros(samples*oversample,1);
trip_end = zeros(samples*oversample,1);
trip_dist = zeros(samples*oversample,1);
logn_modePDF_sample = lognpdf(exp(mu-sigma^2),mu,sigma);
A_base=396; B_base=2.1; % define parameters of the road_graph distance distribution
wbl_modePDF_base = wblpdf(A_base*((B_base-1)/B_base)^(1/B_base),A_base,B_base);

% create an oversampled pool of apporximately log-normally distributed trips
nnodes = numnodes(road_graph);
parfor i = 1:samples*oversample
    % random sample for a new sample until a good candidate is found
    while trip_dist(i) <= 0 || trip_dist(i) >= max_distance
        % Generate random trip
        trip_start(i) = randi(nnodes);
        trip_end(i) = randi(nnodes);
        % estimate distance of random trip using rectilinear computation from geographic coordinates
        distEst = abs(road_graph.Nodes.Lat(trip_end(i)) - road_graph.Nodes.Lat(trip_start(i)))*24860/360 + ...
            abs(road_graph.Nodes.Long(trip_end(i)) - road_graph.Nodes.Long(trip_start(i)))*24901/360;
        urv = rand; % random variable for selection
        % determine if random trip is worth detailed analysis compensating for the source and target distributions
        if urv*wblpdf(distEst,A_base,B_base)/wbl_modePDF_base <= lognpdf(distEst,mu,sigma)/logn_modePDF_sample
            % Find the shortest path from start to end using positive weights for performance
            [~, ~, edge_ids] = shortestpath(road_graph,trip_start(i),trip_end(i),'method','positive');
            % Compute the distance of the path by summing the length of each edge
            dist = sum(road_graph.Edges.Distance(edge_ids));
            % save the actual distance if it meets source and target distribtion critera
            if urv*wblpdf(dist,A_base,B_base)/wbl_modePDF_base <= lognpdf(dist,mu,sigma)/logn_modePDF_sample
                trip_dist(i) = dist;
            end
        end
    end
end

% Remove duplicates and order for interp1
[trip_dist, unique_idx] = unique(trip_dist);
trip_start = trip_start(unique_idx);
trip_end = trip_end(unique_idx);

% select log-normally distributed trips from the pool using the inverse method
dist_idxs=1:length(trip_dist);
parfor i = 1:samples
    dist = logninv(rand,mu,sigma); % select a distance
    idx = interp1(trip_dist,dist_idxs,dist,'nearest','extrap'); % find the closest pool sample
    trips(i,:) = [trip_start(idx), trip_end(idx), trip_dist(idx)*100];
end

end