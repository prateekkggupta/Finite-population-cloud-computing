 % using conventional methods
clear
lambda = 100;
T=160;
Ur = 0.005;
Ub = 0.00;
R = 20;
C = [20,30,200,60,50,10,5,5];
mu = 8;
beta = (T/16);
for i= 1:length(mu) 
    i;
    for j = 1:length(beta)
        % Defination of K
        K = beta+R;
        % equation 5 
        P0 = find_P0(lambda,mu(i),R,K);
        % equation 6
        Lq = find_Lq(lambda,mu(i),R,K,P0);
        % equation 8
        Pb = Lq*Ub;
        % equation 9
        lambda_b = lambda*Pb;
        % equation 10
        Pk = P0*(((lambda-lambda_b)/mu(i))^K)/(factorial(R)*(R^(K-R)));
        % equation 11
        lambda_k = (lambda-lambda_b)*Pk;
        % equation 12
        lambda_m = lambda - lambda_b - lambda_k;
        % equation 5 with lambda = lambda_m
        P0_star = find_P0(lambda_m,mu(i),R,K);
        % equation 13 intext
        rho_star = lambda_m/(mu(i)*R);
        % equation 13
        Lq_star = find_Lq(lambda_m,mu(i),R,K,P0_star);
        % equation1 15
        Wq_star = Lq_star/lambda_m;
        %equation 17
        Pr = Ur*Wq_star;
        % equation 18
        lambda_r = Pr*lambda_m;
        % equation 19
        lambda_f = lambda-lambda_b-lambda_k-lambda_r; 
        Pl(i,j) = (lambda-lambda_f)/lambda;
        rho_f = (lambda_m-lambda_r)/(R*mu(i));
        Ls_star = Lq_star+(lambda_m/(R*mu(i)));
        Ws_star = Ls_star/lambda_m;
        cost_component = [R*C(1)/rho_f , mu(i)*C(2)/rho_f , beta(j)*C(3) , (lambda_r+lambda_b+lambda_k)*C(4) , lambda_r*C(5) , Pk*C(6) , Ls_star*C(7), Ws_star*C(8)];
        cost_noted(i,j)= (R*C(1)+mu(i)*C(2))/rho_f + beta(j)*C(3) + (lambda_r+lambda_b+lambda_k)*C(4) + lambda_r*C(5) + Pk*C(6) + Ls_star*C(7)+ Ws_star*C(8);
        Lq_noted(i,j)=Lq_star;
        P0_noted(i,j) = P0;
        Ls_star_noted(i,j) = Ls_star;
        Wq_star_noted(i,j) = Wq_star;
        Ws_star_noted(i,j) = Ws_star;
        lambda_f_noted(i,j) = lambda_f;
        Pk_noted(i,j) = Pk;
        Pr_noted(i,j) = Pr;
        lambda_m_noted(i,1) = lambda_m;
    end
end
cost_noted
cost_component = cost_component';
% surf(beta,mu,cost_noted)
% ylabel('\mu')
% xlabel('\beta')
% title('cost under various \mu and \beta')
% zlabel('Cost')

