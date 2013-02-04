%% Part 1

tSPAN = [0 200];
hInit = 3;

[t h] = ode45(@diffeq,tSPAN,hInit);

subplot(2,2,1);
plot(t,h);
title('ODE45 Solution');
xlabel('Time 200');
ylabel('ODE45 Solution');
grid on;

%% Part 2

tSPAN = [0 1000];
hInit = 3;

[t1 h1] = ode45(@diffeq,tSPAN,hInit);

subplot(2,2,2);
plot(t1,h1);
title('ODE45 Solution 2');
xlabel('Time 1000');
ylabel('ODE45 Solution');
grid on;

%% Part 3

h_a = diffeq1(t2)

subplot(2,2,3);
plot(t2,h2,'b',t2,h_a,'ro');
xlabel('Time from ODE45');
ylabel('Solution Values');
legend('ODE45 Solution','Analytical Solution');
grid on;

%% Part 4

subplot(2,2,4)
plot(t2,abs(h_a-h2));
title('Residual Plot')
xlabel('Time');
ylabel('Residual Factor');
grid on;