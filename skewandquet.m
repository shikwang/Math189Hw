clear;clc;
X=importdata('babies.txt',' ');

smoke=X.data(:,7);
age=X.data(:,4);

X_old_select=X.data(find(age>35),:);
X_young=X.data(find(age<=35),:);
X_young_select=datasample(X_young,136);

X_yessmoke_select=X.data(find(smoke==1),:);
X_nosmoke=X.data(find(smoke==0),:);
X_nosomke_select=datasample(X_nosmoke,484);

y_young_skew_all=skewness(X_young(:,1));
y_young_kurt_all=kurtosis(X_young(:,1));
y_nosmoke_kurt_all=kurtosis(X_nosmoke(:,1));
y_nosmoke_skew_all=skewness(X_nosmoke(:,1));


y_yessmoke_skew=skewness(X_yessmoke_select(:,1));
y_nosmoke_skew=skewness(X_nosomke_select(:,1));
y_old_skew=skewness(X_old_select(:,1));
y_young_skew=skewness(X_young_select(:,1));

y_yessmoke_kurt=kurtosis(X_yessmoke_select(:,1));
y_nosmoke_kurt=kurtosis(X_nosomke_select(:,1));
y_old_kurt=kurtosis(X_old_select(:,1));
y_young_kurt=kurtosis(X_young_select(:,1));