function filtered = gaussian_filter(image, std)
%The filter size should be at least four standard deviations
if size(image,1) <= 4*std || size(image,2) <= 4*std
    a = [4*std 4*std];
else
    a = size(image);
end    
h = fspecial('Gaussian', size(image),std);
filtered = imfilter(image,h,'symmetric');
end
