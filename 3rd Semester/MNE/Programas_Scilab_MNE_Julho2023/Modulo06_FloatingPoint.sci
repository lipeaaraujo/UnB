prt = %f
function b=dec2binario4(a,n,m) //real positivo 
  p= 2^(n-1:-1:-m);
  r=int(a./p)
  b = modulo(r,2)
endfunction

function a=binario2dec4(b,n,m)//real positivo 
   p= 2^(n-1:-1:-m);
   a= b*p'; 
endfunction

function s=print_b2(b,n,m)
    s="["
    for i=1:n  s=s+string(b(i))   end
    s=s+"."
    for i=n+1:m+n s=s+string(b(i)) end
    s=s+"]"
endfunction

function b=dec2binario4c(a,n,m,prt) //real positivo+comp 2
  p= 2^(n-1:-1:-m);
  r=int(abs(a)./p)
  b = modulo(r,2)
  if(a<0) then    b=comple2(b)   end
  if(  a<(-2^(n-1)) |  a>(2^(n-1)-1)  ) then b=[] end
  if (prt) then  disp(print_b2(b,n,m)) end
endfunction 
 
 function e=dec2float(a,n,m,prt)
    sinal = 0;
    if (a<0) then sinal = 1; end
    Bias = 2^(n-1) -1;
    Ed = floor(log2(abs(a)))+Bias;
    E = dec2binario1(Ed,n);
    Md= abs(a) * 2^(-(Ed-Bias));
    M = dec2binario4(Md,1,m-1);
    e = [sinal E M(2:m)]
    if (Ed<0)  then
        e= [sinal zeros(1:n+m-1) ]
        printf("underflow\n")
    end
    if (Ed>2*Bias+1) then
        e= [sinal ones(1:n+m-1) ]
        printf("overflow\n")
    end 
    if (prt) then printfloat(e,n,m) end
endfunction    
 
function a=float2dec(e,n,m) 
    sinal= e(1) 
    E    = e(2:n+1)
    Ed = binario2dec1(E)
    M    = [1 e(n+2:n+m)] //  + 1 bit
    Md = binario2dec4(M,1,m-1)  
    Bias = 2^(n-1)-1
    a = (-1)^sinal * (Md) * 2^(Ed-Bias)
endfunction 

e=[0,1,0,0,0,1,0,0,1,1,0,1,0,0,1,0,1,0,0,1,0,1,0,1,1,1,0,0,0,0,1,0];
function s=print_b2(b,n,m)
    s="["
    for i=1:n  s=s+string(b(i))   end
    s=s+"."
    for i=n+1:m+n s=s+string(b(i)) end
    s=s+"]"
endfunction

function s=printfloat(e,n,m)
    s="["+string(e(1))+'] '+"["
    for i=2:n+1  s=s+string(e(i))   end
    s=s+"] [1."
    for i=n+2:m+n s=s+string(e(i)) end
    s=s+"]"
    printf("%s\n",s)
endfunction

function s=printfloat_bitoculto(e,n,m,bitoculto)
    s="["+string(e(1))+'] '+"["
    for i=2:n+1  s=s+string(e(i))   end
    if (bitoculto==2) then
         s=s+"][10."
    else
         s=s+"]["+string(bitoculto)+ "."
    end     
    for i=n+2:m+n s=s+string(e(i)) end
    s=s+"]"
    printf("%s\n",s)
endfunction  

function eps_sub=epsilon(n, m)
    e1 = [0 0 ones(1:n-1) zeros(1:m-1)  ] //e1=dec2float(1,n,m)
    e2 = [0 0 ones(1:n-1) zeros(1:m-2) 1] //
    eps_sub=float2dec(e2,n,m) - 1.0 //definição epsilon
    printfloat(e2,n,m)
    printfloat(e1,n,m)
    printf("Epsilon Subtração = %.3e\n",eps_sub)
    printf("Epsilon 2^-(m-1) = %.3e\n",2^-(m-1))
endfunction

function plot_epsilon_floating_point(n,m)
    x=linspace(.90,1.3,1000)
    for k=1:length(x)
        e=dec2float(x(k),n,m);
        y(k)=float2dec(e,n,m)
    end
    plot(x,y)
endfunction
   
function soma_dec_nm=SomaFloat(x1,x2,n,m,prt) 
   soma_exata = x1+x2
   if (prt)  printf("(x1,x2)=(%.2f,%.2f)\n",x1,x2)  end
   if(abs(x2)>abs(x1)) then  // Forçar abs(x1)>abs(x2) 
      temp=x1;
      x1=x2;
      x2=temp;
      if (prt) 
           printf("Trocar x1 por x2\n") 
           printf("(x1,x2)=(%.2f,%.2f)\n",x1,x2)
      end
   end
   trocar_sinais=0;
   if( x1<0 ) then  //Forçar x1>0
       trocar_sinais=1;
       x1=-x1;
       x2=-x2;
       if (prt) 
           printf("Trocar Sinais de x1 e x2\n",x1) 
           printf("(x1,x2)=(%.2f,%.2f)\n",x1,x2)
       end
   end 
   e1=dec2float(x1,n,m,%f) //e1 e e2 são os floats equivalente
   e2=dec2float(x2,n,m,%f)
   if (x1*x2>=0)
       soma_bin_nm=SomaFloat_b(e1,e2,n,m,prt);
   else
       soma_bin_nm=SubtFloat_b(e1,e2,n,m,prt);
   end
   if (trocar_sinais)  soma_bin_nm(1)=bitcmp(soma_bin_nm(1),1) end
   soma_dec_nm=float2dec(soma_bin_nm,n,m)
   if (prt)
       if (trocar_sinais) printf("Trocar Sinal da Soma\n") 
          printf("soma   = ")
          printfloat_bitoculto(soma_bin_nm,n,m,1)
       end
       printf("Soma exata \t\t= %.12f\n",soma_exata) 
       printf("Soma binária ( %d,%d)\t= %.12f\n",n,m,soma_dec_nm) 
    end
 endfunction   
 
 function soma=SomaFloat_b(e1,e2,n,m,prt) 
   exp1  = e1(2:n+1)  //exp1 e exp2 são os expoentes
   exp2  = e2(2:n+1)
   mant1  = [0 1 e1(n+2:n+m)] //mant1 e mant2 são as mantissas
   mant2  = [0 1 e2(n+2:n+m)] 
   desloc=binario2dec1(SomaBinaria(exp1,comple2(exp2),%f))
   mant2d=zeros(1:m+1) //desloca mantissa direita para igualar expoentes
   mant2d(desloc+1:m+1)=mant2(1:m+1-desloc)
   e2_d = [e2(1) exp1 mant2d(3:m+1)]      
   mant_s = SomaBinaria(mant1,mant2d,%f) //soma mantissas
   soma = [0 exp1 mant_s(3:m+1)]
   if(mant_s(1)==1)  then  // vai 1 na soma
       soma_d = soma //deslocar mantissa direita e somar 1 ao expoente
       soma = [0 SomaBinaria(exp1,[0 1],%f) mant_s(2:m)]
   end
   if(prt) ;//imprime entradas e matissa deslocada
        printf("e1     = ")
        printfloat_bitoculto(e1,n,m,1)
        printf("e2     = ")
        printfloat_bitoculto(e2,n,m,1)
        if(desloc>=m)  printf("Underflow: deslocamento -> maior que %d\n",m) end 
        printf("mantissa x2 deslocada -> de %d bits\n",desloc)
        printf("e2d    = ")
        printfloat_bitoculto(e2_d,n,m,mant2d(2))
        printf("--------------------\ne2d    = ")
        printfloat_bitoculto(e2_d,n,m,mant2d(2))
        printf("e1     = ")
        printfloat_bitoculto(e1,n,m,1)
        printf("-------------------- +\n")
        if (mant_s(1)==1)
            printf("soma_d = ")
            printfloat_bitoculto(soma_d,n,m,2)
            printf("Vai um! mantisa soma delocada de -> 1 bits\n")
        end
        printf("soma   = ")
        printfloat_bitoculto(soma,n,m,1)
        
   end
 endfunction
 
 function soma_bin_nm=SubtFloat_b(e1,e2,n,m,prt) 
    exp1  = e1(2:n+1)  //exp1 e exp2 são os expoentes
    exp2  = e2(2:n+1)
    mant1  = [0 1 e1(n+2:n+m)] //mant1 e mant2 são as mantissas
    mant2  = [0 1 e2(n+2:n+m)] 
    desloc=binario2dec1(SomaBinaria(exp1,comple2(exp2),%f))
    mant2d=zeros(1:m+1) //desloca mantissa direita para igualar expoentes
    mant2d(desloc+1:m+1)=mant2(1:m+1-desloc)
    e2_d = [e2(1) exp1 mant2d(3:m+1)] 
    mant_s = SomaBinaria(mant1,comple2(mant2d),%f) //subtair mantissas
    soma_d = [0 exp1 mant_s(3:m+1)]
    lista_uns = find(mant_s(1:m+1)==1)  
    if(lista_uns==[]) // mantissa zerada
        soma_bin_nm = [0 zeros(1:n+m-1)]
    else   //deslocar mantissa para esquerda e subtrair expoente
        desloc=lista_uns(1) -1 // encontrar primeiro '1'
        mant_sd=zeros(1:m+1)
        mant_sd(1:m+2-desloc)=mant_s(desloc:m+1)
        exp_s = SomaBinaria(exp1,dec2binario3(-desloc+1,n),%f)
        soma_bin_nm = [0 exp_s mant_sd(3:m+1)]  
    end   
    if(prt) ;//imprime entradas e matissa deslocada
       printf("e1     = ")
       printfloat_bitoculto(e1,n,m,1)
       printf("e2     = ")
       printfloat_bitoculto(e2,n,m,1)
       if(desloc>=m)  printf("Underflow: deslocamento -> maior que %d\n",m) end 
       printf("mantissa x2 deslocada -> de %d bits\n",desloc)
       printf("e2d    = ")
       printfloat_bitoculto(e2_d,n,m,mant2d(2))
       printf("--------------------\ne2d(c2)= ")
       mant2d_c2 = comple2(mant2d)
       printfloat_bitoculto([e1(2) exp1 mant2d_c2(3:m+1)],n,m,mant2d_c2(2))
       printf("e1     = ")
       printfloat_bitoculto(e1,n,m,1)
       printf("-------------------- +\nsoma_d = ")
       printfloat_bitoculto(soma_d,n,m,mant_s(2))
       if(lista_uns<>[])
            printf("mantissa soma deslocada de <- %d bits\n",desloc-1)
       else
            printf("Underflow: matissa nula após deslocamento <-\n")
       end
       printf("soma   = ")
       printfloat_bitoculto(soma_bin_nm,n,m,1)
    end
 endfunction
 
 function produto=ProdutoFloat(x1,x2,n,m,prt)
       e1=dec2float(x1,n,m)
       e2=dec2float(x2,n,m)
   if  (x1==0)|(x2==0) then //caso especial multiplicação por 0
       ep = [zeros(1:n+m)]
       produto=0.0
   else   
       bias = 2^(n-1) -1;
       exp1_dec = binario2dec(e1(2:n+1)) - bias
       exp2_dec = binario2dec(e2(2:n+1)) - bias
       exp_p = dec2binario(exp1_dec + exp2_dec+bias,n) 
       mant1_dec  = binario2dec4([1 e1(n+2:n+m)],1,m-1)
       mant2_dec  = binario2dec4([1 e2(n+2:n+m)],1,m-1)
       mant_pd    = dec2binario4(mant1_dec*mant2_dec,m,m)
       lista_uns  = find(mant_pd==1) // encontrar primeiro '1' 
       ini        = lista_uns(1)
       desloc = m - ini;
       mant_p=mant_pd(ini+1:ini+m-1)
       exp_p = SomaBinaria(exp_p ,dec2binario3(desloc,n),0)
       sinal_p = (e1(1)|e2(1)) - (e1(1)& e2(1))// xor
       ep= [sinal_p exp_p  mant_p]
       produto=float2dec(ep,n,m),  
   end
   if (prt) then
   printf("x1     = %d\n",x1)
       printf("x2     = %d\n",x2)
       printf("e1     = ")
       printfloat_bitoculto(e1,n,m,1)
       printf("e2     = ")
       printfloat_bitoculto(e2,n,m,1)
       printf("e1.e2  = ")
       printfloat_bitoculto(ep,n,m,1)
       printf("Multiplicação binária (%d,%d)\t= %.10e\n",n,m,produto) 
       printf("Multiplicação exata          \t= %.10e\n",x1*x2) 
   end
endfunction   
