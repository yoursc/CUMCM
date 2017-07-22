function [  ] = img_text( a,b,img )
%UNTITLED 将两个碎片进行拼接，用于人工干预
%   此处显示详细说明
    anims = [img{a} img{b}];
    imshow(anims)
end

