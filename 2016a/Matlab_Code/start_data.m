%% 简介
% 装载各个参数
% 各个参数均为默认值
%% 参数设置
% 环境
v_wind = 12 ; % 风速 m/s  可调
v_sea = 0 ; % 水速 m/s  可调
depth = 18 ;  % 水深 m    可调
g = 9.8 ; % 重力加速度
density_sea = 1.025 * 10^3 ; % 海水密度 kg/m^3
% 质量
m_buoy = 1000 ;  % 浮筒质量 kg
m_pipe = 10 ;    % 钢管质量 kg
m_sonar = 100 ;  % 声纳质量 kg
m_ball = 1200 ;  % 重物质量 kg  可调
m_anchor = 0 ;   % 锚链单节质量 kg
m_anchor_p = 7;  % 锚链单位质量 kg/m 可调
% 数量
k_pipe = 4  ;       % 钢管数量
k_anchor = 210 ;    % 锚链数量  可调
% 长度
l_buoy = 2 ;      % 浮筒长度 m
l_pipe = 1 ;      % 钢管长度 m
l_sonar = 1 ;     % 声纳长度 m
l_anchor = 0.105; % 锚链长度 m  可调
% 直径
d_buoy = 2 ;   % 浮筒直径  m
d_sonar = 0.3 ;% 声纳直径  m