# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import math
import cmath
import matplotlib.pyplot as plt

prt=False
pivot=False
A=np.array([[2,1,3,5],[-1,3,2,7],[3,1,-3,2],[-4,-2,1,5]])
b=np.array([4,3,2,-3])
A = np.array([[2,1,3],[-1,3,2],[3,1,-3]])
b = np.array([4,3,2])
A=np.array([[3,2],[-1,2]])
b=np.array([18,2])
du=np.array([3,7,3,2,1,5,3,9,8,24,12,6,7,8]);
dp=np.array([1,3,5,3,4,6,7,5,3,5,6,8,10,7,14]);
dl=np.array([7,9,4,1,2,34,32,65,23,12,12,5,9,3]);
A=np.diag(dp)+np.diag(du,1)+np.diag(dl,-1)


def Plot_Sistema3(a,b,c):
    x_range = np.arange(0,10)
    y_range = np.arange(0,9)
    x,y = np.meshgrid(x_range,y_range)
    equa1 = a*x+b*y
    cs = plt.contour(x,y,equa1,[c],colors='r');
    cs.clabel(fontsize=12, inline=1, fmt='%.2f')
    return


def Plot_Sistema2(A,b):
    x_range = np.arange(0,10)
    y_range = np.arange(0,9)
    x,y = np.meshgrid(x_range,y_range)
    equa1 = A[0,0]*x+A[0,1]*y
    equa2 = A[1,0]*x+A[1,1]*y
    cs = plt.contour(x,y,equa1,[b[0]],colors='r');
    cs.clabel(fontsize=12, inline=1, fmt='%.2f')
    cs= plt.contour(x,y,equa2,[b[1]],colors='b');
    cs.clabel(fontsize=12, inline=1, fmt='%.2f')
    sol = np.linalg.solve(A,b)
    print(sol)
    if (sol[0]!=np.nan):
        plt.scatter(sol[0],sol[1])
        str_sol = '['+"{:.4f}".format(sol[0])+','"{:.4f}".format(sol[1])+']'
        plt.annotate(str_sol,
                     (sol[0],sol[1]),horizontalalignment='right')
    plt.show()
    return

def cofat2(A):
    N = len(A)
    Cof = np.zeros((N,N))
    for col in range(N):
        for lin in range(N):
            Dij = np.delete(A, lin,   0)
            Dij = np.delete(Dij, col, 1)
            Cof[lin,col] = (-1)**(lin+col)*np.linalg.det(Dij);
    return Cof

def adjunta2(A):
    Cof=cofat2(A)
    Adj = Cof.transpose()
    return Adj

def inv_cofat2(A):
    Adj=adjunta2(A)
    Ai=(1/np.linalg.det(A))*Adj;
    return Ai

def det_cofat(A):
    N = len(A)
    if N==1:
        return A
    cof = np.zeros(N)
    for col in range(N):
        D = np.delete(A, 0,   0)
        D = np.delete(D, col, 1)
        cof[col] = ((-1)**(col))*det_cofat(D);
    d = A[0,:]@cof
    return d

def cofat(A):
    N = len(A)
    Cof = np.zeros((N,N))
    for col in range(N):
        for lin in range(N):
            Dij = np.delete(A, lin,   0)
            Dij = np.delete(Dij, col, 1)
            Cof[lin,col] = (-1)**(lin+col)*det_cofat(Dij);
    return Cof

def adjunta(A):
    Cof=cofat(A)
    Adj = Cof.transpose()
    return Adj

def inv_cofat(A):
    Adj=adjunta(A)
    Ai=(1/det_cofat(A))*Adj;
    return Ai

def ResolucaoDireta(A,b):
    x=inv_cofat(A,prt) @ b  
    return x

def Cramer(A,b,prt):
    N = len(A)
    C=np.c_[A, b]
    D=det_cofat(A)
    x = np.zeros(N)
    if (prt): 
        print("Matriz Aumentada [C=A|b] det(A)=%f" % (D))
        print(C)
    for k in range(0,N):
        Ak=A.copy()
        Ak[:,k]=b #substitui coluna k por vetor b
        Dk=det_cofat(Ak)
        x[k]=Dk/D
        if (prt):
            print("Matriz A%d   det(A%1d)=%f" % (k,k,Dk))
            print(Ak)
            print("x(%d)=%f/%f=%f\n" % (k,Dk,D,x[k]))
    return x
