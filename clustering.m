clc;
clear all;
number_of_clusters=10;
file=importdata('data.txt',',');
idx=kmeans(file,number_of_clusters);
i=idx(1);

% for j=1:size(idx,1)
%     if(i~=idx(j))
%         fprintf('cluster %d ends at %d \n',i,j);
%         fprintf('new cluster %d begins\n',idx(j));
%         i=idx(j);
%     end
% end
for j=1:500:5000
    fprintf('loop %d \n',floor(j/500));
    C=unique(idx);
    for i=1:size(C,1)
        B(i,:)=[C(i), sum(idx(j:j+499)==C(i))];
        fprintf('cluster %d number %d \n',C(i),B(i,2));
        
    end
    fprintf('%d %d\n',(B==max(B)),max(B));
end
