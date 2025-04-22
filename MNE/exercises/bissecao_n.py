import numpy as np

def bissecao_n(f,a,b,tol,prt):
    if (f(a)*f(b) > 0):
        print("Não há raízes no intervalo [%f,%f]" % (a,b))
        return []
    
    n = int(np.ceil(np.log2((b-a)/tol)))

    if prt: print()

    for i in range(1, n+1):
        raiz = (a+b)/2
        erro = abs(b-a)

        if prt:
            print("%d\traiz:%.5f\terro:%.10f" % (i,raiz,erro))

        if f(raiz) == 0: break

        if (f(a)*f(raiz) < 0):
            b = raiz
        else:
            a = raiz

    if prt: print()

    return raiz