function warped = align_images_inlier_ls(source, target, threshold, upright)

src_points = detectSIFTFeatures(source);
% src_points = detectSURFFeatures(source);
[src_features, src_validPoints] = extractFeatures(source, src_points, 'Upright', upright);

trg_points = detectSIFTFeatures(target);
% trg_points = detectSURFFeatures(target);
[trg_features, trg_validPoints] = extractFeatures(target, trg_points, 'Upright', upright);

corrs = matchFeatures(src_features, trg_features);

src_points = src_validPoints.Location(corrs(:, 1), :)';

trg_points = trg_validPoints.Location(corrs(:, 2), :)';

[A, t] = ransac_fit_affine(src_points, trg_points, threshold);

res = residual_lgths(A, t, src_points, trg_points);

idx = res < threshold;

disp('All points')

disp(num2str(sum(res)))

[A, t] = least_squares_affine(src_points(:, idx), trg_points(:, idx));

res = residual_lgths(A, t, src_points(:, idx), trg_points(:, idx));

disp('Only inliers')

disp(num2str(sum(res)))


warped = affine_warp(size(target), source, A, t);
end