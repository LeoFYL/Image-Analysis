function errors = reprojection_errors(Ps, us, U)
% Ps: cell array of camera projection matrices
% us: 2xN matrix of image points
% U: 3x1 vector of 3D point
% errors: 1xN vector of reprojection errors

N = length(Ps); % Number of cameras
errors = zeros(1, N); % Initialize errors to zero

% Check depths of U in each camera
positive = check_depths(Ps, U);

for i = 1:N
    if positive(i)
        P = Ps{i};
        u = us(:, i);
        X = P * [U; 1]; % Project U onto the ith camera
        X = X(1:2) ./ X(3); % Homogeneous to Euclidean coordinates
        errors(i) = norm(X - u); % Compute reprojection error
    else
        errors(i) = Inf; % Set reprojection error to Inf
    end
end
end

