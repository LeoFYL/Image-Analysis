function predicted_labels = classify(examples_val, w, w0)
N = size(examples_val,2);

predicted_labels = zeros(1,N);

for i=1:N

    y = dot(cell2mat(examples_val(i)),w) + w0;
    
    p = exp(y)/(1+exp(y));

    if p > 0.5

        predicted_labels(i) = 1;

    else
        predicted_labels(i) = 0;

    end

end

end