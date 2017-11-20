clc;
clear all;
number_of_clusters=10;
file=importdata('data.txt',',');
idx=kmeans(file,number_of_clusters);
i=idx(1);

for j=1:size(idx,1)
    if(i~=idx(j))
        fprintf('cluster %d ends at %d \n',i,j);
        fprintf('new cluster %d begins\n',idx(j));
        i=idx(j);
    end
end