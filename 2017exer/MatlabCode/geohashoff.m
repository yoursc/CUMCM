function [ lat,lot ] = geohashoff( geoh )
%geohash解码    
Len=7;
% Base32编码    
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
% geoh为待解析的编码，是字符串

%当前计算位的奇偶性
odd = true ;
latitude=[-90,90];%纬度
longitude=[-180, 180];%经度
for i=1:Len
   for j=1:32
            if(Base32(j)==geoh(i))
                bits=j-1;    % 找到第i个字符对应的数
                break;
            end
    end

    for jj=1:5
            j=6-jj;
        switch j    
            case 5
                ad=16;
            case 4
                ad=8;
            case 3
                ad=4;
            case 2
                ad=2;
            case 1
                ad=1;
        end
            
          if  bitand(bits,ad)
              bit=1;
          else
              bit=0;
          end      % 取出对应的位
            if odd
                mid = (longitude(1) + longitude(2)) / 2;
                if bit==0
                    longitude(2)= mid;
                else
                    longitude(1)= mid;
                end
                    
                
            else
            
                mid = (latitude(1) + latitude(2)) / 2;
                if bit==0
                    latitude(2)= mid;
                else
                    latitude(1)= mid;
                end
            end
            
            
            odd = ~odd;
    end
    
end

    lat = (latitude(1) + latitude(2)) / 2;
    lot = (longitude(1) + longitude(2)) / 2;
end