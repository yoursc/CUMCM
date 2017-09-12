%% 载入外部数据
[data,txt] = xlsread('train.xlsx',1,'A2:G1048576') ;
% [data,txt] = xlsread('tast20.xlsx',1,'A2:G21');
addr = txt;
data(:,5:9) = 0;
clear txt
%% 计算距离
for k = 1:size(data,1)
    disp(k)
    [data(k,5),data(k,6)] = geohashoff(addr{k,2});
    [data(k,7),data(k,8)] = geohashoff(addr{k,3});
    data(k,9) = distance(data(k,5),data(k,6),data(k,7),data(k,8))*pi*6371/180;
end
