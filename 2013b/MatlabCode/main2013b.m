%% 双清
close all
clear all
clc
img_num = [1 19 0 0 0]; %碎片 [行数 列数 总数 片像素行数 片像素列数]
img_num(3) = img_num(1) * img_num(2); %碎片总数
img_dir = '../1/';
%% 加载图片
img = cell(1,img_num(3)); %碎片图像
for k = 1:img_num(3)
    file_name = sprintf( '%03i.bmp',k-1 );
    str = strcat([img_dir,file_name]);
    %img{k+1} = im2bw(imread(str));
    img{k}= (imread(str));
end
img_num(4:5) = size(img{1});
clear k str

%% 加载特征值
feature = cell(4,img_num(3));%统一储存成列向量
for k = 1:img_num(3)
    feature{1,k} = (img{k}(1,:))';          %上侧像素
    feature{2,k} = (img{k}(img_num(4),:))'; %下侧像素
    feature{3,k} = img{k}(:,1);             %左侧像素
    feature{4,k} = img{k}(:,img_num(5));    %右侧像素
end 
clear k

%% 构建边缘相似度矩阵
%左右相似阵
like_R = zeros(img_num(3));
like_C = like_R;
for m = 1:img_num(3)
for n = 1:img_num(3)
    if m==n
        like_R(m,n)=0;
    else
        like_R(m,n) =like(feature{4,m},feature{3,n});
        %纸片(i)右侧 和 纸片(j)左侧 的相似度矩阵
        like_C(m,n) =like(feature{2,m},feature{1,n});
        %纸片(i)下侧 和 纸片(j)上侧 的相似度矩阵
    end
end
end
clear m n

%% 特征值分析
%暂未列出，需验证后整合
%% 结果输出
% img_all = img_puz(img,img_num,order);
% imshow(img_all)
%imwrite(img_all,'img_all.png')