function [pts, pts_tilde, A_true, t_true] = affine_test_case_outlier(outlier_rate)
% Generate random affine transformation matrix
A_true = [1.2, 0.3; -0.1, 0.8];
t_true = [5; -3];
% Generate random set of point correspondences
n = 20;
pts = randn(2, n);
pts_tilde = A_true * pts + t_true;

% Add outliers
num_outliers = round(outlier_rate * n);
outlier_indices = randperm(n, num_outliers);
pts_tilde(:, outlier_indices) = randn(2, num_outliers);
end
