# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import math
import matplotlib.pyplot as plt
from FE_FloatingPoint import * 

def exemplo_truncamento(x,N):
    print("n\tapprox neper\t\terro rel%")
    erro_rel = [1 for i in range(N)]
    neper = 0
    for n in range(0,N): 
        neper=neper + x**n/math.factorial(n)
        erro_rel[n] = abs((neper-np.exp(x))/np.exp(x))
        print("%2d\t%.17f\t%.0e" % (n,neper,erro_rel[n]))
    print("Valor exato\t%.17f" % (np.exp(x)))    
    plt.plot(np.log10(erro_rel))
    plt.grid()
    plt.show()
    return

def soma1_cond(N,n,m):
    x=1.0
    dx = 1.0/N
    S=x
    for i in range (N):
       S=SomaFloat(S,dx,n,m,False)
    S_cond = x + N*dx
    print("Soma iterativa    :", S)
    print("Soma condicionada :", S_cond)
    return

def soma2_cond(N,n,m):
    x=1.0
    dx = 1.0/N
    S=x
    S_cond=dx
    for i in range (N-1):
       S=SomaFloat(S,dx,n,m,False)
       S_cond=SomaFloat(S_cond,dx,n,m,False)
    S_cond = S_cond + x
    S = S + dx
    print("Soma iterativa    :", S)
    print("Soma condicionada :", S_cond)
    return



def baskara_cond(ps,n,m):
    a=np.flip(ps.c).real;
    delta=SomaFloat(a[1]**2,-4*a[2]*a[0],n,m,False);
    r1=SomaFloat(-a[1], + np.sqrt(delta),n,m,False)/(2*a[2])
    r2=SomaFloat(-a[1], - np.sqrt(delta),n,m,False)/(2*a[2])
    r2_cond = a[0]/(r1*a[2])
    return(r1,r2,r2_cond)

def taylor_cond(dx,n,m):
    x=1.0
    y=1/dx * SomaFloat(np.sin(x+dx),-np.sin(x),n,m,False)
    y_cond = np.cos(x)+dx/2*np.sin(x)
    return(y,y_cond)

def trig_cond(x,n,m):
    y=SomaFloat(1.0,-np.cos(x),n,m,False)/np.sin(x)
    y_cond = 2*np.sin(x/2)**2/np.sin(x)
    return(y,y_cond)

def log_cond(x,dx,n,m):
    y=SomaFloat(np.log(x+dx),-np.log(x),n,m,False)
    y_cond = np.log((x+dx)/x)
    return(y,y_cond)

def prodnot_cond(x,n,m):
    y=SomaFloat(np.sqrt(x**2+1),-1,n,m,False)
    y_cond = x**2/SomaFloat(np.sqrt(x**2+1),1,n,m,False)
    return(y,y_cond)



prt=True
b1=np.array([1, 1, 0, 0 ,1, 0, 1, 0, 1,1])
b2=np.array([1, 1, 1 ,0, 0, 1, 0])
