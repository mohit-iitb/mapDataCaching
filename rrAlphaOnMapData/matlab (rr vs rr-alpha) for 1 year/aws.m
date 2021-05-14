function seq=aws(num)

prices=csvread('aws_prices_24254.csv');
prices=prices(1:num);
minData = min(prices);
maxData = max(prices);
sequence = [];
for i=1:length(prices)
    T = (prices(i) - minData) / (maxData - minData);
    %T = (prices(i)) / (maxData);
    sequence = [sequence 14*T];
end
seq = sequence;
end
    