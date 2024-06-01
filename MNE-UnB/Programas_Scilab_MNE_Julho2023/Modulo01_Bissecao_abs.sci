prt = %f
tol = %eps*32
function x0=Bissecao_abs(f,a,b,tol,prt) //erro absoluto
    if (f(a)*f(b)>0) then x0=[]; return end
    if (prt)  printf ('i \ta\t\t\tx0\t\t\tb\t\t\terro\n') end
    k=1
    while %t
        erro=abs(b-a)
        x0=(a+b)/2     // Bisseção
        if (prt) 
            printf ("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n",...
            k,a,sign(f(a)),x0,sign(f(x0)),b,sign(f(b)),erro) 
        end
        if  ( (erro<tol) | (f(x0)==0) )  break  end
        if     f(x0)*f(a)<0  b=x0
        else   a=x0          end   
        k=k+1
    end
endfunction

function rts=lista_raizes(f,a,b)
    n = 0;
    dx=0.01
    for x1=a:dx:b
        xr=Bissecao_abs(f,x1,x1+dx,1e-8,%f)
        if xr<>[]
            n = n + 1;
            rts(n) = xr;
         end
    end
endfunction    
