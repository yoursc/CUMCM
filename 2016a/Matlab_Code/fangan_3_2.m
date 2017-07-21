%% 第三题对推论的验证
% 若单节锚链长度远小于锚链总长度，
% （小于百分之一）
% 仅改变锚链的单节长度，
% 对系统影响很小
close all
clear all
clear all
clc
%% 计算第一种情况
start_data
v_wind = 24 ;
m_anchor_p = 7;
k_anchor = 210 ;
l_anchor = 0.105;
get_right_number
text1 = [ pole( 2,6 ),pole( k_anchor+2,6 ),pole(all,4) ] 
% 1-锚链α 2-声纳α 3-活动范围
%% 计算第二种情况
start_data
v_wind = 24 ;
m_anchor_p = 7;
k_anchor = 105 ;
l_anchor = 0.210;
get_right_number
text2 = [ pole( 2,6 ),pole( k_anchor+2,6 ),pole(all,4) ] 
% 1-锚链α 2-声纳α 3-活动范围
%% 汇总
text0 = abs( text1 - text2 ) % 差值
% 求差异率
text0 = text0 ./ [ 90,90,sqrt( (l_anchor*k_anchor+l_sonar+l_pipe*k_pipe+l_buoy)^2 - (depth)^2 ) ] 