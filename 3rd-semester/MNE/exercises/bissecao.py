def bissecao(f,a,b,tol,prt):
    if (f(a)*f(b) > 0):
        print("Não há raízes no intervalo [%f,%f]" % (a,b))
        return []
    
    if prt: print()

    i = 1
    while True:
        raiz = (a+b)/2
        erro = abs(b-a)

        if prt:
            print("%d\traiz:%.5f\terro:%.10f" % (i,raiz,erro))

        if erro < tol: break
        if f(raiz) == 0: break

        if (f(a)*f(raiz) < 0):
            b = raiz
        else:
            a = raiz

        i+=1

    if prt: print()

    return raiz