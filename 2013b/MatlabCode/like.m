function [ retu ] = like( a,b )
% 列向量相似率计算函数
% retu a b 均是列向量
% 此处显示详细说明
    less = 0 ; % 占空比下限阈值
    in_type = 255 ;% 像素值范围
    long = size(a,1);
    if long ~= size(b,1) % 两个列向量的长度应当等长
        retu = 0;
        disp('Error:Fun like,different long size.')
    else
        % 图像采用uint8格式，值为0-255
        % 像素值255为纯白色，相当于空位，否则为有信息
        % a_d b_d 实际上是把特征向量二值化
        a_d = (in_type-a) ./ (in_type-a+eps); 
        b_d = (in_type-b) ./ (in_type-b+eps);
        c_d = uint8( a_d | b_d );
        a_d_sum = sum(a_d);
        b_d_sum = sum(b_d);
        c_d_sum = sum(c_d);
        % duty是特征向量的占空比
        a_duty = a_d_sum / long ;
        b_duty = b_d_sum / long ;
        if (a_duty<=less) || (b_duty<=less)
            retu = 0;
        else   
            retu = 1 - sum(c_d.*((a-b)+(b-a)))/c_d_sum/in_type ;
        end  
    end
end

