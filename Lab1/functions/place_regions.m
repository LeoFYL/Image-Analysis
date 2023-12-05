function region_centres = place_regions(centre,radius)
y = centre(2);
x = centre(1);

x_min = 2*radius;
x_max = 2*radius;
y_min = 2*radius;
y_max = 2*radius;

% From top left -> Top right -> Mid left -> ... -> Bot right
x_cent= [x-x_min, x,       x+x_min,    x-x_min, x, x+x_max, x-x_max, x,       x+x_max];
y_cent= [y-y_min, y-y_min, y-y_min,    y,       y, y,       y+y_max, y+y_max, y+y_max];

region_centres=[x_cent;y_cent]; 
end
