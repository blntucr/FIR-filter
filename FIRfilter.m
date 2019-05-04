
%first you need to export coefficients from filter design fdatool (FIR)
freqz(Num);


%first you need to export coefficients from filter design fdatool (IIR)
b=[0.04, 0.2, 0.4, 0.2, 0.04]; %b from cahpter 6
freqz(b,Num2); 



syms z;
Hz = (9 + 6/(z) + 7/(z^2) + 8/(z^3) + 9/(z^4) + 9/(z^5) + 9/(z^6) + 8/(z^7) + 7/(z^8) + 6/(z^9) + 9/(z^10))/100;
z = exp(j*2*pi*44100);
Hzcoeff = [9 6 7 8 9 9 9 8 7 6 9]/100;
y = chirp(Hzcoeff,-pi,44100,pi); %sweep -pi to pi with 44100 hertz
subplot(2,1,1);plot(abs(y)); %magnitude of freq response
subplot(2,1,2);plot(angle(y)); %phase response


Hz1 = [-0.1 -0.08 -0.1 -0.11 -0.88 -0.11 -0.1 -0.08 -0.1]; %filter1 coeff
freqz(Hz1);


Hz2 = [0.02/1 0.1/-1.58 0.14/1.74 0.1/-1.01 0.03/0.31]; %filter2 coeff
freqz(Hz2);


Hz1 = [-0.1 -0.08 -0.1 -0.11 -0.88 -0.11 -0.1 -0.08 -0.1]; %filter1
Hz2 = [0.02/1 0.1/-1.58 0.14/1.74 0.1/-1.01 0.03/0.31]; %filter2
a = freqz(Hz1); 
b = freqz(Hz2);
c = a.*b; %resultant filter of series connected filter
freqz(c);


