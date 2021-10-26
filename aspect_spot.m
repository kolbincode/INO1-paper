function eigmat = aspect_spot(name, range, stride)
%Calculates the 'aspect ratio' for the point cloud of beads in range
%   by taking the square root of ratio of the first over the second PCA component
%   name - files with bead positions
%   range - indices of beads 
%   stride - step size to skip
%   output: eigmat - 3-by-timestep matrix of eigenvalues associated with PCA 

%NAME
files = dir(fullfile('data', name, "*", "data.mat"));
nFiles = length(files);

%RANGE
first = range(1); 
last = range(2); 

% Start time at index 10
start = 10;

%Extract portion of bead data
for i=1:nFiles
    load(fullfile(files(i).folder, files(i).name), 'newBeads');
    t_beads = newBeads(:, first:last, start:stride:end);
    ALL(:,:,:,i) = t_beads;
    clear('newBeads');
end

%Average over all simulations
ave_beads = mean (ALL,4);

% Initialize output
dim = size(ave_beads,3);
eigmat = zeros(3, dim);

for j = 1:dim
    % vector is principal component variances, that is the eigenvalues of the covariance matrix
    [~,~,vector] = pca(ave_beads (:,:,j)');
    eigmat(:,j) = sqrt(vector);
end

end

