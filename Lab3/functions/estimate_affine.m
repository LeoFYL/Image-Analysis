function [A, t] = estimate_affine(pts, pts_tilde)
N = size(pts,2);
M = zeros(2*N,6);
for j=1:N

    M(2*j-1,1:2) = pts(:,j);
    M(2*j-1,5) = 1;

    M(2*j,3:4) = pts(:,j);
    M(2*j,6) = 1;

end

v = pts_tilde(:);

B = M\v;

A = [B(1), B(2); B(3),B(4)];
t = [B(5);B(6)];
    


end