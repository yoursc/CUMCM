%% 简介
% 所有条件均确定，求固定锚情况下的各点静态参数
% 生成最终的pole表格（链接数，6）
% 1-长度 2-重力 3-质量累加 4-X坐标 5-Y坐标 6-α角度（与水平方向）
% 根据计算得到浮标的位置，微调误差，找到最近似值
%% 初始化参数
get_m_ball_max
f_anchor = 0 ;      % 锚向下提供的拉力  清零
k_anchor_under = 0 ;% 沉底锚链数量      清零
all = k_pipe + k_anchor + 2 ; %总节数
pole = zeros(all,6);

% 初始化锚链
for i = 2 : k_anchor + 1
    pole( i,1 ) = l_anchor ;
    pole( i,2 ) = g * m_anchor ;
end
% 挂载负重
pole( k_anchor+1,2 ) = pole( k_anchor+1,2 ) + g * m_ball ;
% 初始化声纳
pole( k_anchor+2,1 ) = l_sonar ;
pole( k_anchor+2,2 ) = m_sonar * g ;
% 初始化铁杆
for i = k_anchor+3 : all
    pole( i,1 ) = l_pipe ; 
    pole( i,2 ) = g * m_pipe ;
end
%% 预计算
get_pole
% pole(all,4:5)                % 调试观测点
% plot( pole(:,4),pole(:,5) )  % 调试观测点
%% 精确计算
if pole(all,5) + h_sea == depth
    disp('Right only ones')
else
    if pole(all,5) + h_sea > depth
        while pole(all,5) + h_sea > depth
            k_anchor_under = k_anchor_under + 1 ;
            get_pole
            if k_anchor_under == k_anchor
                disp('WRONG anchor under more')
                break;
            end
        end
    else
        while pole(all,5) + h_sea < depth
            f_anchor = f_anchor + 1000 ; 
            get_pole
        end
        f_anchor = f_anchor - 1000 ;
        get_pole
        while pole(all,5) + h_sea < depth
            f_anchor = f_anchor + 100 ; 
            get_pole
        end
        f_anchor = f_anchor - 100 ;
        get_pole
        while pole(all,5) + h_sea < depth
            f_anchor = f_anchor + 10 ; 
            get_pole
        end
        f_anchor = f_anchor - 10 ;
        get_pole
        while pole(all,5) + h_sea < depth
            f_anchor = f_anchor + 1 ; 
            get_pole
        end
    end
end
% pole(all,4:5)               % 调试观测点
% plot( pole(:,4),pole(:,5) ) % 调试观测点