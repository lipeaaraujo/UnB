prt = %f
tol = %eps*32
function x0=Bissecao_n(f,a,b,tol,prt) //número de iterações
    if (f(a)*f(b)>0) then x0=[]; return end
    n=ceil(log2((b-a)/tol))+1
    if (prt) 
        printf("Previsão de %d iterações\n",n) 
        printf ('i \ta\t\t\tx0\t\t\tb\t\t\terro\n')
    end
    for (k=1:n)
        x0=(a+b)/2    // Bisseção
        if (prt) 
            printf ("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n",...
            k,a,sign(f(a)),x0,sign(f(x0)),b,sign(f(b)),abs(b-a)) 
        end
        if  ( f(x0)==0 )  break  end
        if     f(x0)*f(a)<0  b=x0
        else   a=x0          end   
    end
endfunction

function x1=Bissecao(f,a,b,tol,prt) //erro relativo
    if (f(a)*f(b)>0) then x1=[]; return end
    if (prt) printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n') end
    x0=(a+b)/2;
    erro=  1;
    for (k=1:200)
        f0 = f(x0)
        if (prt) 
            printf ( '%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,...
            a,sign(f(a)),x0,sign(f0),b,sign(f(b)),erro) 
        end
        if  ( (erro<tol) | (f0==0) )  break  end
        if     f0*f(a)<0  b=x0
        else   a=x0          end   
        x1=(a+b)/2     // Bisseção
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        x0=x1
    end
endfunction

function x1=FalsaPosicao(f,a,b,tol,prt) //erro relativo
    if (f(a)*f(b)>0) then x1=[]; return end
    if (prt) printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n') end
    x0=(a+b)/2;
    erro=  1;
    for (k=1:200)
        f0 = f(x0)
        if (prt) 
            printf ( '%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',k,...
            a,sign(f(a)),x0,sign(f0),b,sign(f(b)),erro) 
        end
        if  ( (erro<tol) | (f0==0) )  break  end
        if     f0*f(a)<0  b=x0
        else              a=x0      end   
        x1=(a*f(b)-b*f(a))/(f(b)-f(a)) //Bisseção x1=(a+b)/2
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        x0=x1
    end
endfunction

function x1=FalsaPosicaoModificado(f,a,b,tol,prt)
    if (f(a)*f(b)>0) then x1=[]; return end
    if (prt)   printf ('i \ta\t\t\tx1\t\t\tb\t\t\terro\n') end
    x0=(a+b)/2; 
    fa=f(a);  fb=f(b); 
    na=0;     nb=0; 
    erro=1
    for(k=1:500)
        f0=f(x0)
        if (prt) 
            printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',...
            k,a,sign(fa),x0,sign(f0),b,sign(fb),erro) 
        end
        if  ( (erro<tol) | (f0==0) )  break  end
        if f0*fa < 0 then // falsa posição modificado
            b=x0;  fb = f0;
            nb=0;  na=na+1
            if (na>=2)  fa = fa/2;  end
        else
            a=x0;  fa = f0;
            na=0;  nb=nb+1
            if (nb>=2)  fb = fb/2;   end;
        end
        x1=(a*fb-b*fa)/(fb-fa) 
        if(x1<>0)  erro =abs((x1-x0)/x1)  end
        x0=x1;
    end
endfunction

//Falsa posição com 3 pontos -  parábola!!
function x1 = Brent(f,a,b,tol,prt)
  if (f(a)*f(b)>0) then x1=[]; return end
  xa = a; xb = b;
  x0 = (a + b)/2;
  erro=1
  for k = 1:100
    fa=f(xa); f0=f(x0); fb=f(xb)
    if (prt) 
       printf ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e\n',...
       k,xa,sign(fa),x0,sign(f0),xb,sign(fb),erro) 
    end 
    if ((fa<>f0)&(fb<>f0))
       x1 = f0*fb*xa/((fa-f0)*(fa-fb))+...//quadrática inversa
            fa*fb*x0/((f0-fa)*(f0-fb))+...
            fa*f0*xb/((fb-fa)*(fb-f0))
    else         
       x1 = (xa*fb-xb*fa)/(fb-fa);//falsa Posição
    end 
    // se x1 for projetado fora do intervalo [a,b], use bisseção
    if fa*f0 < 0.0; b = x0;
    else            a = x0;  end
    if ((x1<a)|(x1>b)) 
        x1=(a + b)/2; //Bisseção
    end 
    if(x1<>0)   erro =abs((x1-x0)/x1)  end
    if  ( (erro<tol) | (f(x1)==0) )  break  end
    if x1 < x0   xb = x0; //reordenar
    else         xa = x0;  end
    x0 = x1;
  end
endfunction

