function samlpeEntropy=SampleEntropy(data)
    %Sample entropy % input for calculating the data sequence:
    dim=2;
    r=0.15;
    data = data(:);
    N=length(data);
    phi=zeros(1,2);
    r = r*std(data);
    for j = 1:2
        m =dim+j-1; 
        B=zeros(1,N-m+1);
        dataMat = zeros(m,N-m+1); 
        
        for i = 1:m
            dataMat(i,:) = data(i:N-m+i);
        end
        for i = 1:N-m
            tempMat = abs(dataMat -repmat(dataMat(:,i),1,N-m+1));
            boolMat=any((tempMat>r),1);
            B(i)=(sum(~boolMat)-1)/(N-m-1);
        end
            phi(j)=sum(B)/(N-m);
    end
         samlpeEntropy =log(phi(1))-log(phi(2)); 
end
