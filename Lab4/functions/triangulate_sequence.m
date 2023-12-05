load sequence.mat
threshold = 5;
Us = [];
%N_examples = length(triangulation_examples);
for i=1:1000

    Ps = triangulation_examples(i).Ps;
    xs = triangulation_examples(i).xs;
    
    [U, nbr_inliers] = ransac_triangulation(Ps, xs, threshold);

    if nbr_inliers >=2
        Us = [Us U];
    end

end