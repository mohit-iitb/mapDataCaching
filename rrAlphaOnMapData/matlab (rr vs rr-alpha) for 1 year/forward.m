function seq=forward(alpha)
% a='rr5_alpha0-0.1/forward_';
a='rr_1year/forward_';
b=num2str(alpha);
c='.csv';
f=csvread([a b c]);
sequence = [];
for i=1:length(f)
    sequence = [sequence f(i)];
end
seq = sequence;
end