function matrix = getFeatures(inputSignal)
[c,l]=wavedec(inputSignal,6,'db4'); 

a5=wrcoef('a',c,l,'db4',6); % 0-4
d5=wrcoef('d',c,l,'db4',6); % 4-8
d4=wrcoef('d',c,l,'db4',5); % 8-16
d3=wrcoef('d',c,l,'db4',4); % 16-32
d2=wrcoef('d',c,l,'db4',3); % 32-64

bands = [d2;d3;d4;d5;a5];

matrix = zeros(5,4); % return the features Matrix
    for i = 1 : 5
        matrix(i,1) = approximateEntropy(bands(i,:));
        matrix(i,2) = FuzzyEntropy(bands(i,:),2,0.15,2,1);
        matrix(i,3) = SampleEntropy(bands(i,:));
        matrix(i,4) = PermutationEntropy(bands(i,:));
    end

end