function exemplo_truncamento64bits(N)
    e ="2.718281828459045235360287471353"
    ed =strtod(e)
    neper=0
    for n=0:N
        neper=neper+1/factorial(n)
        erro_rel(n+1) = abs((neper-ed)/ed)
        printf("%2d\t%.17f\t%0.0e\n",n+1,neper,erro_rel(n+1))
    end
    plot(log10(erro_rel))
    disp(e)
    disp(neper)
endfunction

function exemplo_truncamento32bits(N)
    e ="2.718281828459045235360287471353"
    ed =strtod(e)
    neper=0
    for n=0:N
        neper=SomaFloat(neper,1/factorial(n),8,24)
        erro_rel(n+1) = abs(SomaFloat(neper,-ed,8,24)/ed)
        printf("%2d\t%.17f\t%0.0e\n",n+1,neper,erro_rel(n+1))
    end
    plot(log10(erro_rel))
    disp(e)
    disp(neper)
endfunction

function exemplo_truncamento128bits(N)
    e ="2.718281828459045235360287471353"
    edd = str2dd(e)
    neper=dd(0)
    for n=0:N
        neper=neper+dd(1.0)/factorial(n)
        erro_rel=abs(neper-edd)/edd
        erro(n+1)=log10(getHi(erro_rel*1e20))-20
        printf("%2d\t%s\t%0.0e\n",n+1,dd2str(neper),getHi(erro_rel))
    end
    plot((1:N)',erro(1:N))
    disp(e)
    disp(neper)
endfunction

// pi50 = 3.14159265358979323846264338327950288419716939937510
function exemplo_truncamento_pi_128bits(N)
    pi50_str = "3.14159265358979323846264338327950288419716939937510"
    pi50=str2dd(pi50_str)
    a=dd(2)
    b=dd(4)
    x1=a;
    for (n=1:N)
        erro = abs((x1-pi50)/pi50)
        erro_log(n) = log10(getHi(erro))
        x1=(a+b)/2     // Bisseção
        printf ("%2d\t%s\t%0.0e\n",n,dd2str(x1),getHi(erro))
        if sin(x1)*sin(a) < 0 then
             b=x1
        else
             a=x1
        end
    end
    plot((1:N)',erro_log)
    disp(dd2str(x1))
    disp(pi50_str)
endfunction

function exemplo_truncamento_pi_64bits(N)
    pi16_str = "3.1415926535897934"
    pi16=strtod(pi16_str)
    a=2
    b=4
    x1=a;
    for (n=1:N)
        erro = abs((x1-pi16)/pi16)
        erro_log(n) = log10(erro)
        x1=(a+b)/2     // Bisseção
        printf ("%2d\t%.21f\t%0.0e\n",n,x1,erro)
        if sin(x1)*sin(a) < 0 then
             b=x1
        else
             a=x1
        end
    end
    plot((1:N)',erro_log)
    disp(string(x1))
    disp(pi16_str)
endfunction

function tabela=tabela_floating_point(n,m)
    Bias = 2^(n-1)-1
    E=zeros(1:n)
    tabela(1,1) = %nan
    for (col=2:2^n+1)
        tabela(1,col) = binario2dec1(E)-Bias 
        E=SomaBinaria(E,[zeros(1:n-1) 1],%f)
    end
    M=zeros(1:m-1)
    for (lin=2:2^(m-1)+1)
        tabela(lin,1) = binario2dec4([1 M],1,m-1)
        M=SomaBinaria(M,[zeros(1:m-2) 1],%f)
    end   
    E=zeros(1:n)    
    for (col=2:2^n+1) 
        M=zeros(1:m-1)
        for(lin=2:2^(m-1)+1)
            e=[0 E M]
            tabela(lin,col) = float2dec(e,n,m)
            M=SomaBinaria(M,[zeros(1:m-2) 1],%f)
        end
        E=SomaBinaria(E,[zeros(1:n-1) 1],%f)
    end
endfunction

function eixo_floating_point(n,m)
    for nn=[0:2^n-1]
        expoente = dec2binario1(nn,n)
        for mm = [0:2^(m-1)-1];
            mantissa = dec2binario1(mm,m-1)
            b=[0 expoente mantissa]
            x = float2dec(b,n,m)
            printf("%f  - ",x)
            printfloat(b,n,m)
            yy=[-2 2]
            xx=[x x]
            plot(xx,yy)
        end  
    end
endfunction

function grafico_floating_point(n,m)
    max_x = float2dec([0 ones(1:n+m-1) ],n,m) 
    k=0
    for x=linspace(0,1.5*max_x,2000)
        k=k+1;
        a_in(k) = x
        e=dec2float(a_in(k),n,m);
        a_out(k)=float2dec(e,n,m)
    end
    w=gca()
    plot(a_in,a_out)
    w.data_bounds=[min(a_in),1.1*min(a_out);max(a_in),1.1*max(a_out)]
endfunction

function soma1_cond(N,n,m)
    x=1.0
    dx=1.0/N;
    S=x
    for i = 1:N
        S=SomaFloat(S,dx,n,m,%f)
    end
    Soma_cond = x + N*dx
    printf("Soma Iterativa     = %.8f\n",S)
    printf("Soma Condicionada  = %.8f\n",Soma_cond)
endfunction

function soma2_cond(N,n,m)
    x=1.0
    dx=1.0/N;
    S=x
    S_cond=dx
    for i = 1:N-1
        S=SomaFloat(S,dx,n,m,%f)
        S_cond=SomaFloat(S_cond,dx,n,m,%f)
    end 
    S = SomaFloat(S,dx,n,m,%f)
    S_cond = SomaFloat(S_cond,x,n,m,%f)
    printf("Soma Iterativa     = %.8f\n",S)
    printf("Soma Condicionada  = %.8f\n",S_cond)
endfunction

function baskara_cond(ps,n,m)
    coef = coeff(ps)
    a=coef(3)
    b=coef(2)
    c=coef(1)
    b2     =  -(b)/(2*a)
    delta2 =   sqrt(   SomaFloat(b^2,-4*a*c,n,m) )  /(2*a)
    x1 = SomaFloat(b2,+delta2,n,m)
    x2 = SomaFloat(b2,-delta2,n,m)
    x2_cond = c/(a*x1)
    printf("ps=(%.3f)x^2+(%.3f)*x+(%.3f)\n",a,b,c)
    printf("b2     = -b/(2a)=%f\n",b2)
    printf("delta2 =  sqrt(b^2 - 4ac)/(2a)=%.4f\n",delta2)
    printf("x1 = b2 + delta2 =%.4f  + %.4f\n",b2,delta2)
    printf("x2 = b2 - delta2 =%.4f  - %.4f\n",b2,delta2)
    printf("           (subtração 2 números próximos!!\n")
    printf("condicionamento x1*x2 = c/a ->  x2=c/(a*x1)\n")
    z=roots(ps)
    printf("raizes exatas  = %.8f\t%.8f\t(condicionamento)\n",z(1),z(2)) 
    printf("raizes (%2d,%2d) = %.8f\t%.8f\t(%.8f)\n",n,m,x1,x2,x2_cond)
endfunction

function taylor_cond(dx,n,m)
    x=1
    y = 1/dx*SomaFloat(sin(x+dx),-sin(x),n,m)
    y_cond = SomaFloat(cos(x),-0.5*dx*sin(x),n,m)
    printf("Calcular y=1/dx*(sin(x+dx)-sin(x)), dx pequeno\n"); 
    printf("subtração 2 números próximos!!\n")
    printf("Condicionamento por Taylor y_cond= cos(x)-0.5*dx*sin(x)\n")
    printf("dx=%.1e\n",dx)
    printf("y(%2d,%2d) = %.16f\t(%.16f)\n",n,m,y,y_cond)
endfunction

function derivada_cond(x,dx,f,n,m)
    y = SomaFloat(f(x+dx),-f(x),n,m)
    y_cond = dx*numderivative(f,x)
    printf("Calcular y=f(x+dx)-f(x), dx pequeno\n"); 
    printf("subtração 2 números próximos!!\n")
    printf("Condicionamento por derivada y_cond= (dx)f''(x)\n")
    printf("y(%2d,%2d) = %.8e\t(%.8e)\n",n,m,y,y_cond)
endfunction

function trig_cond(dx,n,m)
    y = 1/sin(dx)*SomaFloat(1,-cos(dx),n,m)
    y_cond = 2*sin(dx/2)^2/sin(dx)
    printf("Calcular y=(1-cos(x))/sin(x), x pequeno\n"); 
    printf("subtração 2 números próximos!!\n")
    printf("Condicionamento por trigonometria y_cond= 2*sin(x/2)^2/sin(x)\n")    
    printf("y(%2d,%2d) = %.6f\t(%.6f)\n",n,m,y,y_cond)
endfunction


function log_cond(x,dx,n,m)
    y = SomaFloat(log(x+dx),-log(x),n,m)
    y_cond = log((x+dx)/x)
    printf("Calcular y=log(x+dx)-log(x), x pequeno\n"); 
    printf("subtração 2 números próximos!!\n")
    printf("Condicionamento por logaritmo  y_cond= log((x+dx)/x)\n")
    printf("dx=%.1e\n",dx)
    printf("y(%2d,%2d) = %.4e\t(%.4e)\n",n,m,y,y_cond)
endfunction


function produtonotavel_cond(dx,n,m)
    y = SomaFloat(sqrt(dx^2+1),-1,n,m)
    y_cond = dx^2/SomaFloat(sqrt(dx^2+1),1,n,m)
    printf("Calcular y=sqrt(x^2+1)-1, x muito pequeno\n"); 
    printf("subtração 2 números próximos!!\n")
    printf("Condicionamento por produto notável  y_cond= x^2/(sqrt(x^2+1)+1)\n")
    printf("dx=%.1e\n",dx)    
    printf("y(%2d,%2d) = %.3e\t(%.3e)\n",n,m,y,y_cond)
endfunction
            
 
