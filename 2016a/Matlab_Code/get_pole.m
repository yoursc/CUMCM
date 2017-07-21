%% 解释
% 从下向上递推每一节的状态
% 生成pole表格（链接数，6）
% 1-长度 2-重力 3-质量累加 4-X坐标 5-Y坐标 6-α角度（与水平方向）
%%
get_f

pole(2:2+k_anchor_under,3) = zeros(k_anchor_under+1,1) ; % 沉底部分置零
pole(1,3) = f_anchor ; % 挂载向上的拉力
for i = 2:2+k_anchor_under
    pole(i,3) = 0 ;
    pole(i,4) = pole( i-1,4) +pole(i,1) ;
    pole(i,5) = 0 ;
    pole( i,6 ) = 0 ;
end
for i = k_anchor_under+2:all
    pole(i,3) = pole(i-1,3) + pole(i,2) ;
    aerfa = atan( pole( i,3 ) / f_hor ) ;
    pole( i,4 ) = pole(i-1,4) + cos( aerfa ) * pole(i,1) ;
    pole( i,5 ) = pole(i-1,5) + sin( aerfa ) * pole(i,1) ;
    pole( i,6 ) = rad2deg( aerfa );
end
clear aerfa