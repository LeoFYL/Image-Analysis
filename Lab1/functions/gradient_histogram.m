function histogram = gradient_histogram(grad_x, grad_y)
angles = atan2(grad_y,grad_x);
ap = find(0<angles & angles <= pi/4);
bp = find(angles>(pi/4) & angles <= (pi/2));
cp = find(angles>(pi/2) & angles <= (0.75*pi));
dp = find(angles>(0.75*pi) & angles <= pi);

an = find(angles<0 & angles >= -pi/4);
bn = find(angles<-(pi/4) & angles >= -(pi/2));
cn = find(angles<-(pi/2) & angles >= -(0.75*pi));
dn = find(angles<-(0.75*pi) & angles >= -pi);

histogram = zeros(8,1);
for i=1:length(ap)
    q1 = ap(i);
  histogram(1) = histogram(1) + sqrt(((grad_y(q1))^2)+((grad_x(q1))^2));
end

for i=1:length(bp)
    q2 = bp(i);
  histogram(2) = histogram(2) + sqrt(((grad_y(q2))^2)+((grad_x(q2))^2));
end

for i=1:length(cp)
    q3 = cp(i);
  histogram(3) = histogram(3) + sqrt(((grad_y(q3))^2)+((grad_x(q3))^2));
end

for i=1:length(dp)
    q4 = dp(i);
  histogram(4) = histogram(4) + sqrt(((grad_y(q4))^2)+((grad_x(q4))^2));
end

for i=1:length(an)
    q5 = an(i);
  histogram(5) = histogram(5) + sqrt(((grad_y(q5))^2)+((grad_x(q5))^2));
end

for i=1:length(bn)
    q6 = bn(i);
  histogram(6) = histogram(6) + sqrt(((grad_y(q6))^2)+((grad_x(q6))^2));
end

for i=1:length(cn)
    q7 = cn(i);
  histogram(7) = histogram(7) + sqrt(((grad_y(q7))^2)+((grad_x(q7))^2));
end

for i=1:length(dn)
    q8 = dn(i);
  histogram(8) = histogram(8) + sqrt(((grad_y(q8))^2)+((grad_x(q8))^2));
end
end