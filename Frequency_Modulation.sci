clc;
clear;

fm = 50;  //modulating signal frequency 
fc = 400; //carrier signal frequency 
B = 10;  //modulation index
t = 0:0.0001:0.5;//time period

m = cos(((2*%pi)*fm)*t);   //modulating/message signal
c = cos(((2*%pi)*fc)*t);   //carrier signal
y = cos(((2*%pi)*fc)*t+B .*sin(((2*%pi)*fm)*t)); //modulated signal

//plotting all waveforms
figure();
subplot(3,1,1);
plot(t,m);
xlabel("Time(sec)");
ylabel("Amplitude(V)");
title("Modulating Signal");
legend("e_m(t)");


subplot(3,1,2);
plot(t,c);
xlabel("Time(sec)");
ylabel("Amplitude(V)");
title("Carrier Signal");
legend("e_c(t)");


subplot(3,1,3);
plot(t,y);
xlabel("Time(sec)");
ylabel("Amplitude(V)");
title("Modulated Signal");
legend("e(t)");

