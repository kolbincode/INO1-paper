function springK = getspringK(sd)
% Get spring constant in pN/nm given sd(nm)
% sd - standard deviation of spot postion (range of beads) from its average
% across all simulations.
% remember! convert to nanometers before using


% Boltzmann constant in J/K (m^2*kg)/(s^2*K)
kB_SI = 1.380649e-23;
room_temp_C = 25;
% convert C to K:   T = 273.15 + 25 (room temp) 
temperatureK = 273.15 + room_temp_C;

% kB*T at room temp in diff units
kT_SI = kB_SI * temperatureK;   % in Joules
picoN = 1e12;
nanometer = 1e9;
% kB*T in picoNewton-nanometer
kT_pNnm = kT_SI * picoN * nanometer; 

% Formula for spring constant
springK = kT_pNnm/(sd^2);

end
