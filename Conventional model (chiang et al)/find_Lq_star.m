function Lq_star = find_Lq_star(P0,lambda_m,mu,R,rho,K)
Lq_star = P0*((lambda_m/mu)^R)/factorial(R);
Lq_star = Lq_star*rho;
Lq_star = Lq_star*d_rho(rho,K-R+1);
end


function answer = d_rho(rho,n)
answer = (1-rho^n)/((1-rho)^2);
answer = answer + (-1*d_rho_n(rho,n)/(1-rho));
end

function answer = d_rho_n(rho,n)
if n~=0
    answer = n*rho^(n-1);
else
    answer = 0;
end
end