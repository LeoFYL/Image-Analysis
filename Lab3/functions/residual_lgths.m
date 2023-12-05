function res = residual_lgths(A, t, pts, pts_tilde)
% Compute the transformed points
pts_trans = A*pts + t;

M = pts_trans-pts_tilde;
% Compute the residual lengths
res = sum(M.^2,1);

end