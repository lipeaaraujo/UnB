prt = %f
// x e y são o vetores com os pontos amostais
// u é o vetor com os coeficientes dos polinômios
 function [u,A,b]=SplineLinear(x,y) 
    s=poly(0,'s');
    N=length(x)-1 // # de intervalos 
    b   =   zeros(2*N,1);
    A   =   zeros(2*N,2*N);
    index=1; //x(index),y(index)
    col=1;  // A(lin,col)
    //2N equações: funções passam por (xi,yi))
    for lin=1:2:2*N-1 
       A(lin:lin+1,col:col+1)= [[x(index)   1];
                                 [x(index+1) 1]]  
       b(lin:lin+1)=  [y(index);
                        y(index+1)] ;
       index=index+1;
       col=col+2;
    end
    u=EliminacaoGaussJordan(A,b)
 endfunction
 
function yp=horner_splinear(u,x,xp)
  s=poly(0,'s');
  yp=xp*%nan;
  for (i=1:length(x)-1)  
    index = find(xp>=x(i) & xp<=x(i+1));
    yp(index)=horner_fga([u(2*i);u(2*i-1)],xp(index))
  end  
endfunction
 
function Plot_SplineLinear(x,y)
    [u,A,b]=SplineLinear(x,y);
    for (i=1:length(x)-1)
      ps(i) = poly([u(2*i),u(2*i-1)],"s","coeff")
    end
    printf("Matriz Aumentada [A|b]")
    disp([A b]) // u = inv(A)*b
    disp(ps)
    N=length(x)-1 // # de intervalos
    xp=linspace(min(x),max(x),10000);
    plot(xp,horner_splinear(u,x,xp));
    scatter(x,y)
    xtitle("Interpolação Splines "+string(N)+" intervalos");   
endfunction

 function [u,A,b]=SplineQuadratica(x,y) 
     N=length(x)-1  // # de intervalos 
     b   =   zeros(3*N,1);
     A   =   zeros(3*N,3*N);
     index=1; //x(index),y(index)
     col=1; // A(lin,col)
     A(1,1)=1; // 1a equação a1=0 
     for lin=2:2:2*N   //2N equações: funções passam por (xi,yi))
        A(lin:lin+1,col:col+2)= [[x(index)^2   x(index)   1];
                                 [x(index+1)^2 x(index+1) 1]]  
        b(lin:lin+1)=  [y(index);
                        y(index+1)] ;
        index=index+1;
        col=col+3;
     end
     col=1;
     index=2;
     for lin=2*N+2:3*N //N-1 equações-1a derivadas pontos internos
        A(lin,col:col+5)=   [2*x(index) 1 0 -2*x(index) -1 0];
        index=index+1;
        col=col+3;
     end
     u=EliminacaoGaussJordan(A,b)
 endfunction
 
 function yp=horner_spquadratica(u,x,xp)
   s=poly(0,'s');
   yp=xp*%nan;
   for (i=1:length(x)-1)  
      index = find(xp>=x(i) & xp<=x(i+1));
      yp(index)=horner_fga([u(3*i);u(3*i-1);u(3*i-2)],xp(index))
   end  
endfunction
 
 function Plot_SplineQuadratica(x,y)
     [u,A,b]=SplineQuadratica(x,y);
     for (i=1:length(x)-1)
        ps(i) = poly([u(3*i),u(3*i-1),u(3*i-2)],"s","coeff")
     end
      printf("Matriz Aumentada [A|b]")
      disp([A b]) // u = inv(A)*b
      disp(ps)
      N=length(x)-1 // # de intervalos
      xp=linspace(min(x),max(x),10000);
      plot(xp,horner_spquadratica(u,x,xp));
      scatter(x,y)
     xtitle("Interpolação Splines "+string(N)+" intervalos");   
 endfunction
 
 function [u,A,b]=SplineCubica(x,y) 
     s=poly(0,'s');
     N=length(x)-1  // # de intervalos 
     b   =   zeros(4*N,1);
     A   =   zeros(4*N,4*N);
     index=1; //x(index),y(index)
     col=1;
     for lin=1:2:2*N-1    //2N equações: funções passam por (xi,yi))
        A(lin:lin+1,col:col+3)= [[x(index)^3   x(index)^2   x(index)   1];
                                 [x(index+1)^3 x(index+1)^2 x(index+1) 1]]  
        b(lin:lin+1)=  [y(index);
                        y(index+1)] ;
        index=index+1;
        col=col+4;
     end
     col=1;
     index=2;
     for lin=2*N+1:3*N-1   // N-1 equações - 1a derivadas pontos internos 
        A(lin,col:col+7)=[3*x(index)^2  2*x(index) 1 0 -3*x(index)^2 -2*x(index) -1 0];
        index=index+1;
        col=col+4;
     end
     col=1;
     index=1;
     A(3*N,col:col+3)=   [6*x(index)   2  0 0]; //2a derivada ponto externo 
     index=index+1;
     for lin=3*N+1:4*N-1   // N-1 equações - 2a derivadas pontos internos 
        A(lin,col:col+7)=   [6*x(index)   2  0 0 -6*x(index) -2 0 0];
        index=index+1;
        col=col+4;
     end
     A(4*N,col:col+3)=   [6*x(index)   2  0 0];//2a derivada ponto externo 
     u=EliminacaoGaussJordan(A,b)
 endfunction
 
 function yp=horner_spcubica(u,x,xp)
   s=poly(0,'s');
   yp=xp*%nan;
   for (i=1:length(x)-1)  
      index = find(xp>=x(i) & xp<=x(i+1));
      yp(index)=horner_fga([u(4*i);u(4*i-1);u(4*i-2);u(4*i-3)],xp(index))
   end  
endfunction
 
function Plot_SplineCubica(x,y)  
      [u,A,b]=SplineCubica(x,y); 
      for (i=1:length(x)-1)
         ps(i) = poly([u(4*i),u(4*i-1),u(4*i-2),u(4*i-3)],"s","coeff")
      end
      printf("Matriz Aumentada [A|b]")
      disp([A b]) // u = inv(A)*b
      disp(ps)
      N=length(x)-1 // # de intervalos
      xp=linspace(min(x),max(x),10000);
      plot(xp,horner_spcubica(u,x,xp));
      scatter(x,y)
      xtitle("Interpolação Splines "+string(N)+" intervalos");   
 endfunction

function [a,b,c,d]=SplineNatural(x,y)
   N=length(x)-1 // # de intervalos
   h  =diff(x);
   dy =diff(y)./h;
   dl=h(2:N-1);
   dp=[2*(h(1:N-1)+h(2:N))];
   du=h(2:N-1);
   r=3*diff(dy)
   c=[0 tridiagonal(dl,dp,du,r) 0]';
   a=y';
   for (k=1:N)
     b(k)= dy(k)-h(k)*(2*c(k)+c(k+1))/3;
     d(k)= (c(k+1)-c(k))/(3*h(k));
   end
 endfunction

function yp=horner_spline(a,b,c,d,x,xp)
 s=poly(0,'s');
 yp=xp*%nan;
 for (i=1:length(x)-1)
   index = find(xp>=x(i) & xp<=x(i+1));
   yp(index)=horner_fga([a(i);b(i);c(i);d(i)],(xp(index)-x(i)))
 end  
endfunction 

function Plot_SplineNatural(x,y)
   [a,b,c,d]=SplineNatural(x,y)
   N=length(x)-1 // # de intervalos
   h  =diff(x);
   dy =diff(y)./h;
   dl=h(2:N-1);
   dp=[2*(h(1:N-1)+h(2:N))];
   du=h(2:N-1);
   r=3*diff(dy)
   printf("[x h y dy r]");
   disp([x',[diff(x) %nan]',y',[diff(y)./diff(x) %nan]',...
           [%nan r %nan ]',[%nan dp %nan]' ]);
   printf("Sistema Tridiagonal [dl dp du | r = c]");
   disp([diag(dp)+diag(du,1)+diag(dl,-1) r' c(2:N)]);
   printf("Matriz de Soluções [a b c d]");
   disp([a(1:N),b,c(1:N),d])
   printf("Splines Natural\n");
   for(i=1:N)
   printf("%.3f+(%.3f)(x-%.3f)+(%.3f)(x-%.3f)^2+(%.3f)(x-%.3f)^3\n",...
           a(i),b(i),x(i),c(i),x(i),d(i),x(i))
   end
   xp=linspace(min(x),max(x),10000);
   plot(xp,horner_spline(a,b,c,d,x,xp));
   scatter(x,y);
   xtitle("Interpolação Splines "+string(N)+" intervalos");   
 endfunction
 
function [a, b, c, d, c] = SplineNotAKnot(x, y, dy_0, dy_n)
   N = length(x) - 1; // Number of intervals
   h = diff(x);
   dy = diff(y) ./ h;
   dl = h(2:N-1);
   dp = 2 * (h(1:N-1) + h(2:N));
   r = 3 * diff(dy);
   du = h(2:N-1);

   // Adjusting the first and last elements of dp and r
   dp(1) = dp(1) - h(1) / 2;
   dp(N-1) = dp(N-1) - h(N) / 2;
   r(1) = r(1) - 3/2 * (dy(1) - dy_0);
   r(N-1) = r(N-1) - 3/2 * (dy_n - dy(N));

   // Apply not-a-knot condition
   dp = [h(2)/(h(1)+h(2)), dp, h(N-1)/(h(N-1)+h(N))];
   r = [-h(2) * r(1) / (h(1) + h(2)), r, -h(N-1) * r(N-1) / (h(N-1) + h(N))];

   c = [0 tridiagonal(dl, dp, du, r)]';

   // Adjusting the first and last elements of c
   c(1) = 3/2 * (dy(1) - dy_0) / h(1) - c(2) / 2;
   c(N+1) = 3/2 * (dy_n - dy(N)) / h(N) - c(N) / 2;

   a = y';
   for k = 1:N
     b(k) = dy(k) - h(k) * (2 * c(k) + c(k+1)) / 3;
     d(k) = (c(k+1) - c(k)) / (3 * h(k));
   end
endfunction
 
function [a,b,c,d,c]=SplineClamped(x,y,dy_0,dy_n)
   N=length(x)-1 // # de intervalos
   h=diff(x);
   dy=diff(y)./h;
   dl=h(2:N-1);
   dp=2*(h(1:N-1)+h(2:N));
   r=3*diff(dy);
   du=h(2:N-1);
    dp(1)  =dp(1)  -h(1)/2;
    dp(N-1)=dp(N-1)-h(N)/2;
    r(1)  =r(1)  -3/2*(dy(1)-dy_0);
    r(N-1)=r(N-1)-3/2*(dy_n -dy(N));
   c=[0 tridiagonal(dl,dp,du,r)]'
    c(1)  =3/2*(dy(1)-dy_0) /h(1)-c(2)/2;
    c(N+1)=3/2*(dy_n -dy(N))/h(N)-c(N)/2;
   a=y';
   for k=1:N
     b(k)= dy(k)-h(k)*(2*c(k)+c(k+1))/3;
     d(k)= (c(k+1)-c(k))/(3*h(k));
   end    
 endfunction
 
 function [a,b,c,d]=SplineClamped_old(x,y,dy_0,dy_n)
   n=length(x)-1
   h=diff(x)
   r(1) = 3.0*(y(2) - y(1))/h(1)-3.0*dy_0;
   dl(1)= 2.0*h(1);
   dp(1)= r(1)/dl(1);
   du(1)= 0.5;
   for i = 2:n
      r(i) = 3.0*(y(i+1)*h(i-1)-y(i)*(x(i+1)-x(i-1))+y(i-1)*h(i))/(h(i)*h(i-1));  
      dl(i)= 2.0*(x(i+1)-x(i-1))-h(i-1)*du(i-1);
      dp(i)= (r(i)-h(i-1)*dp(i-1))/dl(i);
      du(i)= h(i)/dl(i);
   end
   r(n+1) = 3.0*dy_n-3.0*(y(n+1)-y(n))/h(n);
   dl(n+1)= h(n)*(2.0-du(n));
   dp(n+1)= (r(n+1)-h(n)*dp(n))/dl(n+1);
   a=y'
   c(n+1) = dp(n+1);
   for i = n:-1:1
      c(i)= dp(i)-du(i)*c(i+1);
      b(i)= (a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2.0*c(i))/3.0;
      d(i)= (c(i+1)-c(i))/(3.0*h(i));
   end 
 endfunction

//pontos equiespaçados
function yp=InterpolacaoShannon(xp,x, y)
    n = length(x);
    yp = xp*0;
    T=x(2) - x(1)
    for i = 1:n
        yp = yp + y(i) * sinc(%pi/T*(xp-x(i)));
    end
    index = find(xp<min(x)|xp>max(x))
    yp(index)=%nan
    plot(xp,yp,'r')
    scatter(x,y)
end
