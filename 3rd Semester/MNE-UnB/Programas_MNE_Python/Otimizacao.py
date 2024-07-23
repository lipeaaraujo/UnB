# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import matplotlib.pyplot as plt
from   Raizes_MetodosIntervalares import *
from   Derivação import *


f = lambda x : np.exp(np.sin(2*x)-3*np.sin(3*x))
f = lambda x,y: np.exp(np.sin(2*x-y)-3*np.sin(3*x)*np.cos(2*y))
inclinacao=20
azimute=240;
box=np.array([3,7,-2,2])
n=50;

def busca_linear(a,b,c,N):
    f = lambda x,y : a*x+b*y
    x=np.floor(np.random.rand(N)* 200) -100
    y=np.floor(np.random.rand(N)* 200) -100 
    z=f(x,y)
    index=np.where(z==c)
    xc = x[index]
    yc = y[index]   
    return (x,y)
def Newton_Raphson_opt(f,a,b,xopt,tol,prt):
    erro = 1;
    dx=1e-4;
    if (prt):
        print ('n\tx\t\tf(x)\t\terro')  
    for k in range(2,500):
       x0=xopt
       df1=(f(x0+dx)-f(x0-dx)) / (2*dx)  # 1a derivada
       df2=(f(x0+dx)-2*f(x0)+f(x0-dx)) / (dx**2)  # 1a derivada
       xopt = x0 - df1/df2
       if(xopt!=0):
           erro =abs((xopt-x0)/xopt) 
       if (prt):
           print ( '%i\t%.10f\t%.10f\t%.1e' % (k,x0,f(x0),erro) )  
       if  (erro<tol):
           break
    yopt=f(xopt)
    if (prt):
           print ( '%i\t%.10f\t%.10f\t%.1e' % (k+1,xopt,yopt,erro) )
           print ( '%.10f\t%.10f' % (xopt,yopt))
           print ( 'Ótimo com tolerância %.1e = (%f,%f)' % (tol,xopt,yopt))
    return (xopt,yopt)

def  plot_newton_raphson_opt(f,a,b,xopt,tol):
    (xopt,yopt)=Newton_Raphson_opt(f,a,b,xopt,tol,True)
    figure, axis = plt.subplots(2, 1)
    x=np.linspace(a,b,1000)
    y=f(x)  
    axis[0].plot(x,y,label="f(x)")
    axis[0].scatter([xopt, xopt],[0,yopt])
    axis[0].legend(loc="upper left")
    axis[0].grid()
    dx=x[2]-x[1]
    dy=derivada1_centrada(y,dx)
    axis[1].plot(x,dy,label="f ''(x) centrada")
    axis[1].scatter(xopt,0)    
    axis[1].legend(loc="upper left")
    axis[1].grid()
    plt.show()
    return


def busca_aurea(f,a,b,tol,prt):
   phi = (np.sqrt(5.)-1.)/2.;
   nIter = np.ceil(np.log(tol/abs(b-a))/np.log(phi));
   nIter= nIter.astype(int)
   x1 = b-phi*(b-a);
   x2 = a+phi*(b-a);
   f1 = f(x1);
   f2 = f(x2);
   if (prt):
       x=np.linspace(a,b,1000)
       plt.plot(x,f(x))
       print('i \ta\t\tx1\t\tx2\t\tb\t\terro')
   for k in range (nIter):
     if (f1 > f2):  # f1 < f2 para o mínimo
        if (prt):
             print('%d\t%.7f\t%.7f(+)\t%.7f(-)\t(%.7f)\t%.1e'
                     % (k,a,x1,x2,b,(phi)*abs(b-a)))
        b = x2; 
        x2 = x1; 
        f2 = f1;
        x1 = b-phi*(b-a); 
        f1 = f(x1); 
     else:
        if (prt):
            print('%d\t(%.7f)\t%.7f(-)\t%.7f(+)\t%.7f\t%.1e'
                    % (k,a,x1,x2,b,(phi)*abs(b-a)))
        a = x1;
        x1 = x2;
        f1 = f2;
        x2 = a + phi*(b-a); 
        f2 = f(x2);
   if (f1 > f2):  
        xopt = x1;  # f1<f2 para o mínimo
   else:  
        xopt = x2;  
   yopt = f(xopt)
   if (prt):
      print('%d\t%.7f\t%.7f\t%.7f\t%.7f\t%.1e'
              % (nIter,a,x1,x2,b,(phi)*abs(b-a)))
      print("máximo no ponto (x,f(x))=(%.7f , %.7f)"
             % (xopt,yopt))
      plt.scatter(xopt,yopt)
      plt.show()
   return (xopt,yopt)

def busca_aleatoria(f,a,b,n,prt):
    x=np.random.rand(n)* (b-a) + a
    #x = linspace(a,b,n)para comparar
    y=f(x)
    index=np.argmax(y)
    xopt=x[index]
    yopt=y[index]
    plt.scatter(x,y)
    if (prt):
        plt.scatter(xopt,yopt,color='red')
        print("Máximo em (x,y)=(%f,%f)\nerro=%.1e"
              % (xopt,yopt,(b-a)/n**2))
        plt.show()
    return (xopt,yopt) 

def busca_aleatoria_2d(f,box,n,prt):
    x=np.random.rand(n)* (box[1]-box[0]) + box[0]
    y=np.random.rand(n)* (box[3]-box[2]) + box[2]
    z=f(x,y)
    index=np.argmax(z)
    if (prt):
       print("Máximo em (x,y,z)=(%.5f ,%.5f, %.5f)"
             % (x[index],y[index],z[index]))
    return (x,y,z,index)

def  Create_3DView(f,n,inclinacao,azimute,box):
        x_lin = np.linspace(box[0],box[1],n);
        y_lin = np.linspace(box[2],box[3],n);
        X, Y = np.meshgrid(x_lin, y_lin)
        Z = f(X, Y)
        ax = plt.axes(projection="3d")
        ax.view_init(elev=inclinacao, azim=azimute)
        ax.plot_surface(X, Y, Z, rstride=1, alpha = 0.8,cstride=1,linewidth=0.5,
                cmap='jet',antialiased=True, edgecolor='black')
        #ax.set_title('Superfície 3D');
        ax.set_zlim(0, 80)
        ax.set_xlabel('x')
        ax.set_ylabel('y')
        ax.set_zlabel('z')
        return ax


def Plot_Scatter3d(x,y,z,inclinacao,azimute):
        index=np.argmax(z)
        ax = plt.axes(projection="3d")
        ax.view_init(elev=inclinacao, azim=azimute)
        c = np.abs(z)
        ax.scatter(x,y,z,c=z,s=1,cmap='jet')
        ax.scatter(x[index],y[index],z[index],s=100,c="green",marker="o")
        ax.set_title('Superfície 3D');
        ax.set_zlim(0, 80)
        ax.set_xlabel('x')
        ax.set_ylabel('y')
        ax.set_zlabel('z')
        plt.show()
        return


def Create_Gradiente_Image(f,box):
        x_lin = np.linspace(box[0],box[1],500);
        # ymax para ymin
        y_lin = np.linspace(box[3],box[2],500);
        X, Y = np.meshgrid(x_lin, y_lin)
        Z=f(X,Y)**(1/2)
        zNorm = (Z - Z.min()) / (Z.max() - Z.min()) * 255
        zNormUint8 = zNorm.astype(np.uint8)
        Image=plt.figure()
        x_m = np.linspace(box[0],box[1],50);
        y_m = np.linspace(box[3],box[2],50);
        X_m, Y_m = np.meshgrid(x_m, y_m)
        delta=1e-8
        u = (f(X_m+delta,Y_m)-f(X_m-delta,Y_m))/(2*delta)
        v = (f(X_m,Y_m+delta)-f(X_m,Y_m-delta))/(2*delta)
        u=abs(u)**(1/3)*np.sign(u)
        v=abs(v)**(1/3)*np.sign(v)
        plt.quiver(X_m,Y_m,u,v)
        plt.imshow(zNormUint8,cmap='jet', extent=box)
        return Image

def otimiza_h(f,x0,y0,dx,dy,grad):
       f_h = np.zeros(40)
       for i in range (1,40):
          h = (2.)**(-i)
          f_h[i]=f(x0+ h * dx/grad ,y0+ h * dy/grad )
       index=np.argmax(f_h)
       h = (2.)**(-index)
       return h

def SteepestAscent(f,x0,y0,tol,prt):
    delta = 1e-8;
    x=[]
    y=[]
    x.append(x0)
    y.append(y0)
    h=1.0
    if(prt):
        print("itr\tx\t\ty\t\tf(x,y)\t\th\t\tgrad")
    for k in range (50):
        dx = (f(x[k]+delta,y[k])-f(x[k]-delta,y[k]))/(2*delta)
        dy = (f(x[k],y[k]+delta)-f(x[k],y[k]-delta))/(2*delta)   
        grad = np.sqrt(dx**2+dy**2)
        if (grad<1e-12):
            break
        h = otimiza_h(f,x[k],y[k],dx,dy,grad)
       # h=2**(-k)
        if(prt):
            print("%d\t%f\t%f\t%.10f\t%.2e\t%.2e"
                  % (k,x[k],y[k],f(x[k],y[k]),h,grad))
        x.append(x[k]+ h * dx/grad)
        y.append(y[k]+ h * dy/grad)
        erro = abs((f(x[k+1],y[k+1])-f(x[k],y[k]))/f(x[k+1],y[k+1]))
        if ( erro < tol):
            break
    if(prt):
        print("k=%d  máximo (%f,%f)=%.10f"
              % (k+1,x[k+1],y[k+1],f(x[k+1],y[k+1])))
    return (x,y)
