clc;
clear all;
number_of_clusters=15;
X=importdata('data.txt',',');
%%
KMEANS(X,number_of_clusters)
%%
avg=mean(X);
X=X-avg;
cov=(X'*X)/size(X,1);
[U,S,V]=svd(cov);
% T is the transformation matrix
T=[];
error=[];
com=[];
for j=1:size(U,2)
    T=[T,U(:,j)];
    Z=X*T;
    R=Z*T';
    E=X-R;
    [s,n] = sumsqr(E);
    s=s/size(X,1);
    error=[error,s];
    com=[com,j];
    if (s<0.1)
        break;
    end
end
fprintf('The total number principal components:%d',j);
plot(error,com)
title('Error plot')
xlabel('Number of prinicipal components')
ylabel('Error');
%% Clustering in the lower dimension
KMEANS(Z,number_of_clusters);