% Input parameters
P_x = 5000; % Radial load (N)
P_y = 2000; % Thrust load (N)
f = 2; % Factor of safety

% Calculation
P_r = sqrt(P_x^2 + P_y^2); % Equivalent radial load (N)
C_r = P_r/f; % Radial load capacity (N)
C_a = P_y/f; % Axial load capacity (N)

% Load bearing catalog and find suitable bearing
load('bearing_catalog.mat'); % This assumes a bearing catalog is saved as a .mat file with variables for the bearing specifications
suitable_bearings = catalog(C_r <= catalog(:,2) & C_a <= catalog(:,5),:); % Find all bearings with a radial load capacity and axial load capacity greater than or equal to the calculated capacities
chosen_bearing = suitable_bearings(1,:); % Choose the first bearing that meets the requirements (this assumes the catalog is sorted by increasing load capacity)

% Output result
disp(['Chosen bearing: ' chosen_bearing(1) ' with bore size ' num2str(chosen_bearing(3)) ' mm and outer diameter ' num2str(chosen_bearing(4)) ' mm.']);