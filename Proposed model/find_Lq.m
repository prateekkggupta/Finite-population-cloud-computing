function Lq = find_Lq(lambda,mu,R,K,P0)
    Lq = 0;
    for n = (R+1):K
        Pn = find_Pn(lambda,mu,R,K,P0,n);
        Lq = Lq+ (n-R)*Pn; 
    end
end

function Pn = find_Pn(lambda,mu,R,K,P0,n)
    T=160;
    if n<=R-1 && n>=1 
%          Pn = (P0*((lambda/mu)^n)*factorial(n));
        Pn = (P0*((lambda/mu)^n)*factorial(n))*(factorial(T)/(factorial(n)*factorial(T-n)));
    elseif R<=n && n<=K
%          Pn = P0*((lambda/mu)^n)/(factorial(R)*(R^(n-R)));
        Pn = (P0*((lambda/mu)^n)/(factorial(R)*(R^(n-R))))*((factorial(T)/factorial(T-n)));
    end
end