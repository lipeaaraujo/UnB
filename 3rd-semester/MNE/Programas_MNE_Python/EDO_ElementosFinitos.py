import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from   PolinomioMiminosQuadrados import *
from   scipy.misc import derivative

fl  = lambda h,x : 2+h         + np.zeros(len(x))
fp  = lambda h,x : 2*h**2*x-4
fu  = lambda h,x : 2-h         + np.zeros(len(x))
fr  = lambda h,x : 2*h**2*np.exp(x)*(x**2+1)

fl  = lambda h,x : -1.0        + np.zeros(len(x))
fp  = lambda h,x : 2+0.01*h**2 + np.zeros(len(x))
fu  = lambda h,x : -1.0        + np.zeros(len(x))
fr  = lambda h,x : 0.2*h**2    + np.zeros(len(x))

fl  = lambda h,x : 2+7*h       + np.zeros(len(x))
fp  = lambda h,x : 24*h**2-4   + np.zeros(len(x))
fu  = lambda h,x : 2-7*h       + np.zeros(len(x))
fr  = lambda h,x : 2*h**2*np.cos(x/20)

def ElementosFinitos_a(a,b,ya,yb,n,fl,fp,fu,fr,prt,plt1):
   #(fl)*y(i-1)+ ( fp)*y(i) + (fu)*y(i+1) = (fr)
    h=(b-a)/(n-1)
    el=np.zeros(n)
    ep=np.zeros(n)
    eu=np.zeros(n)
    r=np.zeros(n)
    x=np.zeros(n)
    y=np.zeros(n)
    i=np.arange(n)
    x=a+i*h
    el = fl(h,x)
    ep = fp(h,x)
    eu = fu(h,x)
    r  = fr(h,x)
    el[n-2] = 0.
    ep[0]   = 1.
    ep[n-1] = 1.
    eu[0]   = 0.
    r[0]    = ya
    r[n-1]  = yb
    y = tridiagonal(el,ep,eu,r)
    if (prt):
        if (n<20): 
            print("[A r]")
            A=np.diag(eu[0:n-1],1)+np.diag(ep[0:n])+np.diag(el[0:n-1],-1)
            C=np.c_[A, r]
            pdtabulate=lambda C:tabulate(C,headers='keys')
            print(pdtabulate(C))
            print("[x y]")
            print(np.array([x,y]).transpose())
        plt.plot(x,y)
        print("h=",h);
        print("y(%.3f)=%.3f dy(%.3f)=%.3f\n"
              % (x[0],y[0],x[0],(-y[2]+4*y[1]-3*y[0])/(2*h)));
        print("y(%.3f)=%.3f dy(%.3f)=%.3f\n"
              % (x[n-1],y[n-1],x[n-1],(3*y[n-1]-4*y[n-2]+y[n-3])/(2*h)));
    if (plt1):
        plt.plot(x,y)
        if (n<20):
            plt.scatter(x,y)
        plt.title("Elementos Finitos "+str(n)+" pontos")
        plt.grid()
        plt.show()
    return (x,y)


def ElementosFinitos(a,b,ya,yb,n,fl,fp,fu,fr,tipo,prt):
   #(fl)*y(i-1)+ ( fp)*y(i) + (fu)*y(i+1) = (fr)
    h=(b-a)/(n-1)
    el=np.zeros(n)
    ep=np.zeros(n)
    eu=np.zeros(n)
    r=np.zeros(n)
    x=np.zeros(n)
    y=np.zeros(n)
    i=np.arange(n)
    x  = a+i*h
    el = fl(h,x)
    ep = fp(h,x)
    eu = fu(h,x)
    r  = fr(h,x)
    if (tipo==1):
        el[n-2] = 0.
        ep[0]   = 1.
        ep[n-1] = 1.
        eu[0]   = 0.
        r[0]    = ya
        r[n-1]  = yb
    elif (tipo==2):
        el[n-2] = el[n-2]+eu[n-2]
        ep[0]   = 1.
        eu[0]   = 0.
        r[0]    = ya
        r[n-1]  = r[n-1] -2*yb*h*eu[n-2]
    elif (tipo==3):
        el[n-2] = 0.
        ep[0]   = 1.
        eu[0]   = eu[0]+el[0]
        r[0]    = r[0]+2*ya*h*el[0]
        r[n-1]  = yb
    elif (tipo==4):
        el[n-2] = el[n-2]+eu[n-2]
        eu[0]   = eu[0]+el[0]
        r[0]    = r[0]+2*ya*h*el[0]
        r[n-1]  = r[n-1] -2*yb*h*eu[n-2]    
    y = tridiagonal(el,ep,eu,r)
    if (prt):
        if (n<20): 
            print("[A r]")
            A=np.diag(eu[0:n-1],1)+np.diag(ep[0:n])+np.diag(el[0:n-1],-1)
            C=np.c_[A, r]
            pdtabulate=lambda C:tabulate(C,headers='keys')
            print(pdtabulate(C))
            print("[x y]")
            print(np.array([x,y]).transpose())
        plt.plot(x,y)
        print("h=%.3f\n" % (h));
        print("y(%.3f)=%.3f dy(%.3f)=%.3f\n" % (x[0],y[0],x[0],(-y[2]+4*y[1]-3*y[0])/(2*h)));
        print("y(%.3f)=%.3f dy(%.3f)=%.3f\n" % (x[n-1],y[n-1],x[n-1],(3*y[n-1]-4*y[n-2]+y[n-3])/(2*h)));
    return (x,y)
