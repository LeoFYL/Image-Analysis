function layers = basic_cnn_classifier()
layers = [
%input 28*28 1 dimension
imageInputLayer([28,28,1]);
convolution2dLayer(3,25);
reluLayer();
maxPooling2dLayer(2, 'Stride',2);
fullyConnectedLayer(10);
softmaxLayer();
classificationLayer()
];
end