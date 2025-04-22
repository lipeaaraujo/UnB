import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from   PolinomioMiminosQuadrados import *
from   scipy.misc import derivative

def derivada1_atrasada(y,h):
     N=len(y)
     n=np.arange(1,N)
     y1=np.zeros(N)
     y1[n]= (y[n]-y[n-1])/h;
     y1[0]=y1[1]
     return y1

def derivada1_adiantada(y,h):
     N=len(y)
     n=np.arange(0,N-1)
     y1=np.zeros(N)
     y1[n]=(y[n+1]-y[n])/h
     y1[N-1]=y1[N-2]
     return y1
    
def  derivada1_centrada(y,h):
     N=len(y)
     n=np.arange(1,N-1)
     y1=np.zeros(N)
     y1[0]=(y[1]-y[0])/h
     y1[n]=(y[n+1]-y[n-1])/[2*h];
     y1[N-1]=(y[N-1]-y[N-2])/h
     return y1

def Comparacao(x,y,ordem):
     (pv,A,coeff)=PolinomioVandermonde(x,y)
     (pm,A,u)=PolinomioMQ(x,y,ordem)
     xp = np.linspace(3,7,1000)
     plt.plot(xp,pv(xp),linestyle='dashed', color='blue',label="Vandermonde")
     plt.plot(xp,pm(xp),linestyle='dashed', color='red',label="Mínimos Quadrados ordem "+str(ordem))
     plt.legend(loc="upper left")
     plt.grid()
     plt.title('pm=')
     plt.show()
     return  

def plot_derivada1(f,a,b,h):
    N=math.ceil((b-a)/h + 1)
    x=np.linspace(a,b,N)
    y=f(x)
    y1_fw=derivada1_adiantada(y,h);
    y1_bk=derivada1_atrasada(y,h);
    y1_python=derivative(f,x,dx=h);
    plt.plot(x,y1_fw,label="adiantada")  
    plt.plot(x,y1_python,label="python")  
    plt.plot(x,y1_bk,label="atrasada")
    plt.legend(loc="upper right")
    plt.show()
    return

def plot_derivada1_centrada(f,a,b,h):
    N=math.ceil((b-a)/h + 1)
    x=np.linspace(a,b,N)
    y=f(x)
    y1_cen=derivada1_centrada(y,h);
    y1_python=derivative(f,x,dx=h);
    plt.plot(x,y1_cen,label="centrada")  
    plt.plot(x,y1_python,label="python")  
    plt.legend(loc="upper right")
    plt.show()
    return

def derivada2_centrada(y,h):
     N=len(y)
     n=np.arange(1,N-1)
     y2=np.zeros(N)
     y2[n]=(y[n+1]-2*y[n]+y[n-1])/(h**2)
     y2[0]=y2[1];
     y2[N-1]=y2[N-2];
     return y2

def plot_derivada2_centrada(f,a,b,h):
    N=math.ceil((b-a)/h + 1)
    x=np.linspace(a,b,N)
    y=f(x)
    y1_cen=derivada2_centrada(y,h);
    y1_python=derivative(f,x,dx=h,n=2)
    plt.plot(x,y1_cen,label="centrada")  
    plt.plot(x,y1_python,label="python")  
    plt.legend(loc="upper right")
    plt.show()
    return

def derivat_fga(ps):
    a=np.flip(ps.c)
    n=len(a)
    b = a[1:n]*np.arange(1,n)
    ps1=np.poly1d(np.flip(b))
    return ps1

def integral_fga(ps):
    a=np.flip(ps.c)
    n=len(a)
    b = a[0:n]/np.arange(1,n+1)
    b = np.append([0],b)
    ps1=np.poly1d(np.flip(b))
    return ps1

def Test_Derivada_pol(f,a,b,n):
    xi=np.linspace(a,b,n)
    yi=f(xi)  
    if (n<=10):
        ordem =n-1
    else:
        ordem = 9
    if (n<=10):
       (ps,A,u)=PolinomioVandermonde(xi,yi)
    else:
       (ps,A,u)=PolinomioMQ(xi,yi,9)
    print(ps)
    figure, axis = plt.subplots(2, 1)   
    x=np.linspace(a,b,1000)
    axis[0].plot(x,f(x),label="f(x)")
    axis[0].plot(x,ps(x),label="ps(x)")
    axis[0].scatter(xi,yi,label="Ponto de Controle")
    axis[0].legend(loc="lower right")
    axis[0].grid()
    ps1 = derivat_fga(ps)
    axis[1].plot(x,ps1(x),label="ps'(x)")
    axis[1].legend(loc="lower right")
    axis[1].grid()
    plt.show()
    return
