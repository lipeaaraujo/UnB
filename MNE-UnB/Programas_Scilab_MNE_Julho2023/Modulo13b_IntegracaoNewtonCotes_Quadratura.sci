nc_w=[
[1,     0,      0,     0,      0,      0,      0,      0,      0,     0,      0    ], 
[1,     1,      0,     0,      0,      0,      0,      0,      0,     0,      0    ],
[1,     4,      1,     0,      0,      0,      0,      0,      0,     0,      0    ], 
[1,     3,      3,     1,      0,      0,      0,      0,      0,     0,      0    ], 
[7,     32,     12,    32,     7,      0,      0,      0,      0,     0,      0    ],
[19,    75,     50,    50,     75,     19,     0,      0,      0,     0,      0    ],
[41,    216,    27,    272,    27,     216,    41,     0,      0,     0,      0    ], 
[751,   3577,   1323,  2989,   2989,   1323,   3577,   751,    0,     0,      0    ],  
[989,   5888,  -928,   10496, -4540,   10496, -928,    5888,   989,   0,      0    ],
[2857,  15741,  1080,  19344,  5778,   5778,   19344,  1080,   15741, 2857,   0    ]]

nc_a_num=[1,1,1,3, 2,  5,  1,    7,    4,    9,      5]
nc_a_den=[1,2,3,8,45,288,140,17280,14175,89600, 299376]

function I=NewtonCotes_tab(x,y)
  n=length(x)
  h=x(2)-x(1); //espaçamento
  num=nc_a_num(n);
  den=nc_a_den(n)
  w=nc_w(n,1:n) // [num,den,w]=nc_coeff(n)
  S=y*w'
  I=h*num/den*S
endfunction
 
function Plot_NewtonCotes_tab(x,y)
  n=length(x)
  h=x(2)-x(1); 
  num=nc_a_num(n);
  den=nc_a_den(n)
  w=nc_w(n,1:n) 
  S=y*w'
  I=NewtonCotes_tab(x,y)
  printf("[x y w y*w]")
  disp([x' y' w' (y.*w)'])
  printf("h=%f\nsoma(y*w)=%f\nI=(%f)/(%d/%d)*(%f)\n",...
  h,S,h,nc_a_num(n),nc_a_den(n),S)
  printf("Integal %d pontos = %f\n",n,I)
  u=PolinomioVandermonde(x,y)
  xp=linspace(x(1),x(n),100);
  yp=horner_fga(u,xp)
  for (i=1:100-1)
    xfpoly([xp(i) xp(i) xp(i+1) xp(i+1) xp(i) ],[0 yp(i) yp(i+1) 0 0 ],-4)
  end 
  plot([x(1) x(1)],[0 y(1)],'bk')
  for (i=2:n-1)  plot2d([x(i) x(i)],[0 y(i)],12)  end
  plot([x(n) x(n)],[0 y(n)],'bk')
  xi=linspace(x(1),x(n),1000)
  plot2d(xi,horner_fga(u,xi))
  scatter(x,y)
  dx=(max(x)-min(x))/20
  gca.data_bounds = [min(x)-dx,min([y 0]);max(x)+dx,max([y,0])];
  xgrid()
  xtitle("Integral por Newton Cotes "+string(n)+" pontos="+string(I))
endfunction

function I=NewtonCotes_f(f,a,b,n)
   x=linspace(a,b,n)
   y=f(x)
   I=NewtonCotes_tab(x,y)
endfunction

function Plot_NewtonCotes_f(f,a,b,n)
   x=linspace(a,b,n)
   y=f(x)
   I=NewtonCotes_tab(x,y)
   Plot_NewtonCotes_tab(x,y)
   A=intg(a,b,f) //integral exata
   erro = abs(I-A)/A*100;
   printf("integral exata = %f\nerro=%f%%\n",A,erro)
   t=linspace(a,b,1000)
   plot(t,f(t),'bk','LineWidth',3)
   str=sprintf(...
   "Newton-Cotes %4d pontos = %lf erro=%.3f%%\n",n,I,erro)
   xtitle(str)
endfunction  

function Test_NewtonCotes(f,a,b)
  A=intg(a,b,f)
  printf("Integral Exata = %f\n",A)
  n=[2,3,4,5,6,7,8,9,10]
  dx=(a-b)/10
  for (k=1:9)
    subplot(3,3,k)
    Plot_NewtonCotes_f(f,a,b,n(k))
    y=f(linspace(a,b,n(k)))
  //  gca.data_bounds = [a-dx,min([y 0]);b+dx,max([y,0])];
  end
endfunction

function [num,den,w] = nc_coeff(N)
   n = 0:N-1;
   for(k=1:N)
     A(k,:)=(n.^(k-1))
   end
   if (N==1) b=1
   else      b(n+1)=(N-1)^(n+1)./(n+1); end
   wf = EliminacaoGauss(A,b',%f)
   for i=1:N    w1(i,:)=dec2frac(wf(i),1e-10,%f)  end
   for i=1:N
     w1(i,1)=int(w1(i,1)*max(w1(:,2))/w1(i,2))
     num=gcd(w1(:,1))
     w(i)=int(w1(i,1))/num
     den=max(w1(:,2))
   end
   w=w'
end

function [num,den,w] = nc_tabela(Nc)
    w = zeros(Nc,Nc)
    for (N=1:Nc)
        [num(1,N),den(1,N),w(N,1:N)] = nc_coeff(N)
    end
endfunction

function u_i=polyint_fga(u)
    N=length(u)
    u_i=[0; u./[1:N]']
endfunction

function I=Integral_pol(f,a,b,n)
    x=linspace(a,b,n)
    y=f(x)
    u=PolinomioVandermonde(x,y)
    u_i = polyint_fga(u);
    I = horner_fga(u_i,x(n))-horner_fga(u_i,x(1))
endfunction

function Plot_Integral_pol(f,a,b,n)
    x=linspace(a,b,n)
    y=f(x)
    u=PolinomioVandermonde(x,y)
    u_i = polyint_fga(u);
    I=Integral_pol(f,a,b,n)
    printf("Polinônio ajustado p(x)=")
    disp(poly(u,'s','coeff'))
    printf("Integral analítica P(x)")
    disp(poly(u_i,'s','coeff'))
    printf("Integral Definida=P(%f)-P(%f)=%f\n",x(n),x(1),I);
    N=1000
    xi=linspace(x(1),x(n),N)
    yi=horner_fga(u,xi)
    plot(xi,yi,'bk')
    xfpoly([xi(1) xi xi(N)],[0 yi 0],7)
    scatter(x,y)
    str=sprintf("Integral Polinômio %4d pontos = %lf\n",n,I)
    xtitle(str)
    legend("polinomio","Integral Aprox","pontos de controle",4)
endfunction

gauss_z=[
    [           0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.57735027, 0.57735027,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.77459667,          0, 0.77459667,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.86113631,-0.33998104, 0.33998104, 0.86113634,          0,          0,          0,          0,          0,          0,          0],
    [ -0.90617985,-0.53846931,          0, 0.53846931, 0.90617985,          0,          0,          0,          0,          0,          0],
    [ -0.93246951,-0.66120939,-0.23861918, 0.23861918, 0.66120939, 0.93246951,          0,          0,          0,          0,          0],
    [ -0.94910791,-0.74153119,-0.40584515,          0, 0.40584515, 0.74153119, 0.94910791,          0,          0,          0,          0],
    [ -0.96028986,-0.79666648,-0.52553241,-0.18343464, 0.18343464, 0.52553241, 0.79666648, 0.96028986,          0,          0,          0],
    [ -0.96816024,-0.83603111,-0.61337143,-0.32425342,          0, 0.32425342, 0.61337143, 0.83603111, 0.96816024,          0,          0],
    [ -0.97390653,-0.86506337,-0.67940957,-0.43339539,-0.14887434, 0.14887434, 0.43339539, 0.67940957, 0.86506337, 0.97390653,          0],
    [ -0.97822866,-0.88706250,-0.73015201,-0.51909613,-0.26954316,          0, 0.26954316, 0.51909613, 0.73015201, 0.88706250, 0.97822866]];
    
gauss_w=[
    [          2,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [          1,          1,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ 0.55555555, 0.88888889, 0.55555555,          0,          0,          0,          0,          0,          0,          0,          0],
    [ 0.34785485, 0.65214515, 0.65214515, 0.34785485,          0,          0,          0,          0,          0,          0,          0],
    [ 0.23692689, 0.47862867, 0.56888889, 0.47862867, 0.23692689,          0,          0,          0,          0,          0,          0],
    [ 0.17132449, 0.36076157, 0.46791393, 0.46791393, 0.36076157, 0.17132449,          0,          0,          0,          0,          0],
    [ 0.12948497, 0.27970539, 0.38183005, 0.41795918, 0.38183005, 0.27970539, 0.12948497,          0,          0,          0,          0],
    [ 0.10122854, 0.22238103, 0.31370665, 0.36268378, 0.36268378, 0.31370665, 0.22238103, 0.10122854,          0,          0,          0],
    [ 0.08127439, 0.18064816, 0.26061070, 0.31234708, 0.33023936, 0.31234708, 0.26061070, 0.18064816, 0.08127439,          0,          0],
    [ 0.06667134, 0.14945135, 0.21908636, 0.26926672, 0.29552422, 0.29552422, 0.26926672, 0.21908636, 0.14945135, 0.06667134,          0],
    [ 0.05566857, 0.12558037, 0.18629021, 0.23319376, 0.26280454, 0.27292508, 0.26280454, 0.23319376, 0.18629021, 0.12558037, 0.05566857]];
  
function I=QuadraturaGauss(f,a,b,n)
    z= gauss_z(n,1:n);
    w = gauss_w(n,1:n);
    xi= (b-a)/2*z+(b+a)/2
    yi=f(xi);
    wi = w* (b-a)/2
    I = yi*wi'
endfunction
    
function Plot_QuadraturaGauss(f,a,b,n)
    z= gauss_z(n,1:n);
    w = gauss_w(n,1:n);
    xi= (b-a)/2*z+(b+a)/2
    yi=f(xi);
    wi = w* (b-a)/2
    I=QuadraturaGauss(f,a,b,n)
    A=intg(a,b,f);
    printf("[z  xi w  wi  yi]")
    disp([z' xi'  w' wi' yi'])
    printf("I=soma(yi * wi)\n");
    printf("integral exata = %f\n",A)
    printf("Integral %d pontos = %f\nerro=%.1e%%\n"...
            ,n,I,abs(I-A)/A*100)
    scatter(xi,yi)
    str=sprintf("Integral %d pontos = %f erro=%.1e%%\n"...
            ,n,I,abs(I-A)/A*100)
    xtitle(str);
    xp=linspace(a,b,1000)
    plot(xp,f(xp));
endfunction


//Atoms módulo Ortpol
//ps=legendre_poly(n)
function [ps,ps_list]=legendre_rec(n)
     s=poly(0,'s'); // Formula de Recorrência
     ps_list(1)=1
     ps_list(2)=s
     for(k=2:n+1)
        index=k+1
        ps_list(index)=[(2*k-1)*s*ps_list(index-1) - (k-1)*ps_list(index-2)]/(k)
     end
     ps=ps_list(n+1)
endfunction

function Plot_Legendre()
    t=linspace(-1,1,200)
    [ps, ps_list] = legendre_rec(10)
    for k=0:10
        subplot(4,3,k+1)
        plot2d(t,horner(ps_list(k+1),t),modulo(k,6)+1);
        xgrid()
        xtitle("legendre n="+string(k))
        subplot(4,3,12)
        plot2d(t,horner(ps_list(k+1),t),modulo(k,6)+1);
        xgrid()
    end
endfunction

function [z,w]=raizesLegendre(n)
    ps=legendre_rec(n)
    teta=%pi*(n-(1:n)'+3/4)./(n+1/2)//Francesco Tricomi 
    z=(1-1/(8*n^2)+1/(8*n^3))*cos(teta)//- primeira estimativa raiz
    erro=1
    for (i=1:200) //Newton-Raphson para encontrar raizes z
        z0=z;
        fz=horner(ps,z)
        dfz=horner(derivat(ps),z)
        z=z0-fz./dfz;
        // disp(z)
        erro = norm(z-z0)/norm(z)
        if (erro<1e-16) break; end;
    end
    w=(2)./((1-z.^2).*dfz.^2); //pesos
endfunction  

function [z,w] = Plot_Tabela_Quadratura(Nc)
    w = zeros(Nc,Nc)
    z = zeros(Nc,Nc)
    for (N=1:Nc)
        [z(N,1:N),w(N,1:N)] = raizesLegendre(N)
    end
endfunction

function [fz,dfz]=legendre_itr_vector(n,z)
    fzm1=ones(1:n)'
    fz = z 
    for k=2:n
       fzm2 = fzm1
       fzm1 = fz
       fz=[ (2*k-1)*z.*fzm1-(k-1)*fzm2 ] / k;
    end
    dfz=[n*z.*fz-n*fzm1]./(z.^2-1)
endfunction

//Atoms módulo Ortpol
function [z,w]=raizesLegendre_vector(n)
    teta=%pi*(n-(1:n)'+3/4)./(n+1/2)//Francesco Tricomi 
    z=(1-1/(8*n^2)+1/(8*n^3))*cos(teta)//- primeira estimativa raiz
    erro=1
    for (i=1:200) //Newton-Raphson para encontrar raizes z
        z0=z;
        [fz,dfz]=legendre_itr_vector(n,z)
        z=z0-fz./dfz;
        erro = norm(z-z0)/norm(z)
        if (erro<1e-16) break; end;
    end
    w=(2)./((1-z.^2).*dfz.^2); //pesos
endfunction 

function I=QuadraturaGauss2(f,a,b,n)
   [z,w]=raizesLegendre_vector(n)
    xi= (b-a)/2*z'+(b+a)/2
    yi=f(xi);
    wi = w'* (b-a)/2
    I = yi*wi'
endfunction

function Plot_QuadraturaGauss2(f,a,b,n)
   [z,w]=raizesLegendre_vector(n)
    xi= (b-a)/2*z'+(b+a)/2
    yi=f(xi);
    wi = w'* (b-a)/2
    I=QuadraturaGauss2(f,a,b,n)
    I2=intg(a,b,f);
    
    printf("[xi yi wi y*wi]")
    disp([xi'  yi' wi' (wi.*yi)'])
    printf("   I=soma(yi * wi)\n");
    printf("integral exata = %f\n",I2);
    printf("Integral %d pontos = %f\nerro=%.1e%%\n",...
          n,I,abs(I-I2)/I2*100)
    scatter(xi,yi)
    str=sprintf("Integral %d pontos = %f erro=%.1e%%\n",...
        n,I,abs(I-I2)/I2*100)
    xtitle(str)
    xp=linspace(a,b,1000)
    plot(xp,f(xp));
endfunction
  
function Test_QuadraturaGauss(f,a,b)
    I2=intg(a,b,f);
    printf("integral exata = %f\n",I2)
    n=[3,4,5,6,7,8,9,10,11,15,20,25]
    for k=1:12
        subplot(4,3,k)
        I=QuadraturaGauss2(f,a,b,n(k))
        Plot_QuadraturaGauss2(f,a,b,n(k))
        printf("Quadratura Gauss %4d pontos = %f erro=%.1e%%\n",...
        n(k),I,abs(I-I2)/I2*100)
    end
endfunction  

function I=MonteCarlo(f,a,b,n)
    x = a + (b - a) * rand(n,1);
    I = mean(f(x)) * (b - a);
    I2=intg(a,b,f);
    printf("integral exata = %f\n",I2);
    printf("Integral %d pontos = %f\nerro=%.1e%%\n",...
          n,I,abs(I-I2)/I2*100)
endfunction


