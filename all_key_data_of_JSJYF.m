%% 实测版本
NLOS=Untitled;
S=[0 0;0 30;30 0;30 30]';
pointset=[20,20];
for i=1:1:80
    chan=real(TDOA_CHAN(S',NLOS(i,:)',1));
    taylor=real(TDOA_Taylor(S',NLOS(i,:)',1));
    chan_x(i)=chan(1);
    chan_y(i)=chan(2);
    taylor_x(i)=taylor(1);
    taylor_y(i)=taylor(2);
    chanerror(i)=norm(real(TDOA_CHAN(S',NLOS(i,:)',1))-pointset);
    taylorerror(i)=norm(real(TDOA_Taylor(S',NLOS(i,:)',1))-pointset);
end
stacking_error=[0.2
0.2
0.210297
0.14
0.14
0.1
0.195
0.1
0.11
0.11
0.11
0.11
0.316228
0.101119
0.316228
0.316228
0.273907
0.115
0.18868
0.319531
0.2
0.21691
0.190394
0.18868
0.207966
0.185607
0.116619
0.1
0.195
0.360555
0.1
0.1
0.360555
0.326956
0.195
0.195
0.195
0.2
0.1
0.461411
0.451774
0.130863
0.141421
0.141421
0.101119
0.125
0.19
0.1
0.5
0.1
0.13
0.114018
0.100499
0.125
0.125
0.447214
0.447214
0.447214
0.447214
0.504009
0.447214
0.125
0.141421
0.141421
0.141421
0.141421
0.137931
0.141421
0.195
0.1
0.100499
0.137931
0.100499
0.125
0.100499
0.2
0.2
0.2
0.195
0.2
];
subplot(211)
plot(chanerror)
hold on
plot(taylorerror)
hold on
plot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('定位点个数')
ylabel('误差/m')
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(chanerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(taylorerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(stacking_error)

figure
subplot(211)
cdfplot(chanerror)
hold on
cdfplot(taylorerror)
hold on
cdfplot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('误差/m')
ylabel('概率')
%% 湖州院实测3
%% 实测版本
S=[0,0;0,20;20,0;20,20]';
NLOS=TDOA1;
pointset=[15,15];
chan_x=[];
taylor_x=[];
chan_y=[];
taylor_y=[];
chanerror=[];
taylorerror=[];
for i=1:1:20
    chan=real(TDOA_CHAN(S',NLOS(i,:)',1));
    taylor=real(TDOA_Taylor(S',NLOS(i,:)',1));
    chan_x(i)=chan(1);
    chan_y(i)=chan(2);
    taylor_x(i)=taylor(1);
    taylor_y(i)=taylor(2);
    chanerror(i)=norm(real(TDOA_CHAN(S',NLOS(i,:)',1))-pointset);
    taylorerror(i)=norm(real(TDOA_Taylor(S',NLOS(i,:)',1))-pointset);
end
stacking_error=[0.141421
1.01139
1.13137
0.141421
0.141421
0.268794
0.176139
1.06301
1.06301
1.06301
1.00061
1.08301
1.06301
1.08301
1.13137
0.989949
0.958919
0.1
0.141421
0.141421
];
subplot(212)
plot(chanerror)
hold on
plot(taylorerror)
hold on
plot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('定位点个数')
ylabel('误差/m')

figure
subplot(212)
cdfplot(chanerror)
hold on
cdfplot(taylorerror)
hold on
cdfplot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('误差/m')
ylabel('概率')

[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(chanerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(taylorerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(stacking_error)

%% 湖州院实测2
NLOS=TDOAset_stastic;
S=[0,0;6.1,0;6.1,7.2;0,7.2]';
pointset=[1.5,0.5];
chan_x=[];
taylor_x=[];
chan_y=[];
taylor_y=[];
chanerror=[];
taylorerror=[];
%NLOS=[3.04595529,6.54597628,5.28471873];%真值
%TDOA_CHAN(S',NLOS',1)
for i=1:1:80
    chan=real(TDOA_CHAN(S',NLOS(i,:)',1));
    taylor=real(TDOA_Taylor(S',NLOS(i,:)',1));
    chan_x(i)=chan(1);
    chan_y(i)=chan(2);
    taylor_x(i)=taylor(1);
    taylor_y(i)=taylor(2);
    chanerror(i)=norm(real(TDOA_CHAN(S',NLOS(i,:)',1))-pointset);
    taylorerror(i)=norm(real(TDOA_Taylor(S',NLOS(i,:)',1))-pointset);
end
stacking_error=[0.104403
0.14
0.03
0.035
0.04
0.035
0.04
0.025
0.04
0.04
0.04
0.01
0.025
0.0111803
0.04
0.04
0.04
0.101119
0.02
0.01
0.107703
0.015
0.04
0.035
0.0254951
0.107703
0.015
0.025
0.01
0.03
0.05
0.01
0.015
0.015
0.04
0.103078
0.025
0.100125
0.04
0.025
0.02
0.06
0.025
0.045
0.04
0.01
0.01
0.03
0.025
0.025
0.04
0.04
0.145
0.04
0.04
0.04
0.04
0.035
0.04
0.035
0.015
0.05
0.005
0.18
0.11
0.06
0.06
0.03
0.18
0.18
0.175
0.145
0.180278
0.035
0.107703
0.15
0.11
0.02
0.03
0.101119
0.04
];
subplot(212)
plot(chanerror)
hold on
plot(taylorerror)
hold on
plot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('定位点个数')
ylabel('误差/m')

figure
subplot(212)
cdfplot(chanerror)
hold on
cdfplot(taylorerror)
hold on
cdfplot(stacking_error)
legend('chan','Taylor','本文算法')
xlabel('误差/m')
ylabel('概率')

[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(chanerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(taylorerror)
[avg, stddev, max_val, min_val, percentile_95, percentile_50]=statistics(stacking_error)