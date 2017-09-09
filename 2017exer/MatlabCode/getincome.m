function [ income ] = getincome( company , area)
%计算当月公司各项收入费用
%   公司营收包括：计费收入、包月收入、押金金融、其他

%计费收入
time_charge = company(1)*(1-company(4)/100)*company(6)*company(5)*area(2);
%包月收入
month_charge = company(1) * company(4)/100 * company(7) ;
%押金收入
deposit = company(1) * company(3) * company(8)/100;
%其他
other = 0 ;

income = [time_charge month_charge deposit other] ;
end

