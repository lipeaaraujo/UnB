
# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from fractions import Fraction
import scipy.integrate as integrate

prt = True
plt1 = False

gauss_z=np.array([
    [           0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.57735027, 0.57735027,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.77459667,          0, 0.77459667,          0,          0,          0,          0,          0,          0,          0,          0],
    [ -0.86113631,-0.33998104, 0.33998104, 0.86113634,          0,          0,          0,          0,          0,          0,          0],
    [ -0.90617985,-0.53846931,          0, 0.53846931, 0.90617985,          0,          0,          0,          0,          0,          0],
    [ -0.93246951,-0.66120939,-0.23861918, 0.23861918, 0.66120939, 0.93246951,          0,          0,          0,          0,          0],
    [ -0.94910791,-0.74153119,-0.40584515,          0, 0.40584515, 0.74153119, 0.94910791,          0,          0,          0,          0],
    [ -0.96028986,-0.79666648,-0.52553241,-0.18343464, 0.18343464, 0.52553241, 0.79666648, 0.96028986,          0,          0,          0],
    [ -0.96816024,-0.83603111,-0.61337143,-0.32425342,          0, 0.32425342, 0.61337143, 0.83603111, 0.96816024,          0,          0],
    [ -0.97390653,-0.86506337,-0.67940957,-0.43339539,-0.14887434, 0.14887434, 0.43339539, 0.67940957, 0.86506337, 0.97390653,          0],
    [ -0.97822866,-0.88706250,-0.73015201,-0.51909613,-0.26954316,          0, 0.26954316, 0.51909613, 0.73015201, 0.88706250, 0.97822866]])
    
gauss_w=np.array([
    [          2,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [          1,          1,          0,          0,          0,          0,          0,          0,          0,          0,          0],
    [ 0.55555555, 0.88888889, 0.55555555,          0,          0,          0,          0,          0,          0,          0,          0],
    [ 0.34785485, 0.65214515, 0.65214515, 0.34785485,          0,          0,          0,          0,          0,          0,          0],
    [ 0.23692689, 0.47862867, 0.56888889, 0.47862867, 0.23692689,          0,          0,          0,          0,          0,          0],
    [ 0.17132449, 0.36076157, 0.46791393, 0.46791393, 0.36076157, 0.17132449,          0,          0,          0,          0,          0],
    [ 0.12948497, 0.27970539, 0.38183005, 0.41795918, 0.38183005, 0.27970539, 0.12948497,          0,          0,          0,          0],
    [ 0.10122854, 0.22238103, 0.31370665, 0.36268378, 0.36268378, 0.31370665, 0.22238103, 0.10122854,          0,          0,          0],
    [ 0.08127439, 0.18064816, 0.26061070, 0.31234708, 0.33023936, 0.31234708, 0.26061070, 0.18064816, 0.08127439,          0,          0],
    [ 0.06667134, 0.14945135, 0.21908636, 0.26926672, 0.29552422, 0.29552422, 0.26926672, 0.21908636, 0.14945135, 0.06667134,          0],
    [ 0.05566857, 0.12558037, 0.18629021, 0.23319376, 0.26280454, 0.27292508, 0.26280454, 0.23319376, 0.18629021, 0.12558037, 0.05566857]])

def QuadraturaGauss_tab(f,a,b,n,prt,plt1):
    z= gauss_z[n-1,0:n];
    w = gauss_w[n-1,0:n];
    xi= (b-a)/2*z+(b+a)/2
    yi=f(xi);
    wi = w* (b-a)/2
    I = yi@wi
    (I2,erro2) = integrate.quad(f, a, b)
    erro=abs((I-I2)/I2)
    if (prt):
        np.set_printoptions(suppress=True)
        print("Quadratura Gauss %4d pontos = %f erro=%.1e%%\n" % (n,I,erro))
        print("[z  xi w  wi  yi]")
        np.set_printoptions(precision=3)
        print(np.array([z, xi, w, wi, yi]).transpose())
    if (plt1):
        plt.scatter(xi,yi)
        t=np.linspace(a,b,1000)
        plt.plot(t,f(t));
        plt.fill_between(t, f(t), step="pre", alpha=0.2)
        plt.title("Quadratura de Gauss Tabela");
        plt.xlabel(str(n) + " pontos, erro=" + "{:.1e}".format(erro))
        plt.show()
    return I

def QuadraturaGauss(f,a,b,n,prt,plt1):
    (z,w)=raizesLegendre(n)
    xi= (b-a)/2*z+(b+a)/2
    yi=f(xi);
    wi = w* (b-a)/2
    I = yi@wi
    (I2,erro2) = integrate.quad(f, a, b)
    erro=abs((I-I2)/I2)
    if (prt):
        np.set_printoptions(suppress=True)
        print("Quadratura Gauss %4d pontos = %f erro=%.1e%%\n" % (n,I,erro))
        print("[z  xi w  wi  yi]")
        np.set_printoptions(precision=3)
        print(np.array([z, xi, w, wi, yi]).transpose())
    if (plt1):
        plt.scatter(xi,yi)
        t=np.linspace(a,b,1000)
        plt.plot(t,f(t));
        plt.fill_between(t, f(t), step="pre", alpha=0.2)
        plt.title("Quadratura de Gauss");
        plt.xlabel(str(n) + " pontos, erro=" + "{:.1e}".format(erro))
        plt.show()
    return I

def legendre_rec(n,prt):
     ps  =   []
     ps.append(np.poly1d([0]))
     ps.append(np.poly1d([1]))
     ps.append(np.poly1d([1,0]))
     if (prt):
         print(ps[1])
         print(ps[2])
     for k in range (2,n+1):
        index=k+1
        ps_temp = ((2*k-1)*ps[2]*ps[index-1] - (k-1)*ps[index-2])/(k)
        if (prt):
            print(ps_temp)
        ps.append(ps_temp)
     ps_n=ps[n+1]
     return (ps_n,ps)

def raizesLegendre(n):
    (ps,ps_list)=legendre_rec(n,False)
    teta=np.pi*(n-np.arange(1,n+1)+3/4)/(n+1/2)#Francesco Tricomi
    z=(1-1/(8*n**2)+1/(8*n**3))*np.cos(teta) #primeira estimativa raiz
    erro=1
    for i in range (1,200): #Newton-Raphson para encontrar raizes z
        z0=z;
        fz=ps(z)
        ps1 = ps.deriv(1)
        dfz=ps1(z)
        z=z0-fz/dfz;
        erro = np.linalg.norm(z-z0)/np.linalg.norm(z,1)
        if (erro<1e-16):
              break;
    w=(2.)/((1-z**2.)*dfz**2.); #pesos
    return (z,w)
