function x1=raizQuadrada(x1,a)
    for n=1:500
        x0=x1
        x1 = (x0 +a/x0)/2
        disp([x0 x1])
        erro = abs((x1-x0)/x1)
        if (erro<1e-18) break; end; 
    end
    printf("raiz de %d após %i iterações = %f",a,n,x1)
endfunction

function y = dado_k_lados(k,N)
    y=int(modulo(1000*rand(1:N),k)+1);
    y = grand(N, 1, "uin", 1, k) 
endfunction

function y=MegaSena(N)
    if(N<6)||(N>20)
       disp("N deve estar entre 6 e 20")
       return
    end
    y = []
    n = 0
    while (n<N) then
        k = grand(1, 1, "uin", 1, 60)
        y=[k y]
        y=unique(y)
        n=length(y)
    end
endfunction
 
function taylor_expx(x,N)
    y=1;
    printf("n \t  erro \t\t aprox.\n")
    for(n=1:N)
        y = y + 1/factorial(n)*x^n
        erro =  abs(y-exp(1))/exp(1)
        printf("%i \t  %.2e \t %.8f\n",n,erro,y)
        if (erro<1e-7) break end
    end
    printf("%d iteração erro %.2e neper~=%.8f\n",n,erro,y)
endfunction

function taylor_lnx(x,N)
    y=0;
    printf("n \t  erro \t\t aprox.\n")
    for(n=1:N)
        y = y +(-1)^(n+1) * 1/n*x^n
        erro =  abs(y-log(1+x))/abs(log(1+x))
        printf("%i \t  %.2e \t %.8f\n",n,erro,y)
        if (erro<1e-4) break end
    end
    printf("%d iteração erro %.2e log(%f)~=%.8f\n",n,erro,1+x,y)
endfunction


function y=erf_fga(x)
    t=1./(1+0.5*abs(x))
    y = sign(x).*(1-t.*exp(-x.^2-1.26551223+1.00002368*t+0.37409196*t.^2+0.09678418*t.^3-0.18628806*t^4...
              +0.27886807*t.^5-1.13520398*t^6+1.48851587*t.^7-0.82215223*t^8+0.17087277*t.^9))
endfunction

function PI=CalculoPI(n)
    a1 = sqrt(2)
    b1=0
    PI=2+sqrt(2)
    for (i=1:n)
        disp(PI)
        a2=(sqrt(a1)+1/sqrt(a1))/2
        b2=((1+b1)*sqrt(a1))/(a1+b1)
        PI=(1+a2)*PI*b2/(1+b2)
        a1=a2
        b1=b2
    end
    disp([i+1,PI])
endfunction

function  v=randperm(n,k)
    v_inter = grand(1, "prm", (1:n))
    v = v_inter(1:k)
end

erro_frac = 1e-16
prt=%f
function x_frac=dec2frac(x, erro_frac,prt)
  iri(1)=floor(x)
  resto(1)=x-iri(1)
  num(1)=iri(1)
  den(1)=1
  x_frac=[num(1),den(1)]
  if(prt)
    printf("%d/%d \t e=%0.e\n",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
  end
  if resto(1)<>0 then
    iri(2)=floor(1.0/resto(1))
    resto(2)=1.0/resto(1)-iri(2)
    num(2)=iri(2)*num(1)+1
    den(2)=iri(2)*den(1)
    x_frac=[num(2),den(2)]
    if(prt)
        printf("%d/%d \t e=%0.e\n",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
    end
    if ( (resto(2)<>0) & (abs(x-num(2)/den(2)) > erro_frac ) )then
      for n=3:25
         iri(n)=floor(1.0/resto(n-1))
         resto(n)=1.0/resto(n-1)-iri(n)
         num(n)=iri(n)*num(n-1)+num(n-2)
         den(n)=iri(n)*den(n-1)+den(n-2)
         x_frac=[num(n),den(n)]
         if(prt)
            printf("%d/%d \t e=%0.e\n",x_frac(1),x_frac(2),abs(x-x_frac(1)/x_frac(2)))
        end 
        if (resto(n)==0)|(abs(x-num(n)/den(n)) < erro_frac)
            break;
        end
      end
    end
  end
endfunction


function dec2frac_d(x_str,digitos_den)
  x=strtod(x_str) 
  iri_old = floor(x);
  resto_old=x-iri_old;
  num_old=iri_old;
  den_old=1;
  if resto_old<>0 then
    iri=floor(1.0/resto_old)
    resto=1.0/resto_old-iri;
    num=iri*num_old+1;
    den=iri*den_old;
    if resto<>0 then
      for i=1:100
         iri_new = floor(1.0/resto)
         resto_new=1.0/resto-iri_new;
         num_new=iri_new*num+num_old;
         den_new=iri_new*den+den_old;
         delta = x-num_new/den_new;
         if resto_new==0 | log10(den_new)> digitos_den | delta==0    break;  end
         printf("%d -> %.0f / %0.f (%.1e)\n",i,num_new,den_new,abs(delta))
         num_old=num
         den_old=den
         iri_old=iri
         resto_old=resto
         num=num_new
         den=den_new
         iri=iri_new
         resto=resto_new
      end
    end,
  end
endfunction

pi="3.141592653589793238462643383279502884197"
e ="2.718281828459045235360287471352662497757"
digitos_den=32;
function dec2frac_dd(x_str,digitos_den)
  x=str2dd(x_str) //sgr2qd!!!!    
  iri_old = floor(x);
  resto_old=x-iri_old;
  num_old=iri_old;
  den_old=1;
  if resto_old<>0 then
    iri=floor(1.0/resto_old)
    resto=1.0/resto_old-iri;
    num=iri*num_old+1;
    den=iri*den_old;
    if resto<>0 then
      for i=1:100
         iri_new = floor(1.0/resto)
         resto_new=1.0/resto-iri_new;
         num_new=iri_new*num+num_old;
         den_new=iri_new*den+den_old;
         delta = x-num_new/den_new;
         if resto_new==0 | log10(getHi(den))> digitos_den | delta==0    break;  end
         printf("%d -> %.0f / %0.f (%.1e)\n",i,getHi(num_new),getHi(den_new),abs(getHi(delta)))
         num_old=num
         den_old=den
         iri_old=iri
         resto_old=resto
         num=num_new
         den=den_new
         iri=iri_new
         resto=resto_new
      end
    end,
  end
  disp(x_str)
  disp(num_new/den_new)
endfunction

function machine1()
    b0 = 10
    t = b0 * rand(100,2)
    t = [t 0.5+0.5*sign(t(:,2)+t(:,1)-b0)]
    b=1
    flip=find(abs(t(:,2)+t(:,1)-b0)<b)
    t(flip,$)=grand(length(t(flip,$)),1,"uin",0,1)
    
    
    x = t(:,1:$-1)
    y = t(:, $)
    x=[ones(m,1) x]
    theta=zeros(n+1,1)
    a = 0.01;
    n_iter = 10000;
    for iter = 1:n_iter
        z = x * theta;
        h = ones(z) ./ (1+exp(-z));
        theta = theta-a * x'*(h-y)/m;
        J(iter) = (-y'*log(h)-(1-y)' * log(1-h))/m;
    end
    disp(theta)
    u = linspace(min(x(:,2)),max(x(:,2)))
    clf(1)
    scf(1)
    t0 = t(find(t(:,$)==0),:);
    t1 = t(find(t(:,$)==1),:)
    plot(t0(:,1),t0(:,2),'bo')
    plot(t1(:,1),t1(:,2),'rx')
    gca.data_bounds = [-2,12;-2,12];
    v = -(theta(1)+theta(2)*u)/theta(3)
    disp([u' v'])
    plot(u,v,'g-')
    clf(2);
    scf(2)
    plot(1:n_iter, J')
xtitle('Convergence','Iterations','Cost')

endfunction


function machine2(tipo)
    b0 = 10
    t = b0 * rand(200,2)
    t = [t 0.5+0.5*sign(t(:,2)+t(:,1)-b0)]
    b=1
    flip=find(abs(t(:,2)+t(:,1)-b0)<b)
    t(flip,$)=grand(length(t(flip,$)),1,"uin",0,1)
    P = t(:,1:2)'
    T = t(:,3)'
    
    clf(1);
    scf(1);
    if (tipo==1) then
        W = ann_FFBP_gd(P,T,[2 3 1]);
    elseif tipo==2
        W = ann_FFBP_gdx(P,T,[2 3 1]);
    else
        W = ann_FFBP_lm(P,T,[2 3 1]);
    end
    clf(2);
    scf(2);
    plot_2group(P,T); 
    y = ann_FFBP_run(P,W);
    sum(T == round(y))
    // Create the input range grids
    nx = 20;
    ny = 20;
    xx = linspace(0,10,nx);
    yy = linspace(0,10,ny);
    [X,Y] = ndgrid(xx,yy);
    // Use the trained NN to classify the grid data
    P2 = [X(:)';Y(:)'];
    y2 = ann_FFBP_run(P2,W);
    // Extract the data according to the categories
    G0 = P2(:,find(round(y2)==0))
    G1 = P2(:,find(round(y2)==1))
     // Plot the boundary and the region for the groups     
    plot(G0(1,:),G0(2,:),'b+');
    plot(G1(1,:),G1(2,:),'g+');
endfunction
