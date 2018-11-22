function x_min = suiji()
%无约束-撒点法-随机模拟
N = 100;%模拟的次数
a = 1;b=10;%变量的区间范围
%假设要优化n元函数
    n = 3;
    for i = 1:n
    eval(sprintf('x_%d = a+b*rand(1,N)',i));
    end
    %x_为n行N列的矩阵，n元列向量
    x_ = [];
    for i = 1:n
       eval(sprintf('x_ = [x_;x_%d]',i));
    end
y_ = aimfuc(x_);  %y_是行向量
x_min = x_(:,1);%极小值点;
y_min = y_(1);%极小值
for i = 1:n
    if(y_(i)<y_min)
        y_min = y_(i);
        x_min = x_(:,i);
    end
end
end

function y = aimfuc(x)
%要优化的函数为n元函数（标量形式给出）这里以3元函数为例子 f(x1,x2,x3)=x1^2+x2^2-x3
%y 返回一个行向量
n = size(x,1);
y = x(1,:).^2+x(2,:).^2-x(3,:);
end

