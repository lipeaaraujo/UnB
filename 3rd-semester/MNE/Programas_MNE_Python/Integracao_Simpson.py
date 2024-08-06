import numpy as np
import matplotlib.pyplot as plt
from   PolinomioInterpolacao import *
from   scipy import integrate

x = np.arange(0,12.5,1.25)
y = np.array([0,0.68,3.44,2.78,5.65,6.15,7.01,9.65,9.01,11.97])
f = lambda x: x + np.sin(3.0*x)
x=np.array([0.0,1.25,2.50,3.75,5.00,6.25,7.50,8.75,10.0]);
y=np.array([0.0,0.68,3.44,2.78,5.65,6.15,7.01,9.65,9.01]);
      
def Trapezios(f,a,b,n,prt):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Trapezios_tab(x,y,prt)
   return I 

def Trapezios_tab(x,y,prt):
   n=len(x)
   h=x[1]-x[0] #espaçamento
   w=np.ones(n)
   w[1:-1]=2
   S = y @ w
   I=(h/2)*S
   np.set_printoptions(precision=8)
   if (prt):
      print("[x y w y*w]")
      print(np.array([x,y,w,y*w]).transpose())
      print("h=%f\nsoma(y*w)=%f\nI=(%f)/2*(%f)\n" % (h,S,h,S))
      print("Integal por Trapézios %4d pontos = %f\n" % (n,I))
   return I

def Plot_Trapezios(f,a,b,n,show):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Plot_Trapezios_tab(x,y,False)
   t = np.linspace(x[0],x[n-1],1000);
   plt.plot(t,f(t))
   (Ie,erro_e)=integrate.quad(f, a, b)
   erro = np.abs((Ie-I)/Ie)
   plt.xlabel("Integral por Trapézios "+str(n)+" pontos, \
   ="+"{:.5f}".format(I)+" erro="+"{:.1e}".format(erro))
   if (show):
      plt.show()
   return I

def Plot_Trapezios_tab(x,y,show):
   I=Trapezios_tab(x,y,True)
   n=len(x)
   for i in range(0,n-1):
     (pv,A,coef)= PolinomioVandermonde(x[i:i+2],y[i:i+2])
     t = np.linspace(x[i],x[i+1],200);
     plt.fill_between(t, pv(t), step="pre", alpha=0.3)
     plt.plot(t,pv(t))
   plt.scatter(x,y)
   plt.grid(True)
   plt.xlabel("Integral por Trapézios " + str(n) \
   + " pontos=" + "{:.5f}".format(I))
   if (show):
      plt.show()
   return I

def Test_Trapezios(f,a,b):
  (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
  print("integral exata = %f" % (Ie))
  k=0
  for n in [2,3,4,5,7,9,15,20,50]:
     k=k+1 
     plt.subplot(3,3,k)
     I=Plot_Trapezios(f,a,b,n,False)
     erro = np.abs((Ie-I)/Ie)   
     print("\nTrapezios com %d pontos = %f" % (n,I))
     plt.title("Trapezios "+str(n)+" pontos"+\
     " erro="+"{:.1e}".format(erro))
     plt.xlabel("")
  plt.show()   
  return
   
def Simpson_13(f,a,b,n,prt):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Simpson_13_tab(x,y,prt)
   return I

def Simpson_13_tab(x,y,prt):
   n=len(x)
   h=x[1]-x[0] #espaçamento
   w=np.ones(n)
   w[1:-1:2]=4
   w[2:-1:2]=2
   S = y @ w
   I=(h/3)*S
   if (prt):
      print("[x y w y*w]")
      print(np.array([x,y,w,y*w]).transpose())
      print("h=%f\nsoma(y*w)=%f\nI=(%f)/3*(%f)\n" % (h,S,h,S))
      print("Integal por Simpson 1/3 %4d pontos = %f\n" % (n,I))
   return I

def Test_Simpson_13(f,a,b):
  (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
  print("integral exata = %f" % (Ie))
  k=0
  for n in [3,5,7,9,11,13,15,21,51]:
     k=k+1 
     plt.subplot(3,3,k)
     I=Plot_Simpson_13(f,a,b,n,False)
     erro = np.abs((Ie-I)/Ie)   
     print("\nSimpson 1/3 com %d pontos = %f" % (n,I))
     plt.title("Simpson 1/3 "+str(n)+" pontos"+\
     " erro="+"{:.1e}".format(erro))
     plt.xlabel("")
  plt.show()
  return I

def Plot_Simpson_13(f,a,b,n,show):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Plot_Simpson_13_tab(x,y,False)
   t = np.linspace(x[0],x[n-1],100);
   plt.plot(t,f(t))
   (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
   erro = np.abs((Ie-I)/Ie)
   plt.xlabel("Integral por Simpson 1/3 "+str(n)+" \
   pontos, ="+"{:.5f}".format(I)+" erro="+"{:.1e}".format(erro))
   if(show):  
      plt.show()
   return I

def Plot_Simpson_13_tab(x,y,show):
   I=Simpson_13_tab(x,y,True)
   n=len(x)
   for i in range(0,n-2,2):
      (pv,A,coef)= PolinomioVandermonde(x[i:i+3],y[i:i+3])
      t = np.linspace(x[i],x[i+2],50);
      plt.fill_between(t, pv(t), step="pre", alpha=0.2)
      plt.plot(t,pv(t))
   plt.scatter(x,y)
   plt.grid(True)
   plt.xlabel("Integral por Simpson 1/3 " + str(n) + \
   " pontos=" + "{:.5f}".format(I))   
   if(show):
      plt.show()
   return I

def Simpson_38(f,a,b,n,prt):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Simpson_38_tab(x,y,prt)
   return I

def Simpson_38_tab(x,y,prt):
   n=len(x)
   h=x[1]-x[0] #espaçamento
   w=np.ones(n)
   w[1:-1:3]=3
   w[2:-1:3]=3
   w[3:-1:3]=2
   S = y @ w
   I=(3*h/8)*S
   if (prt):
      print("[x y w y*w]")
      print(np.array([x,y,w,y*w]).transpose())
      print("h=%f\nsoma(y*w)=%f\nI=3*(%f)/8*(%f)\n" % (h,S,h,S))
      print("Integal por Simpson 3/8 %4d pontos = %f\n" % (n,I))
   return I

def Plot_Simpson_38(f,a,b,n,show):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Plot_Simpson_38_tab(x,y,False)
   t = np.linspace(x[0],x[n-1],100);
   plt.plot(t,f(t))
   (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
   erro = np.abs((Ie-I)/Ie)
   plt.xlabel("Integral por Simpson 3/8 "+str(n)+" pontos, ="\
   +"{:.5f}".format(I)+" erro="+"{:.1e}".format(erro))
   if(show):  
      plt.show()
   return I

def Plot_Simpson_38_tab(x,y,show):
      I=Simpson_38_tab(x,y,True)
      n=len(x)
      for i in range(0,n-3,3):
         (pv,A,coef)= PolinomioVandermonde(x[i:i+4],y[i:i+4])
         t = np.linspace(x[i],x[i+3],200);
         plt.fill_between(t, pv(t), step="pre", alpha=0.2)
         plt.plot(t,pv(t))
      plt.scatter(x,y)
      plt.grid(True)
      plt.xlabel("Integral por Simpson 3/8 " + str(n) \
      + " pontos=" + "{:.5f}".format(I))
      if(show):
        plt.show()
      return I

def Test_Simpson_38(f,a,b):
  (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
  print("integral exata = %f" % (Ie))
  k=0
  for n in [4,7,10,13,16,19,22,25,28]:
     k=k+1 
     plt.subplot(3,3,k)
     I=Plot_Simpson_38(f,a,b,n,False)
     erro = np.abs((Ie-I)/Ie)   
     print("\nSimpson 3/8 com %d pontos = %f" % (n,I))
     plt.title("Simpson 3/8 "+str(n)+" pontos"+\
     " erro="+"{:.1e}".format(erro))
     plt.xlabel("")
  plt.show()
  return I


def Simpson(f,a,b,n,prt):
   x = np.linspace(a,b,n)
   y = f(x)
   I = Simpson_tab(x,y,prt)
   return I

def Simpson_tab(x,y,prt):
   n=len(x)
   if (n%2 ==1):
      I= Simpson_13_tab(x,y,prt)
   elif (n%3==1):
      I= Simpson_38_tab(x,y,prt)
   else:
      Ia=Simpson_13_tab(x[0:n-3],y[0:n-3],prt)
      Ib=Simpson_38_tab(x[n-4:n],y[n-4:n],prt)
      I=Ia+Ib
   if(prt):
        print("\nSimpson 1/3 + 3/8 com %d pontos = %f" % (n,I))
   return I

def Plot_Simpson(f,a,b,n,show):
   x = np.linspace(a,b,n)
   y = f(x)
   I=Plot_Simpson_tab(x,y,False)
   t = np.linspace(x[0],x[n-1],200);
   plt.plot(t,f(t))
   (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
   erro = np.abs((Ie-I)/Ie)   
   plt.xlabel("Integral por Simpson 1/3 + 3/8 "+str(n)+" pontos,\
   ="+"{:.5f}".format(I)+" erro="+"{:.1e}".format(erro))
   if (show):
      plt.show()
   return  I

def Plot_Simpson_tab(x,y,show):
   n=len(x)
   if (n%2 ==1):
      I=Plot_Simpson_13_tab(x,y,False)
   elif (n%3==1):
      I=Plot_Simpson_38_tab(x,y,False)
   else:
      Ia=Plot_Simpson_13_tab(x[0:n-3],y[0:n-3],False)
      Ib=Plot_Simpson_38_tab(x[n-4:n],y[n-4:n],False)
      I=Ia+Ib  
      plt.xlabel("Integral por Simpson 1/3 + 3/8 "+str(n)\
      +" pontos, ="+"{:.5f}".format(I))
      print("\nSimpson 1/3 + 3/8 com %d pontos = %f" % (n,I))
   if (show):
         plt.show()
   return I

def Test_Simpson(f,a,b):
  (Ie,erro_e)=integrate.quadrature(f, a, b,tol=1e-16)
  print("integral exata = %f" % (Ie))
  k=0
  for n in [3,4,5,6,7,8,10,12,14]:
     k=k+1 
     plt.subplot(3,3,k)
     I=Plot_Simpson(f,a,b,n,False)
     erro = np.abs((Ie-I)/Ie)   
     print("\nSimpson 1/3 + 3/8 com %d pontos = %f" % (n,I))
     plt.title("Simpson "+str(n)+" pontos"+" \
     erro="+"{:.1e}".format(erro))
     plt.xlabel("")
  plt.show()   
  return
