function zhijie()
%ֱ�ӷ� ����fminsearch():�����⵼����Nelder-Mead�����η�
fun = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;%�˴�����Ҫ��ĺ�����
x0 = [2;2];
x1 = fminsearch(fun,x0);