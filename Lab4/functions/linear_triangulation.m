function U = linear_triangulation(P1, u1, P2, u2)
% P1, P2: 3x4 camera projection matrices
% u1, u2: 2x1 image points
% U: 3x1 3D point

% Build matrix A
A = [u1(1)*P1(3,:) - P1(1,:);
     u1(2)*P1(3,:) - P1(2,:);
     u2(1)*P2(3,:) - P2(1,:);
     u2(2)*P2(3,:) - P2(2,:)];

% Solve for U using SVD
[~, ~, V] = svd(A);
U = V(1:3, end) / V(end, end);
end
