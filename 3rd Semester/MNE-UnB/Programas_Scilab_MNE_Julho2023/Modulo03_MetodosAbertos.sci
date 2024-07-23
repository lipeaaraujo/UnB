prt=%f
tol = %eps*32
function x1=NewtonRaphson(f,df,x0,tol,prt)
  erro = 1;
  for (k=1:100)
     if (prt)  printf ('%d\t%s\t%.1e\n',k,string(x0),erro) end
     f0  = f(x0)
     if  ( (erro<tol) | (f0==0) )  break  end
     df0 = df(x0)
     x1 = x0 - f0/df0 
     if (x1<>0) erro =abs((x1-x0)/x1) end
     x0=x1
  end
endfunction

p=1
function x1=NewtonRaphson_p(f,df,x0,tol,p,prt)
  erro = 1;
  for (k=1:100)
     if (prt)  printf ('%d\t%s\t%.1e\n',k,string(x0),erro) end
     f0=f(x0)
     if  ( (erro<tol) | (f0==0) )  break  end
     df0=df(x0)
     x1 = x0 - p*f0/df0
     if (x1<>0) erro =abs((x1-x0)/x1) end
     x0=x1
  end
endfunction

function dps=derivat_fga(ps)
    a = coeff(ps)
    N=length(a)
    b= a(2:N).*[1:N-1]
    dps=poly(b,"s","coeff" )
endfunction

function x1=NewtonRaphson_pol(ps,x0,prt)
  erro = 1;
  for (k=1:100)
     if (prt)  printf ('%d\t%s\t%.1e\n',k,string(x0),erro) end
     f0=horner(ps,x0);
     if  ( (erro<1e-15) | (f0==0) )  break  end
     df0=horner(derivat_fga(ps),x0); 
     x1=x0-f0/df0
     if (x1<>0) erro =abs((x1-x0)/x1) end
     x0=x1
   end
endfunction

function x1=Secante(f,x0,tol,prt)
  dx=1e-8;
  erro = 1;
  for (k=1:100)      
    if (prt)  printf ('%d\t%s\t%.1e\n',k,string(x0),erro) end 
    f0=f(x0); 
    if  ( (erro<tol) | (f0==0) )  break  end
    df0=(f(x0+dx)-f0)/dx  
    x1 = x0 - f0/df0 
    if(x1<>0)  erro =abs((x1-x0)/x1)  end
    x0=x1
  end 
endfunction

function rts=lista_raizes_aberto(f,a,b)
  dx = 0.01
  n = 0;
  for x1=a:dx:b
    xr=Bissecao(f,x1,x1+dx,1e-4,%f)
    if xr<>[]
       n = n + 1;
       xr=Secante(f,xr,1e-15,%f)
       rts(n) = xr;
    end
  end
endfunction   

function x1=PontoFixo(f,x0,tol,prt)
  deff ('y=g(x)','y=f(x)+x')  
  erro = 1;
  for (k=1:200)
     if (prt)  printf ('%d\t%s\t%.1e\n',k,string(x0),erro) end
     if  ( (erro<tol) | (f(x0)==0) )  break  end
     x1 = g(x0);
     if(x1<>0)   erro =abs((x1-x0)/x1)  end
     x0=x1
  end
endfunction
