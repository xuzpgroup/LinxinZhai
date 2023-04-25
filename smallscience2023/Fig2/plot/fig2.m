clear;
close all;
clc;

files = dir(['*','-curr.data']);
for i = 1 : length(files)
    str = files(i).name;
    str(end-9:end) = [];
    energy(i) = str2num(str);
    A = load (files(i).name);
    M(i) = max(A(:,2));
end
[energysorted,I] = sort(energy);
Msorted = M(I);
B = [energysorted' Msorted'];
a = B(:,1)';
b = B(:,2)';
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],2);
values(3,:) = 200;
%scatter(values(1,:),values(2,:));

errorbar(values(1,:),values(2,:),values(3,:),'o');
%ylim([0 25000]);
set(gca,'xscale','log');
%exportgraphics(gcf,'diff1.eps');