clear;clc;
X=importdata('babies.txt',' ');

smoke=X.data(:,7);

num_nosmoke=sum(smoke(:)==0);
num_yessmoke=sum(smoke(:)==1);

X_yessmoke_select=X.data(find(smoke==1),:);
X_nosmoke=X.data(find(smoke==0),:);

X_nosomke_select=datasample(X_nosmoke,484);

% all the data select 484 number
figure
qqplot(X_nosomke_select(:,1));
title('Q-Q plot of baby weight with non-smoke mom')

figure
qqplot(X_yessmoke_select(:,1));
title('Q-Q plot of baby weight with smoke mom')

figure
qqplot(X_nosomke_select(:,1),X_yessmoke_select(:,1));
title('Q-Q plot of baby weight non-smoke vs smoke mom')
