function x_min = suiji()
%��Լ��-���㷨-���ģ��
N = 100;%ģ��Ĵ���
a = 1;b=10;%���������䷶Χ
%����Ҫ�Ż�nԪ����
    n = 3;
    for i = 1:n
    eval(sprintf('x_%d = a+b*rand(1,N)',i));
    end
    %x_Ϊn��N�еľ���nԪ������
    x_ = [];
    for i = 1:n
       eval(sprintf('x_ = [x_;x_%d]',i));
    end
y_ = aimfuc(x_);  %y_��������
x_min = x_(:,1);%��Сֵ��;
y_min = y_(1);%��Сֵ
for i = 1:n
    if(y_(i)<y_min)
        y_min = y_(i);
        x_min = x_(:,i);
    end
end
end

function y = aimfuc(x)
%Ҫ�Ż��ĺ���ΪnԪ������������ʽ������������3Ԫ����Ϊ���� f(x1,x2,x3)=x1^2+x2^2-x3
%y ����һ��������
n = size(x,1);
y = x(1,:).^2+x(2,:).^2-x(3,:);
end

