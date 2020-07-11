function A = d_drho(rho,K,R)
A = 1 - ((rho)^(K-R+1)) + (rho-1)*differentiate(rho,K-R+1);

A = A/((1-rho)^2);
end

function B = differentiate(X,N)
if N==0
    B = 0;
    return
elseif N~=0
    B = N*(X^(N-1));
end
end