function patch = get_patch(test_image,x,y,radius)
%the x-variable corresponds to the column index and the y-variable to the row index.
x_min = x - radius;
x_max = x + radius;
y_min = y - radius;
y_max = y + radius;
if x_min <= 0 || y_min <=0 || x_max > size(test_image,2) || y_max > size(test_image,1)
    error('Patch outside image border');
else
    patch = test_image(y_min : y_max, x_min : x_max, :);
end
end



