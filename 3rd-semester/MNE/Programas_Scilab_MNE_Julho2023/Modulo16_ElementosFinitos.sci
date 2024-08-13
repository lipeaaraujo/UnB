prt = %f
function [t,y]=ElementosFinitos_a(a,b,ya,yb,n,fl,fp,fu,fr,prt)
    //(el)*y(i-1)+ ( ep)*y(i) + (eu)*y(i+1) = (r)
    i=1:n
    h=(b-a)/(n-1)
    t=[a+(i-1)*h]
    el= [feval(1:n-2,fl) 0] 
    eu= [0 feval(2:n-1,fu)]
    ep= [1 feval(2:n-1,fp) 1]
    r=  [ya feval(2:n-1,fr) yb]
    y = tridiagonal(el,ep,eu,r)
    if (prt)
        if (n<20) then
            printf("   [A r]")
            disp([diag(eu,1)+diag(ep)+diag(el,-1) r'])
            printf("   [i x y]")
            disp([ t' y'])
        end
        plot(t,y,'b')
    end
endfunction

function [t,y]=ElementosFinitos(a,b,ya,yb,n,fl,fp,fu,fr,tipo,prt)
    i=1:n
    h=(b-a)/(n-1)
    t=[a+(i-1)*h] 
    if tipo==1 then  // ya e yb
        el= [feval(1:n-2,fl) 0] 
        eu= [0 feval(2:n-1,fu)]
        ep= [1 feval(2:n-1,fp) 1]
        r=  [ya feval(2:n-1,fr) yb]
    elseif tipo==2 then  // ya e dyb
        eu= [0 feval(2:n-1,fu)]
        el= feval(1:n-1,fl) 
        el(n-1)=el(n-1)+eu(n-1)
        ep= [1 feval(2:n,fp)]
        r=  [ya feval(2:n,fr)]
        r(n)=r(n)-2*yb*h*eu(n-1)
    elseif tipo==3 then   // dya e yb
         el= [feval(1:n-2,fl) 0] 
         eu= feval(1:n-1,fu)
         eu(1)=eu(1)+el(1)
         ep= [feval(1:n-1,fp) 1]
         r=  [feval(1:n-1,fr) yb]
         r(1)=r(1)+2*ya*h*el(1)
    elseif tipo==4   //dya e dyb
         el= feval(1:n-1,fl)
         eu= feval(1:n-1,fu)
         el(n-1)=el(n-1)+eu(n-1)
         eu(1)=eu(1)+el(1)
         ep= feval(1:n,fp)
         r=  feval(1:n,fr)
         r(1)=r(1)+2*ya*h*el(1)
         r(n)=r(n)-2*yb*h*eu(n-1)
    end
    y = tridiagonal(el,ep,eu,r)
    if (prt)
        if (n<20) then
            printf("   [A r]")
            disp([diag(eu,1)+diag(ep)+diag(el,-1) r'])
            printf("   [i x y]")
            disp([[0:n-1]' t' y'])
        end
        plot(t,y,'b')
        printf("h=%.3f\n",h);
        printf("y(%.3f)=%.3f dy(%.3f)=%.3f\n",...
          t(1),y(1),t(1),(-y(3)+4*y(2)-3*y(1))/(2*h));
        printf("y(%.3f)=%.3f dy(%.3f)=%.3f\n",...
          t(n),y(n),t(n),(3*y(n)-4*y(n-1)+y(n-2))/(2*h));
    end
endfunction








