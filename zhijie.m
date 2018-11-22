function zhijie()
%直接法 调用fminsearch():基于免导数的Nelder-Mead单纯形法
fun = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;%此处输入要求的函数；
x0 = [2;2];
x1 = fminsearch(fun,x0);