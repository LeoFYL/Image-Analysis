function [examples_train_aug,labels_train_aug] = augment_data(examples_train,labels_train,M)
examples_train_aug = {};
labels_train_aug = [];
N = size(examples_train,2);

for i=1:N
    for j=1:M
        angle = 90*randi(3);
        img = imrotate(cell2mat(examples_train(i)),angle, 'bilinear', 'crop');
        idx = i*M + j - M;
        examples_train_aug{idx} = img;
        labels_train_aug(idx) = [labels_train(i)];

    end

end