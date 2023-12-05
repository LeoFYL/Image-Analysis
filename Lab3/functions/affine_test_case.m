function [pts, pts_tilde, A_true, t_true] = affine_test_case()
% Set the true affine transformation matrix and translation vector
A_true = [1.2, 0.3; -0.1, 0.8];
t_true = [5; -3];

% Generate a set of random points
N = 10;
pts = randn(2,N);

% Apply the affine transformation to the points
pts_tilde = A_true * pts + repmat(t_true, 1, N);

end