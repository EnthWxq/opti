function [xmin,fmin]= jianjie
%ͨ������fminunc
n = 1000;%nԪ����
x0 = ones(n,1);%��ʼֵΪһ��������
%1:���ṩ������Ϣ 
%options1 = optimoptions('fminunc','Algorithm','quasi-newton');
%[xmin,fmin] = fminunc(@fun,x0,options1);
%2:�ṩ������Ϣ
options2 = optimoptions('fminunc','Algorithm','quasi-newton','SpecifyObjectiveGradient',true);
[xmin,fmin] = fminunc(@fun,x0,options2);
end

function [f,g] = fun(x)%f��Ҫ����nά���� g���ṩ�ĵ�����Ϣ
t = [1:length(x)]';
f = sum(abs(x-t).^2);
g = 2*(x-t);
end