%% Class 4 - Problem 2
clc

% Main function
f = @(x) x*exp(-2*x);
%Derivatives 
df = @(x) (1-2*x)*exp(-2*x);
ddf = @(x) 4*exp(-2*x)*(x-1);
a = 1.5; ddfa=ddf(a);

for k=1:10
    h(k) = 2^(-k);
    CDF(k)=(f(a+h(k)) - 2*f(a) + f(a-h(k))) / (h(k)^2);
    CDFF(k) = (-f(a+2*h(k))+ 16*f(a+h(k))-30*f(a)+ 16*f(a-h(k)) - f(a-2*h(k))) / (12*h(k)^2);
    %The error in CDF
    ECDF(k) = abs(CDF(k) - ddfa);
    ECDFF(k) = abs(CDFF(k) - ddfa);
end

loglog(h,ECDF, '-b')
hold on
loglog(h,h.^2, '--b')
hold on
loglog(h,ECDFF, '-r')
hold on
%The order to the formula now are from h to the power of 4
loglog(h,h.^4, '--r')
hold on
%%




