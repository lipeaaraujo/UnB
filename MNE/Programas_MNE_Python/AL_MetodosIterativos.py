import numpy as np
import math
import cmath
from scipy.signal import hilbert, chirp
import matplotlib.pyplot as plt
from   AL_CofatoresCramer import *
from   AL_EliminacaoGauss import *

A=np.array([[3,2],[-1,2]])
b=np.array([18,2])
A = np.array([[8,2,4],[1,11,3],[5,3,10]])
b=np.array([9,18,72])

def Plot_Sistema(A,b):
    x_range = np.arange(0,10)
    y_range = np.arange(0,9)
    x,y = np.meshgrid(x_range,y_range)
    equa1 = A[0,0]*x+A[0,1]*y
    equa2 = A[1,0]*x+A[1,1]*y
    cs = plt.contour(x,y,equa1,[b[0]],colors='r');
    cs.clabel(fontsize=12, inline=1, fmt='%.2f')
    cs= plt.contour(x,y,equa2,[b[1]],colors='b');
    cs.clabel(fontsize=12, inline=1, fmt='%.2f')
    sol = EliminacaoGauss(A,b,False,True)
    print(sol)
    if (sol[0]!=np.nan):
        plt.scatter(sol[0],sol[1])
        str_sol = '['+"{:.4f}".format(sol[0])+','"{:.4f}".format(sol[1])+']'
        plt.annotate(str_sol,
                     (sol[0],sol[1]),horizontalalignment='right')
    plt.show()
    return

def hilbert(n):
    H = np.arange(1, n+1) + np.arange(0, n)[:, np.newaxis]
    H=inv_gauss(1/H,False)
    pdtabulate=lambda H:tabulate(H,headers='keys')
    np.set_printoptions(precision=9)
    print(pdtabulate(H))
    return H

def GaussJacobi(A,b,x_ini,tol,prt):
     N = len(b);
     erro_lista=[]
     erro=np.nan
     erro_lista.append(erro)
     x1=np.zeros(N)
     x0=np.array(x_ini,dtype="float64")
     if (prt):
        print("Matriz Aumentada [A,b]")
        print(np.c_[A, b])
        print("k\t\t[x]\t\t\terro")
        np.set_printoptions(precision=4)
        print(str(0)+' ['+', '.join('{:.8f}'.format(i) for i in x0)+'] ' +'{:.1e}'.format(erro))
     for k in range (1,500):
        for j in range (N):
            x1[j]=(b[j]- A[j,:]@x0 + A[j,j]*x0[j])/A[j,j]
        if(np.linalg.norm(x1)!=0):
            erro=np.linalg.norm(x1-x0)/np.linalg.norm(x1)
        x0[:]=x1[:]
        #x0=x1
        if (prt):
            print(str(k)+' ['+', '.join('{:.8f}'.format(i) for i in x0)+'] ' +'{:.1e}'.format(erro))
        erro_lista.append(erro)
        if  (erro<tol):
            break
     if (prt):
        print("\nSolução x=",' [',', '.join('{:.8f}'.format(i) for i in x0),']')
        print ('após %i iterações com erro=%.1e\n' % (k,erro))
     return (x1,erro_lista)

        #plt.plot(np.log10(erro_lista),label="Gauss Jacobi")
        #plt.legend(loc="upper right");
        #plt.grid()
        #plt.show()

def GaussSeidel(A,b,x_ini,tol,prt):
     N = len(b);
     erro_lista=[]
     erro=np.nan
     erro_lista.append(erro)
     x1=x0=np.zeros(N)
     x0=x_ini
     if (prt):
        print("Matriz Aumentada [A,b]")
        print(np.c_[A, b])
        print("k\t\t[x]\t\t\terro")
        np.set_printoptions(precision=4)
        print(str(0)+' ['+', '.join('{:.8f}'.format(i) for i in x0)+'] ' +'{:.1e}'.format(erro))
     for k in range (1,500):
        for j in range (N):
            x1[j]=(b[j]-A[j,:]@x1+A[j,j]*x1[j])/A[j,j]
        if(np.linalg.norm(x1)!=0):
            erro=np.linalg.norm(x1-x0)/np.linalg.norm(x1)
        x0[:]=x1[:]
        if (prt):
            print(str(k)+' ['+', '.join('{:.8f}'.format(i) for i in x0)+'] ' +'{:.1e}'.format(erro))
        erro_lista.append(erro)
        if  (erro<tol):
            break
     if (prt):
        print("\nSolução x=",' [',', '.join('{:.8f}'.format(i) for i in x0),']')
        print ('após %i iterações com erro=%.1e\n' % (k,erro))
     return (x1,erro_lista)
