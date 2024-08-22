load data.mat % use the SCH dataset as an example.
channelNum = 14;
subjectNum = 84;
n = length(data);
featuresMatrix = cell(subjectNum,channelNum);   
for i = 1 : channelNum % traverse every channels
    parfor j = 1 : subjectNum %traverse every subject
        featuresMatrix{j,i} = getFeatures(data{j,i}');
    end  
end
