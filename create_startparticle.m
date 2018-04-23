function [startparticle] = create_startparticle (p_LB ,p_UB, N)


% RS      = linspace(g_LB(1),g_UB(1),N);
% RD      = linspace(g_LB(2),g_UB(2),N);
% alpha   = linspace(g_LB(3),g_UB(3),N);
% k       = linspace(g_LB(4),g_UB(4),N);
% w_g     = linspace(g_LB(5),g_UB(5),N);
% 
% 
% 
% g=[];%[0 0 0 ;0 0 0;0 0 0;0 0 0;0 0 0];
% for ind1=1:length(RS)
%     a = ones(1,length(RS))*RS(ind1);
%         for ind2=1:length(RD)
%         b = ones(1,length(RD))*RD(ind2);
%             for ind3=1:length(alpha)
%             c = ones(1,length(alpha))*alpha(ind3);
%                 for ind4=1:length(k)
%                 d = ones(1,length(k))*k(ind4);
%                 g =[g [a;b;c;d;w_g]];
%                 end
%             end
%         end
%     
% end

dp_B = p_UB-p_LB;
p=zeros(5,N);

for ind=1:1:N
    p(:,ind)=rand(5,1).*dp_B + p_LB;   
end

startparticle = p;
end