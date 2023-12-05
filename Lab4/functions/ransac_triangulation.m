% function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold)
% % Ps: cell array of camera projection matrices
% % us: 2xN matrix of image points
% % threshold: reprojection error threshold
% % U: 3x1 vector of 3D point
% % nbr_inliers: number of inliers
% 
% N = length(Ps); % Number of cameras
% n = size(us, 2); % Number of image points
% max_iterations = 1000; % Maximum number of RANSAC iterations
% best_nbr_inliers = 0; % Best number of inliers found so far
% best_U = zeros(3, 1); % Best 3D point found so far
% 
% for i = 1:max_iterations
%     % Randomly select two cameras
%     subset = randsample(N, 2, false);
%     P1 = Ps{subset(1)};
%     P2 = Ps{subset(2)};
%     
%     % Triangulate 3D point using two cameras
%     U = linear_triangulation(P1, us(:, subset(1)), P2, us(:, subset(2)));
%     
%     % Compute reprojection errors for all cameras
%     errors = reprojection_errors(Ps, us, U);
%     
%     % Count number of inliers
%     is_inlier = (errors <= threshold);
%     nbr_inliers = sum(is_inlier);
%     
%     % Update best estimate if current estimate has more inliers
%     if nbr_inliers > best_nbr_inliers
%         best_nbr_inliers = nbr_inliers;
%         best_U = U;
%     end
% end
% 
% U = best_U;
% nbr_inliers = best_nbr_inliers;
% end


function [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold)
% Function Name: ransac_triangulation
%
% Description:
%   This function performs RANSAC-based triangulation to estimate the 3D
%   location of a point given multiple camera matrices and their corresponding
%   2D image points. It randomly selects a minimum number of camera matrices
%   and their corresponding image points, and calculates the 3D point using
%   the 'minimal_triangulation' function. It then computes the reprojection
%   errors for all the camera matrices and 2D image points. The 3D point with
%   the highest number of inliers (reprojection errors within a threshold) is
%   selected as the final estimate. The function returns the estimated 3D
%   point and the number of inliers found.
%
% Inputs:
%   Ps - A cell array of N cameras 3 x 4 camera matrices
%   us - A 2 x N matrix of N cameras image points (each column corresponds to a
%        camera matrix in Ps)
%   threshold - A scalar threshold to determine if a reprojection error is an
%               outlier or an inlier.
%
% Outputs:
%   U - A 3 x 1 column vector representing the estimated 3D point
%   nbr_inliers - The number of inliers (reprojection errors within threshold)
%                 found for the estimated 3D point.
%
% Example Usage:
%     >> Ps = {...}; %
%     >> us = [...]; % 2 x N
%     >> threshold = 1.5;
%     >> [U, nbr_inliers] = ransac_triangulation(Ps, us, threshold);
%
% Author: Daniele Murgolo
%
% Date: March 1st, 2023

N_cameras = length(Ps);
U = zeros(3, N_cameras);
prob = 0.995;
max_trials = 100;
hard_limit = 2e5;
n_trials = 0;
n_inliers_best = 0;
best_residuals = 0;
nbr_inliers = 0;
n_samples = 2;

while n_trials < max_trials && n_trials < hard_limit

    n_trials = n_trials + 1;
    idx = randperm(N_cameras, n_samples);

    sample_Ps = Ps(idx);
    sample_us = us(:, idx);

    U_min = minimal_triangulation(sample_Ps, sample_us);

    res = reprojection_errors(Ps, us, U_min);

    n_inliers = sum(res <= threshold);

    if n_inliers > n_inliers_best

        n_inliers_best = n_inliers;
        U = U_min;
        nbr_inliers = n_inliers_best;

        eps = n_inliers / N_cameras;

        max_trials = abs(int32(log(1-prob)/log(1-eps.^n_samples)));

        best_residuals = mean(res);

    end

end
end
