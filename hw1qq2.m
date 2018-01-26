clear;clc;
X=importdata('babies.txt',' ');

age=X.data(:,4);

num_old=sum(age(:)>35);
num_young=sum(age(:)<=35);

X_old_select=X.data(find(age>35),:);
X_young=X.data(find(age<=35),:);

X_young_select=datasample(X_young,136);

% all the data select 136 number
figure
qqplot(X_young_select(:,1));
title('Q-Q plot of baby weight with mom age <= 35');

figure
qqplot(X_old_select(:,1));
title('Q-Q plot of baby weight with mom age > 35');

figure
qqplot(X_young_select(:,1),X_old_select(:,1));
title('Q-Q plot of baby weight mom <= 35 vs mom > 35');