prt = %f
function x0=GaussJacobi(A,b,x_ini,tol,prt)
   N = length(b);
   erro = 1;
   x0=x_ini
   sol=[x0;erro]
   for k=2:500
     for j=1:N
        x1(j)=(b(j)-A(j,:)*x0 + A(j,j)*x0(j))/A(j,j);
     end
     if(norm(x1)<>0)  erro=norm(x1-x0)/norm(x1)  end
     x0=x1;
     sol=[sol,[x0;erro]]
     if  erro<tol    break   end
   end
   if (prt) then
     disp([A b])
     disp(['x1';'x2';'...';'xn';'erro';])
     disp(sol)
     printf ( '\napós %i iterações, erro=%.1e\n',k,sol(N+1,k))
     plot([0:k-1],log10(sol(N+1,:)+1e-40))
   end
endfunction

function x1=GaussSeidel(A,b,x_ini,tol,prt)
     N = length(b);
     erro = 1;
     x0=x_ini
     sol=[x0;erro]
     for k=2:500
       x1(1)=(b(1)-A(1,2:N)*x0(2:N))/A(1,1);
       for j=2:N-1
            x1(j)=(b(j)-A(j,1:j-1)*x1(1:j-1)-A(j,j+1:N)*x0(j+1:N))/A(j,j);
       end
       x1(N)=(b(N)-A(N,1:N-1)*(x1(1:N-1)))/A(N,N);
       if(norm(x1)<>0)  erro=norm(x1-x0)/norm(x1)  end
       x0=x1;
       sol=[sol,[x0;erro]]
       if  erro<tol    break   end
    end
    if (prt) then
        disp([A b])
        disp(['x1';'x2';'...';'xn';'erro';])
        disp(sol)
        printf ( '\napós %i iterações, erro=%.1e\n',k,sol(N+1,k))
        plot([0:k-1],log10(sol(N+1,:)+1e-40))
    end
endfunction
