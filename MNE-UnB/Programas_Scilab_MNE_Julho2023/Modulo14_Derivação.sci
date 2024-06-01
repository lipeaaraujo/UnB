function y1=df1_fw(y,h)
     y1= (y(2:$)-y(1:$-1))./h
     y1=[y1 y1($)]
endfunction

function y1=df1_bk(y,h)
     y1=(y(2:$)-y(1:$-1))./h
     y1=[y1(1) y1]
endfunction

function y1=df1_c(y,h)
     y1=(y(3:$)-y(1:$-2))./(2*h)
     y1=[(y(2)-y(1))/h  y1  (y($)-y($-1))/h ]
endfunction

function y2=df2_c(y,h)
     y2=(y(3:$)-2*y(2:$-1)+y(1:$-2))./h^2
     y2=[y2(1) y2  y2($)]
endfunction


function plot_derivada1(f,a,b,h)
    x=[a:h:b]
    N=length(x)
    y=f(x)
    y1_fw=df1_fw(y,h);
    y1_bk=df1_bk(y,h);
    y1_c =df1_c(y,h);
   subplot(211)  
    plot(x,y)
    scatter(x,y)
    legend("f(x)",2);
   subplot(212)
    str=sprintf("h=%.2f  N=%d pontos",h,N)
    xtitle(str)
    plot(x,y1_fw,'b')
    plot(x,y1_c,'bk')
    plot(x,y1_bk,'r')
    legend("f ''(x) adiantada","f ''(x) centrada",...
    "f ''(x) atrasada",2)  
endfunction

function plot_derivada1c(f,a,b,h)
    x=[a:h:b]
    N=length(x)
    y=feval(x,f)
    y1=df1_c(y,h);
    str=sprintf("h=%.2f",h)
    xtitle(str)
    plot(x,y1,'r')
    legend("f ''(x) centrada",2)  
endfunction

function plot_derivada2(f,a,b,h)
    x=[a:h:b]
    N=length(x)
   subplot(211)  
    y=feval(x,f)
    plot(x,y)
    scatter(x,y)
    legend("f(x)",2);
   subplot(212)
    y2_c=df2_c(y,h);
    str=sprintf("h=%.2f  N=%d pontos",h,N)
    xtitle(str)
    plot(x,y2_c,'r') 
    legend("f ''''(x) centrada",3)  
endfunction

function u_d=derivat_fga(u)
    N=length(u)
    u_d=u(2:N).*[1:N-1]';
endfunction

function ps1=derivat_fga2(ps)
    a = coeff(ps)
    N=length(a)
    ps1=(a(2:N).*[1:N-1])*(s^[0:N-2])'
endfunction

function u_i=polyint_fga(u)
    N=length(u)
    u_i=[0; u./[1:N]']
endfunction

function [u_d,u_d2,u]=derivada_pol(f,a,b,h)
    x=[a:h:b]
    y=feval(x,f)
    n=length(x)
    ordem=n-1;
    if (n<=8) then
       u=PolinomioVandermonde(x,y)
    else
       ordem=7
       u=PolinomioMQ(x,y,ordem)
    end
    u_d = derivat_fga(u)
    u_d2 = derivat_fga(u_d)
endfunction

function Plot_derivada_pol(f,a,b,h)
    x=[a:h:b]
    y=feval(x,f)
    [u_d,u_d2,u]=derivada_pol(f,a,b,h)
    ordem=length(u)-1;
    str=sprintf("Derivada por polinômio ordem %d",ordem)
    subplot(311)
      xi=linspace(a,b,1000)
      plot(xi,f(xi))
      plot(xi,horner_fga(u,xi),'r')
      scatter(x,y) 
      legend("f(x)","Polinômio","Pontos de Controle",2)
    subplot(312)
      plot(xi,horner_fga(u_d,xi),'r')
      legend("1a derivada",2)
      xtitle("1a " + str)
    subplot(313)
      plot(xi,horner_fga(u_d2,xi),'r')
      legend("2a derivada",2)
      xtitle("2a " + str) 
endfunction

function [u,u_d,u_d2]=derivada_splines(f,a,b,h)
    x=[a:h:b]
    clear u_d u_d2
    u=SplineCubica(x,f(x)) 
    for (i=1:length(x)-1)
       u_d(3*i:-1:3*i-2)=derivat_fga([u(4*i);u(4*i-1);u(4*i-2);u(4*i-3)])
       u_d2(2*i:-1:2*i-1)=derivat_fga([u_d(3*i);u_d(3*i-1);u_d(3*i-2)])
    end
endfunction

function Plot_derivada_splines(f,a,b,h)
   x=[a:h:b]
   [u,u_d,u_d2]=derivada_splines(f,a,b,h)
   str=sprintf("Derivada por splines %d pontos",length(x))
   xp=linspace(a,b,1000)  
   subplot(311)
    plot(xp,f(xp))
    plot(xp,horner_spcubica(u,x,xp),'r')
    scatter(x,f(x)) 
    legend("f(x)","Splines",2)
   subplot(312)
    plot(xp,horner_spquadratica(u_d,x,xp),'r')
    xtitle("1a " + str)
   subplot(313)
    plot(xp,horner_splinear(u_d2,x,xp),'r')
    xtitle("2a " + str) 
endfunction

