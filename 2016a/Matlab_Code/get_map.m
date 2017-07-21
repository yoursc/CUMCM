%% 简介
% 首先执行初始变量，定义基本参数
% 设置单一变量，代入可多次求得pole表
% 提取表中的关键数据到map表
% 比对map表中的数据可以发现该单一变量对系统的影响
%% 求解
get_m_ball_max
map = zeros(m_ball_max,6);
line_x = m_ball_max ;
% 1-自变量 2-锚链α 3-声纳α 4-活动范围 5-锚向上的拉力  6-错误标识
for magin = 1:m_ball_max
    m_ball = magin  ;
    get_right_number
    map(magin,1) = m_ball ;
    map(magin,2) = pole( 2,6 );
    map(magin,3) = pole( k_anchor+2,6 );
    map(magin,4) = pole(all,4);
    map(magin,5) = f_anchor ;
    map(magin,6) = ( map(magin,2) >= 16 ) || ( map(magin,3) <= 85 ) ;
    [joy,magin]
end
clear magin