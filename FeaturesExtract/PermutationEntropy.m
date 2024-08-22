function pe= PermutationEntropy(y)
%  Calculate the permutation entropy
%  Input:   y: time series;
%           m: order of permuation entropy
%           t: delay time of permuation entropy, 
% Output: 
%           pe:    permuation entropy
m=3;
t=1;
ly = length(y);
permlist = perms(1:m);
c = zeros(1,length(permlist));
    
 for j=1:ly-t*(m-1)
     [~,iv]=sort(y(j:t:j+t*(m-1)));
     for jj=1:length(permlist)
         if (abs(permlist(jj,:)-iv))==0
             c(jj) = c(jj) + 1 ;
         end
     end
 end
c=c(c~=0);
p = c/sum(c);
pe = -sum(p .* log(p));
