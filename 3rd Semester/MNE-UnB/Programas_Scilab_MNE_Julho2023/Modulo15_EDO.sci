prt = %f
// deff ('phi=g(x,y)' , 'phi=(2*x-4*y+x*y-1)/3')
function k=calc_phi(g,tipo,xi,yi,h)
    if (tipo=='eul')
         k = g(xi,yi) 
    elseif (tipo=='heu')
        k1 = g(xi    , yi);
        k2 = g(xi+h, yi+k1*h);
        k  = (k1+k2)/2;
    elseif (tipo=='mid')
        k1 = g(xi     , yi);
        k2 = g(xi+ h/2, yi+k1*h/2);
        k  = k2;
    elseif (tipo=='ral')
        k1 = g( xi      , yi);
        k2 = g( xi+3/4*h, yi+3/4*k1*h);
        k  = 1/3*(k1 +2*k2);
    elseif (tipo=='rk3')
        k1 = g( xi      , yi);
        k2 = g( xi+1/2*h, yi+1/2*k1*h);
        k3 = g( xi+h    , yi+(2*k2-k1)*h);
        k= 1/6*(k1+4*k2+k3)
    elseif (tipo=='rk4')
        k1 = g( xi      , yi);
        k2 = g( xi+1/2*h, yi+1/2*k1*h);
        k3 = g( xi+1/2*h, yi+1/2*k2*h);
        k4 = g( xi+h    , yi+k3*h);
        k= 1/6*(k1+2*k2+2*k3+k4)
    end
endfunction

cor='b'
function [x,y]=edo_fga(g,tipo,a,b,ya,n,prt,cor)
   h=(b-a)/(n-1);
   x=linspace(a,b,n)'
   y = [ya zeros(1,n-1)]'
   for i=1:n-1
      phi(i)= calc_phi(g,tipo,x(i),y(i),h)
      y(i+1)= y(i)+phi(i)*h
   end
   if (prt)
      printf("   i    x(i)  y(i)   phi(i)")
      disp([[0:n-1]',x,y,[phi;%nan]]);
      plot(x,y,cor)
      legend(tipo,2)
   end
endfunction

function Test_EDO(g,a,b,ya,n)
    [x,y]=edo_fga(g,'eul',a,b,ya,n,%t,'k');
    [x,y]=edo_fga(g,'mid',a,b,ya,n,%t,'b');
    [x,y]=edo_fga(g,'ral',a,b,ya,n,%t,'g');
    [x,y]=edo_fga(g,'rk4',a,b,ya,n,%t,'r');
    legend("euler","midpoint","ralston","runge kutta4",2)
endfunction


function [x,y]=runge_kutta6(g,a,b,ya,n,prt)
    h=(b-a)/(n-1);
    x=linspace(a,b,n)'
    y = [ya zeros(1,n-1)]'
    for i=1:n-1
        k1(i) = g( x(i)      , y(i));
        k2(i) = g( x(i)+1/4*h, y(i)+1/4*k1(i)*h);
        k3(i) = g( x(i)+1/4*h, y(i)+1/8*k1(i)*h+1/8*k2(i)*h);
        k4(i) = g( x(i)+1/2*h, y(i)-1/2*k2(i)*h+k3(i)*h);
        k5(i) = g( x(i)+3/4*h, y(i)+3/16*k1(i)*h+9/16*k4(i)*h);
        k6(i) = g( x(i)+h    , y(i)-3/7*k1(i)*h+2/7*k2(i)*h+ ...
                     12/7*k3(i)*h-12/7*k4(i)*h+8/7*k5(i)*h);
        phi(i)= 1/90*(7*k1(i) + 32*k3(i) + 12*k4(i) + 32*k5(i) + 7*k6(i));
        y(i+1)=y(i)+phi(i)*h
    end
    if (prt)
        printf("   i    x(i)  y(i)   phi(i)")
        disp([[0:n-1]',x,y,[phi;%nan]]);
        plot(x,y,"b")
        legend("Runge-Kutta 6",2)
    end
endfunction

// y''-y'+xy=exp(x)*(x^2+1)
// y'=u
// u'=u-xy+exp(x)*(x^2+1)
// deff ('phi=g(x,y,u)' , 'phi=u-x*y+exp(x)*(x^2+1)')
function [x,y]=EDO_2a_Ordem(g,a,b,ya,dya,n,prt)
    h=(b-a)/(n-1);
    x=linspace(a,b,n)'
    y = [ya zeros(1,n-1)]'
    u = [dya zeros(1,n-1)]'
    for i=1:n-1
        k1_a = u(i);
        k1_b = g(x(i),y(i),k1_a);
        k2_a = u(i)+1/2*k1_b*h;
        k2_b = g(x(i)+1/2*h, y(i)+1/2*k1_a*h, k2_a);
        k3_a = u(i)+1/2*k2_b*h;
        k3_b = g(x(i)+1/2*h, y(i)+1/2*k2_a*h, k3_a);
        k4_a = u(i)+k3_b*h;
        k4_b = g(x(i)+h, y(i)+k3_a*h, k4_a);
        phi_a=1/6*(k1_a+2*k2_a+2*k3_a+k4_a)
        y(i+1)=y(i)+phi_a*h
        phi_b= 1/6*(k1_b+2*k2_b+2*k3_b+k4_b)
        u(i+1)=u(i)+phi_b*h 
    end
    if (prt)
        printf("   i\tx(i)\tu(i)\ty(i)")
        disp([[0:n-1]',x, u, y]);
        plot(x,y,"b")
        legend("EDO 2a Ordem",1)
    end
endfunction
