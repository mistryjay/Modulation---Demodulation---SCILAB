clc;
clear all;

fm = 25; // frequency of message/modulating signal 
fc = 400; // frequecy of carrier signal signal  
Am = 5;   //amplitude of modulating signal
Ac = 10;  //amplitude of carrier signal 
m = Am / Ac;  // modulation index
t = 0:0.0001: 0.4; // time period 

em  = Am * sin(2*pi*fm*t);  //modulating/message signal
ec = Ac * sin(2*pi*fc*t);  //carrier signal

y = Ac * (1 + (m * cos(2*pi*fm*t))).*sin(2*pi*fc*t); //modulated signal

//plotting the waveforms
figure();
subplot(3,1,1);
plot(t,em);
title('Modulating/Message Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
legend('e_m(t)');


subplot(3,1,2);
plot(t,ec);
title('Carrier Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
legend('e_c(t)');


subplot(3,1,3);
plot(t,y);
title('Modulated Signal');
xlabel('Time(s)');
ylabel('Amplitude(V)');
legend('e(t)');
