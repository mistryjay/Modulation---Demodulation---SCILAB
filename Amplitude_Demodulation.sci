
clc;
clear;


fc = 5000;//carrier frequency = 1kHz
fm = 100;//modulating frequecy = 100Hz
Ac = 10;//amplitude of carrier signal 
Am = 10;//amplitude of modulating signal
m = Am/Ac;//modulation index 
t = linspace(0,0.02,10000);


ec = Ac*sin(((2*%pi)*fc)*t);//definition of carrier signal 
em = Am*sin(((2*%pi)*fm)*t);//definition of modulating signal 
y = Ac*(1+(m*cos(((2*%pi)*fm)*t)) .*sin(((2*%pi)*fc)*t));//definition of modulated signal 

//considering a filter and obtaining its response. 
x = y .*ec;
dm = conv(y.*ec,exp((-t)/0.05)); //used convolution function to obtain the response in time domain only

//plotting the waveforms
figure();
subplot(3,1,1);
plot(t,em);
xlabel("Time(sec)");
ylabel("Amplitude(V)");
title("Modulating Signal");
legend("e_m(t)");

subplot(3,1,2);
plot(t,y);
xlabel("Time(sec)");
ylabel("Amplitude(V)");
title("Modulated Signal");
legend("e(t)");

subplot(3,1,3);
plot(t(1:10000),dm(1:10000));  // making the dimensions compatible 
xlabel("Time(sec)");
ylabel("Amplitude");
title("Demodulated Signal");
legend("d(t)");
