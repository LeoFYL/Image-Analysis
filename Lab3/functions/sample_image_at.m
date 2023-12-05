function value = sample_image_at(img, position) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y = round(position(1));
x = round(position(2));
h = size(img,1);
w = size(img,2);
if(y<=0) || (y>h)
    value = 1;
elseif (x<=0) || (x>w)
    value = 1;
else
    value = img(y,x);
end