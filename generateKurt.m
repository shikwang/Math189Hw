for i = 1: 10000
    x=1:0.1:5;
    normal_kurtosis(i)=kurtosis(randn(1,136));
    hist(normal_kurtosis,x);
end