clc;
clear all;
number_of_clusters=10;
old=importdata('data.txt',',');
imshow(vec2mat(old(1,:),20));
%%
X=pca(old);
%%
number_of_new_features=3;
coef=X(:,1:number_of_new_features);
new=old*coef;

%%
new = pcares(old,50);
imshow(vec2mat(new(1,:),20));