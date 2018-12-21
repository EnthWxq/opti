function linear_regression()
%% ======================= Part 1: Plotting ======读取数据并可视化
data = load('ex1data2.txt');%假设数据中有m个训练样本,n个训练特征
X = data(:, 1:end); y = data(:, 2);
m = length(y);
n = size(X,2);
%plot(X, y); %可视化特征之间的相关关系
%数据的预处理：
mu = mean(X);%均值和方差都是行向量
sigma = std(X);
X_norm = (X-repmat(mu,m,1))./repmat(sigma,m,1);
X = [ones(m, 1),X_norm];%针对线性回归，要多加一列

%% =================== Part 2: Cost and Gradient descent ==梯度下降
theta = zeros(n+1,1); % initialize fitting parameters
iterations = 400;% Some gradient descent settings
alpha = 0.01;
% run gradient descent
[theta,J_history] = GradDec(X, y, theta, alpha, iterations);


%% ============= Part 3: Visualizing J(theta_0, theta_1) ===可视化损失函数
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

