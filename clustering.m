clc;
clear all;

number_of_clusters=5;
file=importdata('data.txt',',');
idx=kmeans(file,number_of_clusters);
i=idx(1);
%%
temp=zeros(10,number_of_clusters);
for j=1:500:5000
    index=floor(j/500)+1;
    for i=j:j+499
        temp(index,idx(i))=temp(index,idx(i))+1;
    end
    
end
%%
[val labels]=max(temp);
labels
%%
conf=zeros(10,10);
for i=1:10
    for j=1:number_of_clusters
        conf(i,labels(j))= conf(i,labels(j))+ temp(i,j);
    end
end
acc= double(trace(conf)/size(file,1));
fprintf('Confusion Matrix:');
conf
fprintf('Accuracy:%f\n',acc);