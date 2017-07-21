%% 求解
% 生成综合对比数据包，计算较慢
map_1_30_p_anchor = ones(527,6,30);
for joy = 1:30
    start_date
    m_anchor_p = joy;
    get_map
    map_1_30_p_anchor(1:line_x,1:6,joy) = map(:,:) ;
    clear line_x
end
%% 制图
% 根据运算结果，生成图表，便于分析。
% 上部过程过慢，执行下海注释可直接加载结果
% load('301.mat')
map1 = zeros(5270,30);%α0
for i = 1:30
    map1(1:5270,i) = map_1_30_p_anchor(1:5270,2,i);
end
map2 = zeros(5270,30);
for i = 1:30%α声纳
    map2(1:5270,i) = map_1_30_p_anchor(1:5270,3,i);
end
%%
% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 contour
[c1,h1] = contour(map1,'LevelStep',4);
clabel(c1,h1);

% 创建 contour
[c2,h2] = contour(map2,'LevelStep',2.5);
clabel(c2,h2);

% 创建 xlabel
xlabel({'锚链的单位长度质量','(kg/m)'});

% 创建 ylabel
ylabel({'重力球质量','（kg）'});

% 创建 title
title({'锚链单位质量&重力球质量对α（0）及α（铁桶）的影响'});

box(axes1,'on');
axis(axes1,'tight');
% 设置其余坐标轴属性
set(axes1,'BoxStyle','full','Layer','top');
% 创建 textbox
annotation(figure1,'textbox',...
    [0.0966325036603221 0.0391822827938671 0.032210834553441 0.061328790459966],...
    'String',{'α','（°）'},...
    'FitBoxToText','off');