%% what
% 程序的最初原形
% 不包含任何自编函数，是把程序模块化之前的程序
% 确定所有的状态量的情况下，可以求得整个系统的形状
close all
clear all
clc

pole=zeros(216,7);
f = 2025 ; %浮标横向受力
G = 9.8 ;
for i = 1:216
    pole(i,1) = i ;
end

for i = 2:211
   pole(i,2) = 0.735 ;
   pole(i,3) = 0.105 ;
end
for i = 2:2    %沉底锚链个数
    pole(i,2) = 0 ;
end
pole(212,2) = 100 ;
pole(212,3) = 1 ;
for i = 213:216
   pole(i,2) = 10 ;
   pole(i,3) = 1 ; 
end
pole(212,2) = 1200 + pole(212,2) ;
pole(1,2) = 70 ;

for i = 2:216
   pole(i,2) = pole(i,2) + pole(i-1,2);
   aerfa = atan( pole(i,2)*G/f ) ;
   pole(i,6) = rad2deg(aerfa);
   pole(i,7) = 90 - pole(i,6);
   pole(i,4) = pole(i-1,4)+ cos(aerfa) * pole(i,3) ;
   pole(i,5) = pole(i-1,5)+ sin(aerfa) * pole(i,3) ;
end
plot(pole(:,4),pole(:,5)) 
pole(216,4:5)