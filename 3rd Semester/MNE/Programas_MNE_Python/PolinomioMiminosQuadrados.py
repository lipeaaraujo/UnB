import numpy as np
import matplotlib.pyplot as plt
import io
from   scipy import linalg
from   AL_EliminacaoGauss import *
from   tabulate import tabulate
from   PolinomioInterpolacao import *

x=np.array([3.0,4.5,6.0,9.0])
y=np.array([5.0,7.1,8.7,10.0])
A=np.array([[2,1,-3],[-1,3,2],[3,1,-3]])

x=np.array([1,2,4,7,11]);
y=np.array([2,5,7,6,1]);

x=np.array([0.1,0.12,0.15,0.19,0.25,0.39,0.59,0.62,0.82,1.5,2.6,4.2,5.9,6.9,8.5,9])
y=np.array([0.5,0.6,0.75,0.81,1.3,1.6,2.4,2.35,2.95,4.1,5.8,6.4,7.7,7.6,8.25,8.3])

x=np.array([0,1,1.5,3,3.2,4,5.5,6.4,7.8,9.9])
y=np.array([2.3,2.9,4.1,6.1,6.8,8.2,14.6,17.3,30,70.3])

x=np.array([3.0,3.3,3.9,4.3,4.7,5.3,5.9,6.1,6.3,6.6,7.0])
y=np.array([0,2,1,5,5,8,9,13,14,20,22])

def PolinomioMQ(x,y,ordem):
    x = x. astype(np. float64)
    y = y. astype(np. float64)
    N = len(x)
    M=ordem+1
    A = np.zeros((N,M))
    for k in range(M):
        A[:,k]=x**k
    u=EliminacaoGauss(A.transpose()@A,A.transpose()@y,False,True)
    pm = np.poly1d(u[-1::-1])
    return (pm,A,u)


def Programa1(x,y,ordem):
    N = len(x)
    M=ordem+1
    A = np.zeros((N,M))
    for k in range(M):
        A[:,k]=x**k
    u=np.linalg.inv(A.transpose()@A) @ (A.transpose()@y)
    return u


def Plot_PolinomioMQ(x,y,ordem):
    (pm,A,u)=PolinomioMQ(x,y,ordem)
    (N,M)=A.shape
    print("Matriz Aumentada [(A' A)|(A' y))]")
    C = np.insert(A.transpose()@A, M, A.transpose()@y, axis=1)
    print(C)
    print("Coeficientes u=inv(A' A)*(A' y))")
    print(u)
    print("Polinômio Mínimos Quadradros ordem %d\npm=" % (ordem));
    print(pm)
    St = sum( (y-np.mean(y))**2 ); #goodness of fitness
    Sr = sum( (y-A@u)**2 );
    r2= abs(St-Sr)/St
    print("r2=%.1f%%\tr=%.3f\n" % (r2*100,np.sqrt(r2)) );
    xp=np.linspace(min(x),max(x),1000);
    yp=pm(xp)
    plt.plot(xp,yp)
    plt.grid()
    plt.scatter(x,y)
    plt.title("Polinômio de Mínimos Quadrados");
    plt.show()
    return

def Plot_Figura(x,y,ordem):
    (pv,A,coeff)=PolinomioVandermonde(x,y)
    (pm,A,u)=PolinomioMQ(x,y,ordem)
    xp=np.linspace(3,7,1000)
    plt.plot(xp,pv(xp),linestyle="dashed",label="Vandermonde")
    plt.plot(xp,pm(xp),label=str(pm))
    plt.scatter(x,y)
    plt.grid()
    plt.legend(loc="upper left")
    plt.xlim(2.5, 7.5)
    plt.ylim(-5, 25.5)
    plt.show()
    return


def   MQL(x,y):
      n=len(x)
      A=np.array([[n,sum(x)],[sum(x),sum(x**2)]])
      b=np.array([sum(y),sum(x*y)])
      u=linalg.solve(A,b)
      a0=u[0]
      a1=u[1]
      return(a0,a1, A, b)

def plot_MQL(x,y):
    (a0,a1, A, b)=MQL(x,y)
    St = sum( (y-np.mean(y))**2 );
    Sr = sum( (y-a0-a1*x)**2 );
    r2= abs(St-Sr)/St
    (N,M)=A.shape
    C = np.insert(A, M, b, axis=1)
    print("Matriz Aumentada [(A)|(b))]")
    print(C)
    print("y=%.3f+%.3f*x" % (a0,a1))
    print("r2=%.1f%%\tr=%.3f" % (r2*100,np.sqrt(r2)));
    xp=np.linspace(min(x),max(x),1000);
    plt.plot(xp,a0+a1*xp)
    plt.grid()
    plt.scatter(x,y)
    plt.title("Mínimos Quadrados Linear");
    plt.show()
    return
