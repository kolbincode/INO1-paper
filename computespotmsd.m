function msd = computespotmsd(beads, spot, tauMax)
% Computes MSD of spot, outputs single MSD values for each tau
%   HARD SET to give overlapping msd calculation.
%   input:  beads (3, beads, timesteps),
%           spot (1-by-2) is range of beads indicated by their indices
%           tauMax defaults to max timesteps
%   output: MSD values for the spot
%   usedby: calculatemultimsd_range

% all time steps
tMax = size(beads, 3);
if  tauMax == -1
    tauMax = tMax;
end

first = spot(1); last = spot(2);
positions = beads(:,first:last,:);

% Get center of mass
spot_COM = squeeze(mean(positions,2));

for tau = 1:tauMax
    step = 1;    % =tau for non-overlapping msd; =1 for overlapping msd
    MMM = squeeze(vecnorm(spot_COM(:,1+tau:step:end) - spot_COM(:,1:step:end-tau), 2, 1).^2);
    msd(tau) =  mean(MMM);
end


end %end of function
