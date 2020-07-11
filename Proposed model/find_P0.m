function P0 = find_P0(lambda,mu,R,K)
    P0 = 1;
   T=160;
    for n = 1:R-1
%           P0 = P0 + (((lambda/mu)^n)/factorial(n));
        P0 = P0 + (((lambda/mu)^n)/factorial(n))*(factorial(T)/(factorial(n)*factorial(T-n)));
    end
    for n = R:K
%          P0 = P0 + (((lambda/mu)^n)/((factorial(R)*(R^(n-R)))));
        P0 = P0 + factorial(n)*(((lambda/mu)^n)/((factorial(R))*(R^(n-R))))*(factorial(T)/(factorial(n)*factorial(T-n)));
    end
    P0 = 1/P0;
end