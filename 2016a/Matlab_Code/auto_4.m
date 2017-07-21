%% 解释
% 首先执行初始变量，定义基本参数
% 
%% 求解
start_data
wrong = zeros(m_ball_max,30)
map = zeros(m_ball_max,6);

% 1-自变量 2-锚链α 3-声纳α 4-活动范围 5-锚向上的拉力  6-错误标识
for m_anchor_alone = 1:30
    m_anchor = m_anchor_alone * l_anchor ;
    m_all = m_buoy + m_pipe * k_pipe + m_sonar +  m_anchor *  k_anchor ;
    auto_2
    wrong(:,m_anchor_alone) = map(:,6) ;
end
% plot( handbag(:,1),handbag(:,2),handbag(:,1),handbag(:,3),handb