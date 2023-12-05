percentage = 0;
for i = 1:size(digits_validation, 2)   
    label = classify_digit(digits_validation(i).image, digits_training);
    if (label == digits_validation(i).label)
        percentage = percentage + 1; 
    end
end
percentage = percentage / size(digits_validation, 2) * 100; 
disp(['The correct percentage is ' num2str(percentage) '%'])