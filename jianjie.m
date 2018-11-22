function [xmin,fmin]= jianjie
%通过调用fminunc
n = 1000;%n元函数
x0 = ones(n,1);%初始值为一个列向量
%1:不提供导数信息 
%options1 = optimoptions('fminunc','Algorithm','quasi-newton');
%[xmin,fmin] = fminunc(@fun,x0,options1);
%2:提供导数信息
options2 = optimoptions('fminunc','Algorithm','quasi-newton','SpecifyObjectiveGradient',true);
[xmin,fmin] = fminunc(@fun,x0,options2);
end

function [f,g] = fun(x)%f是要求解的n维函数 g是提供的导数信息
t = [1:length(x)]';
f = sum(abs(x-t).^2);
g = 2*(x-t);
end