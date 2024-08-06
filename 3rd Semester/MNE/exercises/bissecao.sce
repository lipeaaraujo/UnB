prt=%f
function raiz=bissecao(f,a,b,ite,prt)
    
    if ((f(a)*f(b))>0) then
        printf('\nNão existe raízes neste intervalo!\n\n')
        raiz=[];
        return
    end
    
   k=0;
   if(prt) then printf("\n") end
   while (k<ite)
       erro = abs(b-a)
       raiz = (a+b)/2;
       
       if (prt) then
           printf("%d: \t raiz:%.5f \t erro:%.10f\n",k+1,raiz,erro);
       end
       
       if((f(raiz)*f(b))<0) then a=raiz
       else b=raiz end
       
       k=k+1
   end
   if(prt) then printf("\n") end
   
   return
   
endfunction
