# SYST662 Team 1 Project
## Description
- This is the Code Repository for UMBC SYST662 Team 1 Spring 2023 Group Project.
- To evaluate this project:
  - Click the green "<> code" icon.
  - Select "Download Zip".
  - Extract the files into a folder
  - Open the folder in MATLAB

## Directory Structure
In this repository, the file structure is as follows:
- `Syst662Team1Project.mlx` The Simulation File
- `EastCoast.mat`/`EastCoast_w_supporting_data.mat` Edges and Nodes (before and after predictive routing is applied, respectively)
- `team1_random_speeds.mlx`/`team1_trip_generation.m` Road Speed and Condition Data to use for distribution analysis
- `genlogntrips.m` Provided code to generate the approriate disribution of trips for analysis
- `trips_short.mat` Script that calls genlogntrips with the appropriate paramers to run the simulation with the desired result.
- `Archived` Folder of archived work on this assignment

## Developer Fun
### Using Git with Matlab
- Step 1: [Configure MATLAB to Use Git SSH Autentication](https://www.mathworks.com/help/matlab/matlab_prog/set-up-git-source-control.html#use_ssh_authentication)
- Step 2: Clone the Repository:
  - On this GitHub page, select the <span style="color:green">green</span> "Code" dropdown.
  - Click SSH, and copy the link
  - Create or navigate to the directory where you want to clone the project.
  - With the copied link, follow these instructions: [Clone Remote Git Repository](https://www.mathworks.com/help/matlab/matlab_prog/use-git-in-matlab.html#d124e78042)
- Step 3: Use the Repository:
  - To *pull* the latest changes: [Pull Latest](https://www.mathworks.com/help/matlab/matlab_prog/use-git-in-matlab.html#buhx8yc-1)
  - To *add* new files: [Mark Files for Addition](https://www.mathworks.com/help/matlab/matlab_prog/use-git-in-matlab.html#mw_4cecdda1-2532-428c-bb21-0bc5f672469a)
  - To *commit* and *push* changes: [Commit and Push](https://www.mathworks.com/help/matlab/matlab_prog/use-git-in-matlab.html#mw_fad85c95-3a06-4813-b29b-bbd419ce5fd1)

### UML Diagram
For the interest of developers, the topology for this project can be accessed here:
[View Simulation UML on LucidChart](https://lucid.app/lucidchart/ae348b5e-988d-4e82-b4b2-071c90baa0f8/edit?viewport_loc=-269%2C320%2C2219%2C1097%2C0_0&invitationId=inv_75876d6f-555d-4cf5-b712-c2da2dc896de)
