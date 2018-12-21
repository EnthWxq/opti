function linear_regression()
%% ======================= Part 1: Plotting ======��ȡ���ݲ����ӻ�
data = load('ex1data2.txt');%������������m��ѵ������,n��ѵ������
X = data(:, 1:end); y = data(:, 2);
m = length(y);
n = size(X,2);
%plot(X, y); %���ӻ�����֮�����ع�ϵ
%���ݵ�Ԥ����
mu = mean(X);%��ֵ�ͷ����������
sigma = std(X);
X_norm = (X-repmat(mu,m,1))./repmat(sigma,m,1);
X = [ones(m, 1),X_norm];%������Իع飬Ҫ���һ��

%% =================== Part 2: Cost and Gradient descent ==�ݶ��½�
theta = zeros(n+1,1); % initialize fitting parameters
iterations = 400;% Some gradient descent settings
alpha = 0.01;
% run gradient descent
[theta,J_history] = GradDec(X, y, theta, alpha, iterations);


%% ============= Part 3: Visualizing J(theta_0, theta_1) ===���ӻ���ʧ����
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');



function J = Compute_Cost(X, y, theta)
m = length(y); 
J = sum((X*theta-y).^2)/(2*m);

end

function [theta, J_history] = GradDec(X, y, theta, alpha, num_iters)
m = length(y);
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    theta = theta -(alpha/m)*X'*(X*theta-y);
    J_history(iter) = Compute_Cost(X, y, theta);
end
end

end

