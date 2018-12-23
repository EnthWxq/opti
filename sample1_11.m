N = 300;
n = (0:N-1)'; % n : discrete-time index
w = 5;
n1 = 70;
n2 = 130;
x = 2.1 * exp(-0.5*((n-n1)/w).^2) - 0.5*exp(-0.5*((n-n2)/w).^2).*(n2 - n); % x : input signal                                                   
figure(1)
subplot(2,2,1)
plot(x)
title('Input signal');
YL = [-2 3];
ylim(YL);

h = [1 1 1]/3;
H=1/3*eye(N)+ 1/3*circshift(eye(N),1)+ 1/3*circshift(eye(N),-1);
 
y=H*x;
yn = y + 0.2 * randn(N, 1);   
figure(1)
subplot(2, 2, 2)
plot(yn);
ylim(YL);
title('Output signal (noisy)');
 
xhat=H'*H\(H'*y); %  H is singular
figure(1)
subplot(2,2,3),plot(xhat)
lambda=sort(abs(eig(H'*H)),'descend');
figure,plot(lambda)
xhat(1:10)

lam = 0.1;
xhat = (H'*H + lam * eye(N)) \ (H' * y);
figure(1),
subplot(2, 2, 4)
plot(xhat);
YL2 = [-2 3];
ylim(YL);
title('Estimated signal');

