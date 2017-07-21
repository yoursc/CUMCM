%% 解释
% 根据相关辆，求的重力球的最大质量
%% 主程序
m_anchor = m_anchor_p * l_anchor ; % 将单位质量转化为单节质量
m_all = m_buoy + m_pipe * k_pipe + m_sonar +  m_anchor *  k_anchor ;
m_ball_max =  fix( ( density_sea * ( d_buoy / 2 )^2 * pi * l_buoy - m_all ) ) ;
