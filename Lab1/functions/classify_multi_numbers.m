function classify_multi_numbers(image,position,radius,digits_training)
medium = 9999999;

descriptor = gradient_descriptor(image, position, radius);

for i = 1: numel(digits_training)
    current = sum(abs(descriptor - digits_training(i).descriptor)); 
    if (medium > current)
        medium = current;
        label = digits_training(i).label;
        end
end
fprintf('The position is: %d %d', position);
fprintf(' , corresponding label is : %d\n',label);
end