function warped = align_images(source, target, thresh) 
%ALIGN_IMAGES Summary of this function goes here
%   Detailed explanation goes here
src_points = detectSIFTFeatures(source);
[src_features, src_validPoints] = extractFeatures(source,src_points);

trg_points = detectSIFTFeatures(target);
[trg_features, trg_validPoints] = extractFeatures(target,trg_points);

corrs = matchFeatures(src_features, trg_features, 'MaxRatio', 0.8, 'MatchThreshold', 100);

src_points = src_validPoints.Location(corrs(:,1),:)';

trg_points = trg_validPoints.Location(corrs(:,2),:)';

[A,t] = ransac_fit_affine(src_points, trg_points, thresh);

warped = affine_warp(size(target), source, A, t);



end

