import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from   PolinomioMiminosQuadrados import *
from   scipy.misc import derivative

g  = lambda x,y: (-4*y+x*y+2*x-1)/3
g2 = lambda x,y,u: u-x*y+np.exp(x)*(x**2+1)
w = lambda t:8*np.exp(-2*t)
g2 = lambda t,y,u: -7*u-6*y+6*w(t)

def edo_euler(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1))
    for i in range (0,n-1):
        phi[i] = g(x[i], y[i]);
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print("   i    x(i)  phi(i)   y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
              x,
              np.append(phi,[np.nan]),
              y]).transpose())
    return (x,y)

def edo_heun(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1))
    for i in range (0,n-1):
        k1[i] = g(x[i], y[i]);
        k2[i] = g(x[i]+h, y[i]+k1[i]*h);
        phi[i] = (k1[i]+k2[i])/2.0;
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print("   i    x(i)  phi(i)   y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
              x,
              np.append(phi,[np.nan]),
              y]).transpose())
    return (x,y)

def edo_midpoint(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1)) 
    for i in range (0,n-1):
        k1[i] = g(x[i], y[i]);
        k2[i] = g(x[i]+h/2, y[i]+k1[i]*h/2);
        phi[i] = k2[i];
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print("   i    x(i)   phi(i)   y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
              x,
              np.append(phi,[np.nan]),
              y]).transpose())
    return (x,y)

def edo_ralston(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1)) 
    for i in range (0,n-1):
        k1[i] = g(x[i], y[i]);
        k2[i] = g(x[i]+3/4*h, y[i]+3/4*k1[i]*h);
        phi[i] = (k1[i]+2*k2[i])/3;
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print("   i    x(i)   phi(i)   y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
                        x,
                        np.append(phi,[np.nan]),
                        y]).transpose())
    return (x,y)

def runge_kutta3(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    k3=np.zeros(n-1)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1))
    for i in range (0,n-1):
        k1[i] = g(x[i], y[i]);
        k2[i] = g(x[i]+1/2*h, y[i]+1/2*k1[i]*h);
        k3[i] = g(x[i]+h, y[i]+(2*k2[i]-k1[i])*h);
        phi[i] = (k1[i]+4*k2[i]+k3[i])/6;
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print(" i  x(i) phi(i) y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
                        x,
                        np.append(phi,[np.nan]),
                        y]).transpose())
    return (x,y)

def runge_kutta4(g,a,b,ya,n,prt):
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    k3=np.zeros(n-1)
    k4=np.zeros(n-1)
    phi=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1))
    for i in range (0,n-1):
        k1[i] = g(x[i], y[i]);
        k2[i] = g(x[i]+1/2*h, y[i]+1/2*k1[i]*h);
        k3[i] = g(x[i]+1/2*h, y[i]+1/2*k2[i]*h);
        k4[i] = g(x[i]+h, y[i]+k3[i]*h)
        phi[i] = (k1[i]+2*k2[i]+2*k3[i]+k4[i])/6;
        y[i+1]=y[i]+phi[i]*h
    if (prt):
        print(" i  x(i) phi(i) y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
              x,
              np.append(phi,[np.nan]),
              y]).transpose())
    return (x,y)

def Runge_Kutta4_EDO_2a_Ordem(g2,a,b,ya,dya,n,prt):
    g1 = lambda u: u
    h=(b-a)/(n-1);
    x=np.linspace(a,b,n)
    k1=np.zeros(n-1)
    k2=np.zeros(n-1)
    k3=np.zeros(n-1)
    k4=np.zeros(n-1)
    m1=np.zeros(n-1)
    m2=np.zeros(n-1)
    m3=np.zeros(n-1)
    m4=np.zeros(n-1)
    phi_m=np.zeros(n-1)
    phi_k=np.zeros(n-1)
    y = np.append([ya], np.zeros(n-1)) 
    u = np.append([dya], np.zeros(n-1)) 
    for i in range (0,n-1):
        m1 = g1(u[i])
        k1 = g2(x[i], y[i], m1);
        m2 = g1(u[i]+1/2*k1*h)
        k2 = g2(x[i]+1/2*h, y[i]+1/2*m1*h,m2);
        m3 = g1(u[i]+1/2*k2*h)
        k3 = g2(x[i]+1/2*h, y[i]+1/2*m2*h,m3);
        m4 = g1(u[i]+k3*h)          
        k4 = g2(x[i]+h, y[i]+m3*h,m4)
        phi_m = (m1+2*m2+2*m3+m4)/6;
        y[i+1]=y[i]+phi_m*h
        phi_k = (k1+2*k2+2*k3+k4)/6;
        u[i+1]=u[i]+phi_k*h
    if (prt):
        print(" i  x(i) u(i) y(i)")
        np.set_printoptions(precision=5)
        np.set_printoptions(suppress=True)
        print(np.array([np.arange(n),
              x,
              u,
              y]).transpose())
    return (x,y)
