// x e y são o vetores com os pontos amostais
// u é o vetor com os coeficientes do polinômio
function [u,A]=PolinomioMQ(x,y,ordem)
    for(k=1:ordem+1)
        A(:, k)=x.^(k-1)'
    end
    u=EliminacaoGauss((A'*A),(A'*y'),%f);
endfunction

function Plot_PolinomioMQ(x,y,ordem)
    [u,A]=PolinomioMQ(x,y,ordem)
    printf("Matriz Aumentada [(A''A)|(A''y))]")
    disp([(A'*A) , (A'*y')])
    printf("Coeficientes u=inv(A''A)*(A''y))")
    disp(u)
    printf("Polinômio Mínimos Quadradros ordem %d",ordem);
    St = sum( (y-mean(y))^2 ); //goodness of fitness
    Sr = sum( (y'-A*u)^2 );
    r2= abs(St-Sr)/St
    str=sprintf("MQ r2=%.1f%%\t r=%.2f\n",r2*100,sqrt(r2));
    disp(str)
    pm=poly(u,'s','coeff')
    disp(pm)
    xp=linspace(min(x),max(x),1000);
    yp=horner_fga(u,xp)
    plot(xp,yp,'b')
    scatter(x,y)
    xtitle(str);
endfunction
// x=[3,3.3,3.9,4.3,4.7,5.3,5.9,6.1,6.3,6.6,7];
// y=[0,2,1,5,5,8,9,13,14,20,22];
//x=[0,1,1.5,3,3.2,4,5.5,6.4,7.8,9.9];
//y=[2.3,2.9,4.1,6.1,6.8,8.2,14.6,17.3,30.0,70.3];
//x=[0.1 0.12 0.15 0.19 0.25 0.39 0.59 0.62 0.82 1.5 2.6 4.2 5.9 6.9 8.5 9];
//y=[0.5 0.6 0.75 0.81 1.3 1.6 2.4 2.35 2.95 4.1 5.8 6.4 7.7 7.6 8.25 8.3];


