prt = %t
plt = %t
// deff ('y=f(x)' , 'y=x*sin(x)')

function I=Trapezios_tab(x,y)
   n=length(x)   //função tabular (xi,yi)
   h=x(2)-x(1); //espaçamento
   w=[1 2*ones(2:n-1)  1]
   S=y*w';
   I=(h/2)*S
endfunction


function Plot_Trapezios_tab(x,y)
   n=length(x)   //função tabular (xi,yi)
   h=x(2)-x(1); //espaçamento
   w=[1 2*ones(2:n-1)  1]
   S=y*w';
   I=(h/2)*S
   printf("[x y w y*w]")
   disp([x' y' w' (y.*w)'])
   printf("h=%f\nsoma(y*w)=%f\nI=(%f)/2*(%f)\n",h,S,h,S)
   printf("Integal por Trapézios %4d pontos = %f\n",n,I)
   for i=1:n-1   
     u=PolinomioVandermonde(x(i:i+1),y(i:i+1))
     N=10
     xi=linspace(x(i),x(i+1),N);
     yi=horner_fga(u,xi)
     cor=[2,3,4,5,6,7,10,12,14,17,21,23,26,27,29,32]
     for (j=1:N-1)
       xfpoly([xi(j) xi(j) xi(j+1) xi(j+1) xi(j) ],...
        [0 yi(j) yi(j+1) 0 0 ],-cor(modulo(i,length(cor))+1))
     end  
     plot2d(xi,yi)
     plot([x(i) x(i)],[0 y(i)],'bk')
   end
   scatter(x,y) 
   xgrid()
   xtitle("Integral por Trapézios "+string(n)+" pontos="+string(I))
endfunction

function I=Trapezios(f,a,b,n)
    // integral de f no intervalo [a,b]
    h=(b-a)/(n-1); 
    x=a:h:a+(n-1)*h;
    y=f(x)
    I=Trapezios_tab(x,y)
endfunction

function Plot_Trapezios(f,a,b,n)
    h=(b-a)/(n-1); // integral de f no intervalo [a,b]
    x=a:h:a+(n-1)*h;
    y=f(x)
    I=Trapezios_tab(x,y)
    Plot_Trapezios_tab(x,y)
    I2=intg(a,b,f);
    erro=abs((I2-I)/I2)*100
    printf("integral exata = %f\nerro=%f%%\n",I2,erro)
    xp=linspace(a,b,1000)
    plot(xp,f(xp),'bk','LineWidth',3)
endfunction

function Test_Trapezios(f,a,b)
  I2=intg(a,b,f);
  printf("integral exata = %f\n",I2)
  k=0
  for (n=[2,3,4,5,7,9,15,20,50]) //n número de pontos
     k=k+1 
     subplot(3,3,k)
     t=linspace(a,b,100)
     plot(t,f(t),'--r')
     I=Trapezios(f,a,b,n)
     Plot_Trapezios(f,a,b,n)
     erro=abs((I2-I)/I2)*100
     str=sprintf("%4d pontos = %f  erro=%.3f%%\n",n,I,erro)
     xtitle(str)
   end
endfunction


function I=Simpson_13_tab(x,y)
   n=length(x)
   h=x(2)-x(1); //espaçamento
   w=ones(1:n);
   w(2:2:n-1)=4;
   w(3:2:n-1)=2
   S=y*w'
   I=(h/3)*S
endfunction


function Plot_Simpson_13_tab(x,y)
   n=length(x)
   h=x(2)-x(1); //espaçamento
   w=ones(1:n);
   w(2:2:n-1)=4;
   w(3:2:n-1)=2
   S=y*w'
   I=(h/3)*S
       printf("[x y w y*w]")
       disp([x' y' w' (y.*w)'])
       printf("h=%f\nsoma(y*w)=%f\nI=(%f)/3*(%f)\n",h,S,h,S)
       printf("Integal %d pontos = %f\n",n,I)
       for i=1:2:n-2   
         u=PolinomioVandermonde(x(i:i+2),y(i:i+2))
         N=20
         xi=linspace(x(i),x(i+2),N);
         yi=horner_fga(u,xi)
         cor=[2,3,4,5,6,7,10,12,14,17,21,23,26,27,29,32]
         for (j=1:N-1)
            xfpoly([xi(j) xi(j) xi(j+1) xi(j+1) xi(j) ],...
            [0 yi(j) yi(j+1) 0 0 ],-cor(modulo(i,length(cor))+1))
         end           
         plot2d(xi,yi)
         plot([x(i) x(i)],[0 y(i)],'bk')
       end
       scatter(x,y)
       xgrid()
       gca.data_bounds = [min(x),min([y 0]);max(x),max([y,0])];
       xtitle("Integral por Simpson 1/3 "+string(n)+" pontos="+string(I))
endfunction
    
   
function I=Simpson_13(f,a,b,n) 
   h=(b-a)/(n-1); //espaçamento
   x=a:h:a+(n-1)*h;
   y=f(x)
   I=Simpson_13_tab(x,y)
endfunction
    
function Plot_Simpson_13(f,a,b,n) 
   h=(b-a)/(n-1); //espaçamento
   x=a:h:a+(n-1)*h;
   y=f(x)
   I=Simpson_13_tab(x,y)
   Plot_Simpson_13_tab(x,y)
   I2=intg(a,b,f);
   erro=abs((I2-I)/I2)*100
   printf("integral exata = %f\nerro=%f%%\n",I2,erro)
   xp=linspace(a,b,1000)
   plot(xp,f(xp),'bk','LineWidth',3)
endfunction    
    
function I=Test_Simpson_13(f,a,b)
   I2=intg(a,b,f);
   printf("integral exata = %f\n",I2)
   k=0
   //for (n=[3,5,9,15,21,31,41,51,61])
   for (n=[3,5,7,9,11,13,15,21,51])
     k=k+1 
     subplot(3,3,k)
     t=linspace(a,b,100)
     plot(t,f(t),'--r')
     I=Simpson_13(f,a,b,n)
     Plot_Simpson_13(f,a,b,n)
     erro=abs((I2-I)/I2)*100
     str=sprintf("%4d pontos = %f  erro=%.4f%%\n",n,I,erro)
     xtitle(str)
   end
endfunction

function [I,Ia,Ib]=Simpson_tab(x,y)
  Ia=0;
  Ib=0;
  n=length(x)
  if modulo(n,2)==1
    Ia=Simpson_13_tab(x,y)
  else
    if (n>4) 
      Ia=Simpson_13_tab(x(1:n-3),y(1:n-3))
    end 
    Ib=NewtonCotes_tab(x(n-3:n),y(n-3:n));
  end
  I=Ia+Ib
endfunction

function Plot_Simpson_tab(x,y)
  Ia=0;
  Ib=0;  
  n=length(x)
  if modulo(n,2)==1
    Ia=Simpson_13_tab(x,y)
    Plot_Simpson_13_tab(x,y)
  else
    h=x(2)-x(1); //espaçamento
    if (n>4) 
      Ia=Simpson_13_tab(x(1:n-3),y(1:n-3))
      Plot_Simpson_13_tab(x(1:n-3),y(1:n-3))
    end 
    Ib=NewtonCotes_tab(x(n-3:n),y(n-3:n));
    Plot_NewtonCotes_tab(x(n-3:n),y(n-3:n));
    printf("\nSimpson 1/3 + 3/8 com %d pontos = %f\n",n,I)
    xtitle("Simpson 1/3+3/8 "+string(n)+" pontos="+string(I))
    gca.data_bounds = [min(x),min([y 0]);max(x),max([y,0])];
  end
  I=Ia+Ib
endfunction 

function [I,Ia,Ib]=Simpson(f,a,b,n)
    // integral de f no intervalo [a,b]
    h=(b-a)/(n-1); 
    x=a:h:a+(n-1)*h;
    y=f(x)
    [I,Ia,Ib]=Simpson_tab(x,y)
endfunction

function Plot_Simpson(f,a,b,n)
    h=(b-a)/(n-1); // integral de f no intervalo [a,b]
    x=a:h:a+(n-1)*h;
    y=f(x)
    I=Simpson_tab(x,y)
    Plot_Simpson_tab(x,y)
    I2=intg(a,b,f);
    erro=abs((I2-I)/I2)*100
    printf("integral exata = %ferro=%f%%\n",I2,erro) 
    xp=linspace(a,b,1000)
    plot(xp,f(xp),'bk','LineWidth',3)
    scatter(x,y)
endfunction  

function I=Test_Simpson(f,a,b)
  I2=intg(a,b,f);
  printf("integral exata = %f\n",I2)
  k=0
  for (n=[3,4,5,6,7,8,10,12,14]) //n número de pontos
     k=k+1 
     subplot(3,3,k)
     t=linspace(a,b,100)
     plot(t,f(t),'--r')
     I=Simpson(f,a,b,n)
     Plot_Simpson(f,a,b,n)
     erro=abs((I2-I)/I2)*100
     str=sprintf("%4d pontos = %f  erro=%.3f%%\n",n,I,erro)
     xtitle(str)
   end 
endfunction  
