# Traffic Routing Simulation
## Overview
- The intelligent transportation system is based on using historical and measured traffic data to aid drivers in choosing the best possible routes. In this assignment, you will develop a simulation that enables a high-level assessment of the benefit of predictive traffic routing.
- The goal of the assignment is to develop a simulation to answer the following question. On average, does predictive routing save more than 5% of the trip time to a 95% confidence.  In order to answer this question, you will develop a simulation that computes the travel time statistics for different random trips. For each trip, the simulation will compute the shortest travel time with different road conditions. The travel time for each road in the system is based on a random speed derived from traffic conditions, accident rate, and construction. The road system used for this assignment is a simplified version of the US Highway and Interstate road network; see Figure 1 below.  

##	Statement of Work
The team will develop a simulation to answer some questions about the hypothetical ITS and present the results to the class.

###	Tasks 

-	Develop an integrated master schedule that shows the path to complete all the deliverables and assigns student names to tasks.
-	Develop a Modeling and Simulation Plan that covers the development schedule, SLOC estimates, simulation requirements, and the approach to verify and validate the simulation.
- Develop a simulation in MATLAB that answers the questions below.
  - (Q1) On average, does predictive routing save more than 5% of the trip time to a 95% confidence. 
  - (Q2) What fraction of trips are re-routed due to road conditions?
  - Trips will be composed of road segments connecting randomly selected origins and destinations. The distribution of trip lengths should be representative of travel distances in the region of study. Based on U.S. Department of Transportation data [5], representative travel distances follow a lognormal frequency distribution with parameters μ=1 and σ=1.6 which gives an average of travel distance of ~10 miles with a standard deviation of 33 miles. Each road segment (edge) should have a travel time based on the random variable that depends on the nominal speed, and the road conditions (nominal, accident, construction). 
- Perform verification and validation of the simulation per the M&S plan. 
- Perform simulation runs using sufficient random destinations to answer questions Q1 and Q2. The answers to Q1 and Q2 must be backed by statistical analysis of the results.  Part of the analysis should examine if the statistics based on random destinations is the same statistics based on multiple runs.
- Present the results of the analysis in a 20-minute briefing.  The briefing should have UML diagrams of the simulation; the results of the simulation answering Q1/Q2 presented using appropriate statistical techniques; graphs, and the actual vs. estimated SLOC. In addition, simulation verification and validation results should be presented.
- Write and provide a one-page critique of the other teams analysis briefing. Focus on the completeness, depth and accuracy of the information presented.  
