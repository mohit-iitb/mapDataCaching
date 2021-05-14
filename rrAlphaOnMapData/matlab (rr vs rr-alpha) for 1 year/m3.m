clc;
clear all;
close all;

r=0;
M = 10;%download cost
alpha = 0.4;%for RR alpha

cost_RR=[];
cost_RRA=[];

sequence = len();
f = forward(alpha);
f_1 = forward(1);
N = length(sequence);
C = aws(N);
disp(alpha);

for M =10:1:20
cost_RRA_c = RRpartial_real(C,M,r,sequence,alpha,f,f_1);
cost_RRA=[cost_RRA cost_RRA_c/N];

cost_RR_c = Chase(C,M,r,sequence,f_1);
cost_RR = [cost_RR cost_RR_c/N];
end
M=10:1:20;
plot(M,cost_RRA,'-bo',M,cost_RR,'-ro','MarkerSize',10,'linewidth',2);
xlabel('M','interpreter','latex','FontSize',16);
ylabel('Cost of service per time-slot','FontSize',16);
%xlim([0.5 1.3]);
grid on;
legend({'$\alpha-RR$','$RR$'},'location','best','interpreter','latex','FontSize',8)

% saveas(figure(1),'Mvscost', 'png')
% save('j2_1');
