function warped = align_images_v2(source, target, threshold, upright)

src_points = detectSIFTFeatures(source);
%src_points = detectSURFFeatures(source);
[src_features, src_validPoints] = extractFeatures(source,src_points,'Upright', upright);

trg_points = detectSIFTFeatures(target);
%trg_points = detectSURFFeatures(target);
[trg_features, trg_validPoints] = extractFeatures(target,trg_points,'Upright', upright);

corrs = matchFeatures(src_features, trg_features, 'MaxRatio', 0.8, 'MatchThreshold', 100);

src_points = src_validPoints.Location(corrs(:,1),:)';

trg_points = trg_validPoints.Location(corrs(:,2),:)';

[A,t] = ransac_fit_affine(src_points, trg_points, threshold);

warped = affine_warp(size(target), source, A, t);

end