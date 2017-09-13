%% 载入外部数据
% 数据格式如下
% [订单号，用户ID，车辆ID，车型，出发时间，出发地，锁车地]
% 前四组数据格式为数字，第五组时字符，地址为geohash转化过的7位字符
[data,txt] = xlsread('train.xlsx',1,'A2:G1048576') ;
% [data,txt] = xlsread('tast20.xlsx',1,'A2:G21');
addr = txt;
data(:,5:10) = 0;
clear txt
%% 格式转化
for k = 1:size(data,1)
    disp(k)
    [data(k,5),data(k,6)] = geohashoff(addr{k,2});%出发地经纬度
    [data(k,7),data(k,8)] = geohashoff(addr{k,3});%目的地经纬度
    data(k,9)= ...                                %位移距离（千米）
        distance(data(k,5),data(k,6),data(k,7),data(k,8))*pi*6371/180;
    a = strfind(addr{k,1},':');
    if size(a,2) == 2
        t = addr{k,1}(a(1)-2:a(1)+5);
        data(k,10) = ...
            str2num(t(1:2))+str2num(t(4:5))/60+str2num(t(7:8))/3600;
        if  addr{k,1}(9)<=4 
            data(k,11) = addr{k,1}(9) + 3 ; % b表示周几
        else
            data(k,11) = addr{k,1}(9) - 4 ;
        end
    end
end
clear t a k
%% 载入数据
% 前两部分载入及处理时间较长
% 直接载入之前的数据存档即可
load data.mat
%% 车种类
nbins = 2;
histogram(data(1:1048575,4),nbins)

%% 时间分布
nbins = 240;
daota = 0.1 ; % 单位时间（小时）
list_time = [ 0:daota:24-daota ]; % 小时（0-23.9）
% 总体的时间分布
h=histogram(data(1:1048575,10),nbins);
list_time = [ list_time ; ( h.Values ./ 0.4 ) ]; 
% 工作日时间分布
data0 = - data(:,10) .* (data(:,11)-1);
h=histogram(data(1:1048575,10),nbins);
list_time = [ list_time ; ( h.Values ./ 0.3 ) ]; 
% 周末时间分布
data0 = data(:,10).*data(:,11);
h=histogram(data(1:1048575,10),nbins);
list_time = [ list_time ; ( h.Values ./ 0.1 ) ]; 
xlswrite('list.xlsx',list_time,1)
close all
clear nbins h
%% 使用距离

