# https://numpy.org/doc/stable/user/numpy-for-matlab-users.html
# https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

import numpy as np
import matplotlib.pyplot as plt

f = lambda x: 4*np.exp(x/3)-20*np.exp(-x/5)*np.sin(x)
f = lambda x: x**4-5.9*x**3+12.78*x**2-12.04*x+4.16
f = lambda x: x**3-6*x**2+11*x-6
f = lambda x: x**2-8*x+6
f = lambda x: x**2-3*x+2.25
f = lambda x: x**5-6*x**4+10*x**3-10*x**2+5*x-2

def Bissecao_abs(f,a,b,tol,prt): #erro absoluto
    if (f(a)*f(b)>0):
       print("não há raiz no intervalo [%f,%f]]" % (a,b))
       return []
    if (prt): 
        print('i \ta\t\t\tx1\t\t\tb\t\t\terro') 
    for k in range(1,200):   
        erro=abs(b-a)
        x1=(a+b)/2     #Bisseção
        if (prt): 
            print("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e"
            % (k,a,np.sign(f(a)),x1,np.sign(f(x1)),b,np.sign(f(b)),erro) )
        if  ( (erro<tol) | (f(x1)==0) ):
            break
        if  (f(x1)*f(a)<0):
            b=x1
        else:
            a=x1
    if (prt):        
        n_dec=int(np.ceil(np.abs(np.log10(erro)))+1)
        form = "{:."+str(n_dec)+"f}"
        x1_str = form.format(x1)
        print(x1_str)       
    return x1

def Bissecao_n(f,a,b,tol,prt): #número de iterações
    if (f(a)*f(b)>0):
       print("não há raiz no intervalo [%f,%f]]" % (a,b))
       return []
    n=np.ceil(np.log2((b-a)/tol))+1
    if (prt): 
        print("Previsão de %d iterações" % (n)) 
        print ('i \ta\t\t\tx1\t\t\tb\t\t\terro')
    for k in range(1,int(n+1)): 
        x1=(a+b)/2    # Bisseção
        if (prt): 
            print("%d\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e"
            % (k,a,np.sign(f(a)),x1,np.sign(f(x1)),b,np.sign(f(b)),abs(b-a)) ) 
        if  ( f(x1)==0 ):
            break
        if  (f(x1)*f(a)<0):
            b=x1
        else:
            a=x1
    if (prt):        
        n_dec=int(np.ceil(np.abs(np.log10(abs(b-a))))+1)
        form = "{:."+str(n_dec)+"f}"
        x1_str = form.format(x1)
        print(x1_str)         
    return x1

def Bissecao(f,a,b,tol,prt): #erro relativo
    if (f(a)*f(b)>0):
       print("não há raiz no intervalo [%f,%f]]" % (a,b))
       return []
    if (prt): 
        print ('i \ta\t\t\tx1\t\t\tb\t\t\terro') 
    x1=a;
    erro=  1;
    for k in range(1,200):  
        x0=x1
        x1=(a+b)/2  # Bisseção
        if(x1!=0):
            erro =abs((x1-x0)/x1)
        if (prt): 
            print ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e'
            % (k,a,np.sign(f(a)),x1,np.sign(f(x1)),b,np.sign(f(b)),erro) )
        if  ( (erro<tol) | (f(x1)==0) ):
            break;
        if  (f(x1)*f(a)<0):
            b=x1
        else:
            a=x1
    if (prt):        
        n_dec=int(np.ceil(np.abs(np.log10(erro)))+1)
        form = "{:."+str(n_dec)+"f}"
        x1_str = form.format(x1)
        print(x1_str)   
    return x1


def FalsaPosicao(f,a,b,tol,prt):
    if (f(a)*f(b)>0):
       print("não há raiz no intervalo [%f,%f]]" % (a,b))
       return []
    if (prt): 
        print ('i \ta\t\t\tx1\t\t\tb\t\t\terro')
    x1=a;
    erro=  1;
    for k in range(1,500): 
        x0=x1
        x1=(a*f(b)-b*f(a))/(f(b)-f(a)) #Falsa Posição (Bisseção x1=(a+b)/2)
        if(x1!=0):
            erro =abs((x1-x0)/x1)
        if (prt): 
            print ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e'
            % (k,a,np.sign(f(a)),x1,np.sign(f(x1)),b,np.sign(f(b)),erro) )
        if  ( (erro<tol) | (f(x1)==0) ):
            break
        if  (f(x1)*f(a)<0):
            b=x1
        else:
            a=x1
    if (prt):        
        n_dec=int(np.ceil(np.abs(np.log10(erro)))+1)
        form = "{:."+str(n_dec)+"f}"
        x1_str = form.format(x1)
        print(x1_str) 
    return x1

def FalsaPosicaoModificado(f,a,b,tol,prt):
    if (f(a)*f(b)>0):
       print("não há raiz no intervalo [%f,%f]]" % (a,b))
       return []   
    if (prt): 
        print ('i \ta\t\t\tx1\t\t\tb\t\t\terro') 
    x1=a; 
    fa = f(a);
    fb = f(b); 
    na=0; 
    nb=0; 
    for k in range(1,500): 
        x0=x1;
        x1=(a*fb-b*fa)/(fb-fa) # Falsa Posição Modificado
        fx1 = f(x1)
        if(x1!=0):
            erro =abs((x1-x0)/x1)
        if (prt): 
            print ( '%i\t%.10f(%2d)\t%.10f(%2d)\t%.10f(%2d)\t%.1e'
            % (k,a,np.sign(f(a)),x1,np.sign(f(x1)),b,np.sign(f(b)),erro) )
        if  ( (erro<tol) | (f(x1)==0) ):
            break
        if (fx1*fa < 0):
            b=x1
            fb = fx1;
            nb=0;
            na=na+1
            if (na>=2):
                fa = fa/2
        else:
            a=x1;
            fa = fx1;
            na=0;
            nb=nb+1
            if (nb>=2):
                fb = fb/2
    if (prt):        
        n_dec=int(np.ceil(np.abs(np.log10(erro)))+1)
        form = "{:."+str(n_dec)+"f}"
        x1_str = form.format(x1)
        print(x1_str)                 
    return x1

if __name__=="__main__":
    f = lambda x: 4*np.exp(x/3)-20*np.exp(-x/5)*np.sin(x)
    Bissecao_abs(f,0,1,1e-2,True)