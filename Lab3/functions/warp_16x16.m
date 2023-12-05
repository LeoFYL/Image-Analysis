function warped = warp_16x16(source)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
warped = zeros(16,16);
for i=1:16
    for j=1:16
        pos = [i;j];
        src_yx = transform_coordinates(pos);
        src_yx = flip(src_yx);
        warped(j,i) = sample_image_at(source, src_yx);
    end
end
end

