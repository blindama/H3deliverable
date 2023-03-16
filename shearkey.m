% Input values
T = input('Enter the torsion (kN-m): ');
F = input('Enter the thrust (kN): ');
FS = input('Enter the factor of safety: ');

% Material properties
tau_allow = 75.0;  % Allowable shear stress for the material in MPa
w_allow = 0.8;     % Allowable wear for the material

% Calculation of shear key dimensions
d = sqrt((16 * T) / (pi * tau_allow * FS));
w = w_allow * d;
l = F / (tau_allow * w * d);

% Output values
fprintf('The required dimensions of the shear key are:\n');
fprintf('Width (w) = %.2f mm\n', w);
fprintf('Depth (d) = %.2f mm\n', d);
fprintf('Length (l) = %.2f mm\n', l);
