prt =%f
// x e y são o vetores com os pontos amostais
// u é o vetor com os coeficientes do polinômio
function [u,A]=PolinomioVandermonde(x,y)
    for(k=1:length(x))
        A(:, k)=x.^(k-1)'
    end
    u=EliminacaoGauss(A,y',%f);
endfunction

function Plot_PolinomioVandermonde(x,y)
    [u,A]=PolinomioVandermonde(x,y);
    pv=poly(u,'s','coeff')
    printf("Matriz Aumentada [A|y]")
    disp([A,y'])
    printf("Coeficientes u=A^-1 * y")
    disp(u)
    printf("Polinômio de Vandermonde\npv(s)=")
    disp(pv)
    xi=linspace(min(x),max(x),1000);
    plot(xi,horner_fga(u,xi),'r')
    scatter(x,y)
    xgrid()
    xtitle("Polinômio de Vandermonde");
endfunction

function yp = horner_fga(u, xp)
    N = length(u)
    M = length(xp);
    A = zeros(M, N);
    for i = 1:N
        A(:, i) = xp.^(i-1);
    end
    yp(1,:)=A*u
end

function [b,D]=PolinomioNewton(x,y)
    N=length(x);   //Cálculo dos coeficientes 
    D(:,1)=y';
    for j=2:N  // D(N,N) - Tabela de diferenças
        for k=j:N
            D(k,j)=(D(k,j-1)-D(k-1,j-1))/(x(k)-x(k-j+1));
        end
    end
    b=diag(D)
endfunction

function yp=horner_newton(b,x,xp)
  N=length(b)
  yp=b(N);  
  for k=N-1:-1:1
       yp=yp.*(xp-x(k)) + b(k);
  end
endfunction

function Plot_PolinomioNewton(x,y)
  [u,D]=PolinomioNewton(x,y) 
  N=length(x) 
  printf("Tabela de diferenças") 
  disp(D)
  printf("Coeficientes b=diag(D)")
  disp(u)
  printf("Polinômio de Newton\npn(s)=\n")
  for k=(N-1):-1:1
    printf("(%.5e)",u(N-k+1))
    for(j=N-1:-1:k) printf("(x-(%.5f))",x(N-j)) end
    if (k>1) then printf(" + \n") end
  end 
  xi=linspace(min(x),max(x),1000);
  plot(xi,horner_newton(u,x,xi),'r')
  scatter(x,y)
  xgrid()
  xtitle("Polinômio de Newton")
endfunction

function yp=horner_lagrange(x,y,xp)
  N=length(x)
  M=length(xp)
  L = ones(N,M);
  k=[1:M]'
  for i=[1:N]   
     for j=[1:i-1 i+1:N]
         L(i,k)=L(i,k).*(xp(k)-x(j))/(x(i)-x(j));
     end
  end
  yp=y*L
endfunction

function  Plot_PolinomioLagrange(x,y)
   N=length(x); 
   linha_s = "------------------------------------------------------"
   printf("Polinômio de Lagrange\n")
   for i=1:N
      num_s = ""
      den_s = ""
      for j=[1:i-1 i+1:N]
          num_s=sprintf("%s(x-(%.4f))",num_s,x(j))
              den_s=sprintf("%s(%.4f)",den_s,x(i)-x(j))
      end
      printf("L[%d,%d]=\n\t%s\n(%.4f)%s\n\t%s\n",...
               i-1,N-1,num_s,y(i),linha_s,den_s)
  end 
  printf("pl=")
  for i=1:N-1  printf("y(%d)*L[%d,%d]+",i-1,i-1,N-1) end
  printf("y(%d)*L[%d,%d]\n",N-1,N-1,N-1)
  xp=linspace(min(x),max(x),10000);
  plot(xp,horner_lagrange(x,y,xp),'r')
  scatter(x,y)
  xgrid()
  xtitle("Polinômio de Lagrange");
endfunction

function ps_list=cheby_rec(n)
     s=poly(0,'s'); // Formula de Recorrência
     ps_list(1)=1
     ps_list(2)=s
     for(k=2:n)
        index=k+1
        ps_list(index)=2*s*ps_list(index-1) - ps_list(index-2)
     end
endfunction

// aproxima uma função f por um polinômio ps no intervalo [a,b]
// C são os coeficientes da interpolação
// ps_list são os polinômios de chebychev
function [ps,C,ps_list]=cheby(f,n,a,b)
    teta=%pi/(2*n+2);
    C=zeros(1,n+1);
    for k=1:n+1
        z(k)=cos((2*k-1)*teta);
    end
    x=(b-a)*z/2+(a+b)/2;
    y=f(x);
    for k =1:n+1
        teta_k=(2*k-1)*teta;
        for j=1:n+1
            C(j)=C(j)+y(k)*cos((j-1)*teta_k);
        end
    end
    C=2*C/(n+1);
    C(1)=C(1)/2;
    xp=linspace(a,b,1000)
    plot(xp,f(xp))
    ps_list=cheby_rec(n)
    ps=C*ps_list
    plot(xp,horner(ps,linspace(-1,1,1000)),'r')
endfunction




