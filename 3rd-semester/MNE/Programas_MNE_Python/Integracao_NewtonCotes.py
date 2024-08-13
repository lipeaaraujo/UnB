# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from fractions import Fraction
from   scipy import integrate

f = lambda x:x**2+10*np.cos(x)
x=np.array([0.0,2.5,5.0,7.5,10.0])
y=np.array([10.00,-1.76,27.84,59.72,91.61])
x=np.array([0.0,2.0,4.0,6.0,8.0,10.0])
y=np.array([10.00,-0.16,9.46,45.60,62.54,91.61])
x=np.array([0.0,1.25,2.5,3.75,5.0,6.25,7.5,8.75,10.0])
y=np.array([10.00,4.72,-1.76,5.86,27.84,49.06,59.72,68.75,91.61])

prt = True
plt1 = False
nc_w=np.array([ [1,     0,      0,     0,      0,      0,      0,      0,      0,     0,      0    ], 
                [1,     1,      0,     0,      0,      0,      0,      0,      0,     0,      0    ],
                [1,     4,      1,     0,      0,      0,      0,      0,      0,     0,      0    ], 
                [1,     3,      3,     1,      0,      0,      0,      0,      0,     0,      0    ], 
                [7,     32,     12,    32,     7,      0,      0,      0,      0,     0,      0    ],
                [19,    75,     50,    50,     75,     19,     0,      0,      0,     0,      0    ],
                [41,    216,    27,    272,    27,     216,    41,     0,      0,     0,      0    ], 
                [751,   3577,   1323,  2989,   2989,   1323,   3577,   751,    0,     0,      0    ],  
                [989,   5888,  -928,   10496, -4540,   10496, -928,    5888,   989,   0,      0    ],
                [2857,  15741,  1080,  19344,  5778,   5778,   19344,  1080,   15741, 2857,   0    ], 
                [16067, 106300,-48525, 272400,-260550, 427368,-260550, 272400,-48525, 106300, 16067]])

nc_a_num=np.array([1,1,1,3, 2,  5,  1,    7,    4,    9,     5])
nc_a_den=np.array([1,2,3,8,45,288,140,17280,14175,89600,299376])

def NewtonCotes_tab(x,y,prt,plt1):
    n=len(x)
    h=x[1]-x[0] #espaçamento
    w=nc_w[n-1,0:n]
    alpha=nc_a_num[n-1]/nc_a_den[n-1]
    I=h*alpha*(y@w)
    if(prt):
        np.set_printoptions(suppress=True)
        print("[x y w y*w]")
        print(np.array([x,y,w,y*w]).transpose())
        print("I=h * alpha * (y*w'')")
        print("I=(%.2f)=(%f/%f)" % (h,nc_a_num[n-1],nc_a_den[n-1]))
        print("(%.2f)=%f" % (y@w,I))
        print("Newton-Cotes %4d pontos   = %f" % (n,I))
    if(plt1):
        t=np.linspace(min(x),max(x),500)
        plt.scatter(x,y)
        (pv,A,c)=PolinomioVandermonde(x,y)
        plt.plot(t,pv(t),label="polinômio")
        plt.fill_between(t, pv(t), step="pre", alpha=0.2)
        plt.legend(loc="upper left")
        plt.title("Newton-Cotes tab "+str(len(x))+ " pontos");
        plt.show()
    return I

def NewtonCotes_semtab(x,y,prt,plt1):
    (pv,A,c)=PolinomioVandermonde(x,y)
    pv_i = pv.integ(1,0)
    I = pv_i(x[-1])-pv_i(x[0])
    if (prt):
        print(pv);
        print("Newton-Cotes-Polinômio %4d pontos = %lf" % (len(x),I))
    if(plt1):
        t=np.linspace(min(x),max(x),500)
        plt.scatter(x,y)
        plt.plot(t,pv(t),label="polinômio")
        plt.fill_between(t, pv(t), step="pre", alpha=0.2)
        plt.legend(loc="upper left")
        plt.title("Newton-Cotes sem/tab "+str(len(x))+ " pontos");
        plt.show()
    return I

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

def NewtonCotes(f,a,b,n,prt,plt1):
    x = np.linspace(a,b,n)
    y = f(x)
    (pv,A,c)=PolinomioVandermonde(x,y)
    pv_i = integral_fga(pv)
    I = pv_i(b)-pv_i(a)
    (I_exata,erro2) = integrate.quad(f, a, b)
    erro = abs((I-I_exata)/I_exata);
    if (prt):
        print(pv);
        print("Newton-Cotes-Polinômio %4d pontos = %lf" % (n,I))
    if(plt1):
        t=np.linspace(a,b,1000)
        plt.scatter(x,y)
        plt.plot(t,f(t),label="função")  
        plt.plot(t,pv(t),label="polinômio")
        plt.fill_between(t, pv(t), step="pre", alpha=0.2)
        plt.legend(loc="upper left")
        plt.title("Newton-Cotes");
        plt.xlabel(str(n) + " pontos, erro=" + "{:.1e}".format(erro))
        plt.show()
    return I

def Test_NewtonCotes(f,a,b):
  (I_exata,erro2) = integrate.quad(f, a, b)
  print("Integral Exata = %f\n",I_exata)
  N=[2,3,4,5,6,7,8,10,15]
  t=np.linspace(a,b,1000)
  figure, axis = plt.subplots(3, 3)
  for i in range (0,3):
    for j in range (0,3):
        n=N[i+3*j]
        x = np.linspace(a,b,n)
        y = f(x)
        (pv,A,c)=PolinomioVandermonde(x,y)
        pv_i = integral_fga(pv)
        I = pv_i(b)-pv_i(a)
        erro = abs((I-I_exata)/I_exata)
        print("Newton-Cotes %4d pontos = %lf" % (n,I),end='')
        print(" erro=%.1e" % (erro))
        axis[j, i].tick_params(axis="x",direction="in", pad=-10)
        axis[j, i].plot(t,f(t),label="função")    
        axis[j, i].plot(t,pv(t),label="polinômio")
        axis[j, i].fill_between(t, pv(t), step="pre", alpha=0.2)
        axis[j, i].legend(loc="upper left")
        axis[j, i].set_title(str(n) + " pontos, erro="
                                    + "{:.1e}".format(erro))
        axis[j, i].scatter(x,y)
  plt.show()
  return



