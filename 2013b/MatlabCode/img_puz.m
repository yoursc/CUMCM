function [ retu ] = img_puz( img,img_num,order )
%根据所给顺序矩阵，拼装完整的图片
    retu = zeros( img_num(1)*img_num(4),img_num(2)*img_num(5),'uint8' );
    for m = 1:img_num(1)
    for n = 1:img_num(2)
        r1 = img_num(4) * (m-1) + 1;
        r2 = img_num(4) * m;
        c1 = img_num(5) * (n-1) +1;
        c2 = img_num(5) * n;
        retu(r1:r2,c1:c2) = img{order(m,n)};
    end        
    end
end

