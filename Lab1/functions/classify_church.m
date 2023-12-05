function label = classify_church(image, feature_collection)
%number of labels
n = length(feature_collection.names);

matches_per_label = zeros(n, 1);
%points = detectSIFTFeatures(img);
points = detectSIFTFeatures(image);
%[features, validPoints] = extractFeatures(img,points);
[features, validPoints] = extractFeatures(image, points);


for i=1:n

    desc = feature_collection.descriptors(:, feature_collection.labels==i);
    match_coords = matchFeatures(features, desc', 'MatchThreshold', 100, 'MaxRatio', 0.7);
%The number of rows of match_coords represents the number of matches found between the image and the current label.
    matches_per_label(i) = size(match_coords, 1);

end
%The tilde sign ~ is the maximum value itself. 
%The second output of the max function is the index of the maximum value in the array
[~, label] = max(matches_per_label);

end