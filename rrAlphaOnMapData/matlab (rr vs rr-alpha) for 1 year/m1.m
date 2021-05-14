clc;
clear all;
close all;

r=0;
M = 10;%download cost
%alpha = 0.4;%for RR alpha

cost_RR=[];
cost_RRA=[];

for alpha = 0.1:0.1:1
sequence = len();
f = forward(alpha);
f_1 = forward(1);
N = length(sequence);
C = aws(N);
disp(alpha);

cost_RRA_c = RRpartial_real(C,M,r,sequence,alpha,f,f_1);
cost_RRA=[cost_RRA cost_RRA_c];

cost_RR_c = Chase(C,M,r,sequence,f_1);
cost_RR = [cost_RR cost_RR_c];
end


alpha=0.1:0.1:1.0;
plot(alpha,cost_RRA,'-bo',alpha,cost_RR,'-ro','MarkerSize',10,'linewidth',2);
xlabel('$\alpha$','interpreter','latex','FontSize',16);
ylabel('Cost of service per time-slot','FontSize',16);
%xlim([0.5 1.3]);
grid on;
legend({'$\alpha-RR$','$RR$'},'location','best','interpreter','latex','FontSize',8)

% saveas(figure(1),'alphavscost_1year', 'png')
% save('j2_1');

