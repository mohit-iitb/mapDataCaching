function seq=len()

l=csvread('rr_1year/number_0.1.csv');
sequence = [];
for i=1:length(l)
    sequence = [sequence l(i)];
end
seq = sequence;
end