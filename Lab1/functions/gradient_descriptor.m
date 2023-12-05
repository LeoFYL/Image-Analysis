function desc = gradient_descriptor(image, position, radius)
std = radius * 0.1;
[grad_x, grad_y] = gaussian_gradients(image, std);
desc = zeros(1,72);
region_centres = place_regions(position, radius);
i = 1;
for centre = region_centres
    patch_x = get_patch(grad_x, centre(1), centre(2), radius);
    patch_y = get_patch(grad_y, centre(1), centre(2), radius);

    desc(((i-1) * 8 +1) : (i * 8)) = gradient_histogram(patch_x, patch_y);
        
    i = i + 1;
end
desc = 1/norm(desc) * desc; 
end