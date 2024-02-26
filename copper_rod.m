M = readmatrix('/Users/gabrieldiaz/Desktop/Lab2_files/txt_data_files/real_copper3.txt');
time = M(:,1);
piezo_data = M(:,2);
mallet_data = M(:,4);
plot(time,piezo_data)
plot(time,mallet_data)
ps = findchangepts(piezo_data,'Statistic','mean','MinThreshold',3);
ps2 = findchangepts(mallet_data,'Statistic','mean','MinThreshold',10);
time(ps);
time (ps2);
delta_t = time(ps(1))-time(ps2(1));
vel = 1.06/(time(ps(1))-time(ps2(1)));
plot(time,piezo_data,time,mallet_data)
xlabel("time(s)")
ylabel("Volts(V)")
legend({'CH1','CH2'},'Location','northwest')
title('Signal detection for copper rod')
xline(time(ps(1)),'--b','CH1 signal')
xline(time(ps2(1)),'--r','CH2 signal')
pct_err = 100* sqrt( (10*2e-6/delta_t)^2 + (1/106)^2 ) /vel ;

disp(delta_t); 
disp(vel);
disp(pct_err);
disp(time(1)-time(2));