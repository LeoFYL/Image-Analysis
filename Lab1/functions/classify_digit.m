function label = classify_digit(digit_image, digits_training)
medium = 9999999;
position = [19,19]; 
radius = 6;

descriptor = gradient_descriptor(digit_image, position, radius);

for i = 1: numel(digits_training)
    current = sum(abs(descriptor - digits_training(i).descriptor)); 
    if (medium > current)
        medium = current;
        label = digits_training(i).label;
        end
    end
disp(['Classified as ' num2str(label)])
end

