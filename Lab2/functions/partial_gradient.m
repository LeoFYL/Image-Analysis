function [wgrad, w0grad] = partial_gradient(w, w0, example_train, label_train)
    % Calculate the gradient of the logistic loss function
    % w and w0 are the weights and the bias of the model
    % example_train is the feature matrix for the training examples
    % label_train is the label vector for the training examples  
    example_train=cell2mat(example_train); 
y = dot(example_train,w) + w0;

p = exp(y)/(1+exp(y));

if label_train == 1

    wgrad = (p-1) * example_train;
    w0grad = (p-1);

else

    wgrad = p * example_train;
    w0grad = p;

end

end

