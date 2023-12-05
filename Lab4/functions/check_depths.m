function positive = check_depths(Ps, U)


N = length(Ps); % Number of cameras
positive = false(1, N); % Initialize positive depths to false

for i = 1:N
    P = Ps{i};
    X = P * [U; 1]; % Project U onto the ith camera
    positive(i) = X(3) > 0; % Check if the depth is positive
end

end