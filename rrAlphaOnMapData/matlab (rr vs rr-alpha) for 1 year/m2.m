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

status = RRpartial_status(C,M,r,sequence,alpha,f,f_1);
%cost_RR_c = Chase(C,M,r,sequence);


timeslot=1:1:N;%?why 22632?
subplot(3,1,1);
plot(timeslot,sequence,'-go','MarkerSize',10,'linewidth',2);
xlabel('Timeslot','interpreter','latex','FontSize',16);
ylabel('Number of request per time-slot','FontSize',16);
subplot(3,1,2);
plot(timeslot,status,'-ro','MarkerSize',10,'linewidth',2);
xlabel('Timeslot','interpreter','latex','FontSize',16);
ylabel('Storage status','FontSize',16);
subplot(3,1,3);
plot(timeslot,C,'-bo','MarkerSize',10,'linewidth',2);
xlabel('Timeslot','interpreter','latex','FontSize',16);
ylabel('c','FontSize',16);
% ylim([0 0.6]);
%xlim([0.5 1.3]);
grid on;
%legend({'$\alpha-RR$','$RR$'},'location','best','interpreter','latex','FontSize',8)

% saveas(figure(1),'subplots', 'epsc')
% save('j2_1');

