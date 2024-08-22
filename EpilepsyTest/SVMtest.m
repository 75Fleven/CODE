load featuresMatrix.mat
load dataLable.mat

tableSize = size(featuresMatrix);
sampleLength = tableSize(1);
channelNumber = tableSize(2);
result = zeros(channelNumber,5);
for i = 1 : channelNumber

    % 构建特征矩阵
    X = zeros(sampleLength,20);
    Y = dataLable;
    for j = 1 : sampleLength
        temp = featuresMatrix{j,i};
        X(j,:) = temp(:);
    end

    Y_predict = ones(1,sampleLength);
    Y_predict = Y_predict * -1;
    X_train = zeros(sampleLength-1,20);
    Y_train = zeros(1,sampleLength-1);
    for j = 1 : sampleLength
        
        testSample = X(j,:);
        X_train = X([1:j-1,j+1:end],:);
        Y_train = Y([1:j-1,j+1:end]);
        Model = fitcsvm(X_train,Y_train,"KernelFunction","polynomial");
        Y_predict(j) = predict(Model,testSample);

    end

    C = confusionmat(Y,Y_predict);

    TP = C(1,1);
    TN = C(2,2);
    FP = C(2,1);
    FN = C(1,2);

    result(i,1) = (TP + TN) / (TP + TN + FP + FN);  % ACCURACY
    result(i,2) = TP / (TP + FN);   % SENSITIVITY
    result(i,3) = TN / (FP + TN);   % SPECIFICITY
    result(i,4) = (2 * TP) / (2 * TP + FP + FN);   % F1SCORE
    result(i,5) = FP / (FP + TN);   % FALSE DISCOVERY RATE
    

end