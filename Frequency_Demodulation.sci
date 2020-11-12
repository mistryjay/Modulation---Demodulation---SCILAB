clc;
clear all;

fs = 1000; //sampling frequency
fc = 400;  //carrier frequency
fm = 30;   //modulating frequency 
t = (0:1/fs:0.5)'; // time period
B = 10; //modulation index
fdev = 150;   //frequency deviation 

m = cos(((2*%pi)*fm)*t);   //modulating/message signal
c = cos(((2*%pi)*fc)*t);   //carrier signal
y = cos(((2*%pi)*fc)*t+B .*sin(((2*%pi)*fm)*t)); //modulated signal


// refer the definition of fmmod and fmdemod,hilbert transform for getting the response of the modulated signal so that signal gets demodulated
int_x = cumsum(m,firstnonsingleton(m))/fs;
xfm = cos(((2*%pi)*fc)*t) .*cos(((2*%pi)*fdev)*int_x)-sin(((2*%pi)*fc)*t) .*sin(((2*%pi)*fdev)*int_x);
xi = cos(((2*%pi)*fdev)*int_x);
xq = sin(((2*%pi)*fdev)*int_x);
t2 = (0:1/fs:(size(xfm,1)-1)/fs)';
t2 = t2(:,ones(1,size(xfm,2)));

xfmq = mtlb_double(hilbert(xfm)) .*exp(((((-%i)*2)*%pi)*fc)*mtlb_double(t2));

demod = (1/((2*%pi)*fdev))*[zeros(1,size(xfmq,2));diff(mtlb_double(unwrap(atan(imag(xfmq),real(xfmq)))),1,firstnonsingleton(mtlb_double(unwrap(atan(imag(xfmq),real(xfmq))))))*fs];

figure(2);
plot(t,m,"r",t2,demod,"b--");
xlabel("time ");
ylabel("amplitude");
legend("Original Signal","Demodulated Signal");
