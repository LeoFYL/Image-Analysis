function U = minimal_triangulation(Ps, us)
%MINIMAL_TRIANGULATION Summary of this function goes here
%   Detailed explanation goes here
N = size(us, 2); % Number of views

% Construct the matrix A
A = zeros(2*N, 4);
for i = 1:N
    P = Ps{i};
    u = us(:, i);
    A(2*i-1:2*i, :) = [P(1, :) - u(1)*P(3, :);
                        P(2, :) - u(2)*P(3, :)];
end

% Solve for the 3D point using SVD
[~, ~, V] = svd(A);
U = V(1:4, end);
U = U(1:3) ./ U(4); % Homogeneous to Euclidean coordinates
end

