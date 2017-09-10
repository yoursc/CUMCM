function [ expend ] = getexpend( company,aim)
%计算当月公司各项支出费用
% 公司支出包括：税务、新车购置、客服人员、车辆维护队伍、调度队伍、营销

%税务
tax = sum(getincome(company)) * company(9)/100;
%新车购置
new_car = aim(1) * company(19) ;
%客服人员
call = company(10) * company(11) ;
%车辆维护队伍
repair = company(12) * company(13) ;
%调度队伍
move = company(14) * company(15) ;
%公关营销
pr_market = sum(getincome(company)) * company(16)/100 ; %待修改

expend = [ tax new_car call repair move pr_market ] ;
end

