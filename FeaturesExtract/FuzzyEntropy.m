%get Fuzzy Entropy
function FuzEn = FuzzyEntropy(data,dim,r,n,tau)

if nargin == 4, tau = 1; end
if nargin == 3, n = 2; tau=1; end
if tau > 1, data = downsample(data, tau); end

N = length(data);
result = zeros(1,2);

for m = dim:dim+1
    count = zeros(N-m+1,1);
    dataMat = zeros(N-m+1,m);

    % Set up the data matrix and construct it into an m-dimensional vector
    for i = 1:N-m+1
        dataMat(i,:) = data(1,i:i+m-1);
    end
    % The distance is used to calculate the number of similar patterns
    for j = 1:N-m+1
        % Chebyshev distance is calculated, excluding self-matching cases
        dataMat=dataMat-mean(dataMat,2);
        tempmat=repmat(dataMat(j,:),N-m+1,1);
        dist = max(abs(dataMat - tempmat),[],2);
        D=exp(-(dist.^n)/r);
        count(j) = (sum(D)-1)/(N-m);
    end
    result(m-dim+1) = sum(count)/(N-m+1);
end
    % The calculated fuzzy entropy value
    FuzEn = log(result(1)/result(2));
end

