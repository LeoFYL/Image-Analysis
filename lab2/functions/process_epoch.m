function [w, w0] = process_epoch(w, w0, lrate, examples_train, labels_train)
    % Perform one iteration of gradient descent
    % w and w0 are the weights and the bias of the model
    % lrate is the learning rate
    % examples_train is the feature matrix for the training examples
    % label_train is the label vector for the training examples
    
tmp_examples_train = examples_train;
tmp_labels_train = labels_train;

r = randperm(size(tmp_examples_train,2)); 
%for question 2.7
%r = round(linspace(1,length(tmp_examples_train),length(examples_train)));
 
for i = 1:length(examples_train)
    examples_train(i) = tmp_examples_train(r(i));
    examples_labels(i) = tmp_labels_train(r(i));

    [wgrad, w0grad]= partial_gradient(w, w0, examples_train(i),examples_labels(i));
    
    w = w - (lrate*wgrad);
    w0 = w0 - (lrate*w0grad);
    
    
    
end 
end