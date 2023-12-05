function net = train_classifier(layers, imgs_train, labels_train, imgs_val, labels_val)

epochs = 30;
options = trainingOptions('sgdm','MaxEpochs',epochs, 'Verbose',false);
net = trainNetwork(imgs_train,labels_train, layers, options);
tp = nnz(net.classify(imgs_val) == labels_val); %The nnz function returns the number of non-zero elements in the input.
accuracy = tp / length(labels_val);
disp(['The network achieved an accuracy of: ' num2str((accuracy)*100),'%'])
end