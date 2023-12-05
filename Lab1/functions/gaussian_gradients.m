function [grad_x, grad_y] = gaussian_gradients(img, std)
filtered = gaussian_filter(img,std);
h = [-1/2, 0, 1/2];
grad_x = imfilter(filtered, h.', 'replicate'); 
grad_y = imfilter(filtered, h, 'replicate');
end
