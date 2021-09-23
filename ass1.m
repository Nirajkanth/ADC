% Assignment 01 
t = 0:10e-6:10e-3;
f = 400;
A = 1;
figure(1);
y = A*cos(2*pi*f*t);
plot(t,y);
xlabel("time(t)(ms)");
ylabel("Amplitude(A)"); 
title("y(t)");

fnq = 400*2;
n = 0:1/fnq:10e-3;
figure(2);
stem(n, cos(2*pi*f*n));
title("Sampled at Nyquist frequency");
figure;
n1 = 0:1/(2*fnq):10e-3;
n2 = 0:2/fnq:10e-3;
subplot(3,1,1); stem(n,cos(2*pi*f*n)); title("Sampled at fnq");
subplot(3,1,2); stem(n1,cos(2*pi*f*n1)); title("Sampled at 2fnq");
subplot(3,1,3); stem(n2,cos(2*pi*f*n2)); title("Sampled at fnq/2");

n_vec = 0:1/(8*fnq):10e-3;
samples = A*cos(2*pi*f*n_vec);
L = 16; 
figure;
stem(n_vec, samples);
range = [1,-1]; % positive and negative peak
q_values_1 = Quantized_value(samples, L, range);

L1 = L*2;
q_values_2 = Quantized_value(samples, L1, range);

L2 = L/2;
q_values_3 = Quantized_value(samples, L2, range);

figure;
stem(n_vec, q_values_1); title("L no.of quantized levels");
figure;
stem(n_vec, q_values_2); title("L*2 no.of quantized levels");
figure;
stem(n_vec, q_values_3); title("L/2 no.of quantized levels");



