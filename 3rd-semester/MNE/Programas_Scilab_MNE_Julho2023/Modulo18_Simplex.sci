prt = %f
function plot_constraints(A,b,c,box)
    [N,M]=size(A)
    cor = ["r","b","g","bk--","b--","r--","g--","c","y"]
    for(n=1:N) 
       equation(n) = sprintf("(%.2f)*x+(%.2f)*y=%.2f",A(n,1),A(n,2),b(n))
       gca().thickness = 2;
       plotimplicit (equation(n),box(1,1):box(1,2),box(2,1):box(2,2),cor(n))
    end    
    title = sprintf("Programação Linear Otimizar (%.2f)*x1+(%.2f)*x2",c(1),c(2))
    xtitle(title,"x1","x2")
    legend(equation,1)
endfunction

function sol=encontra_vertices(A,b,c)
    [N,M]=size(A)
    basic = combi(N,M)
    [n_vertices,n_basic]=size(basic)
    vertix=0
    for(k=1:n_vertices) 
       pt = EliminacaoGaussJordan(A(basic(k,:),:),b(basic(k,:)),%f)
       if(pt(1)<>%inf)  then
           vertix=vertix+1
           sol(vertix,:)=[pt' (pt'*c') vertice_ok(pt,A,b)]
       end
    end
    sol = unique(sol,1)
endfunction

function sol=encontra_vertices_slack(A,b,c)
    clear sol
    [N,M]=size(A)
    I=diag(ones(1:N))
    An = [A I]
    [Nn,Mn]=size(An)
    basic=combi(Mn,Nn)
    [n_vertices,n_basic]=size(basic)
    vertix=0
    for(k=1:n_vertices)
      pt_temp=EliminacaoGaussJordan(An(:,basic(k,:)),b,%f)
      pt = zeros(1:Mn)'
      pt(basic(k,:))=pt_temp
      if(pt(basic(k,1))<>%inf)  then
         vertix=vertix+1
         sol(vertix,[1:Mn+2])=[pt' (pt(1:M)'*c') vertice_ok(pt(1:M),A,b)]
      end
    end
    sol = unique(sol,1)
endfunction

function v=vertice_ok(pt,A,b)
    [N,M] = size(A)
    v=1;
    for (i= 1:N)
        if A(i,:)*pt > b(i) + 1e-12 then
            v = 0
            break;
        end
    end
endfunction

function vertix_opt=lp_fga(A,b,c,d,prt)
    [N,M]=size(A)
    for(i=1:M) A(:,i)=A(:,i).*(-d) end //trocar sinal se >=
    b=b.*(-d)                          //trocar sinal se >=
    A = [A ; -diag(ones(1:M))] //variáveis não-negativas
    b= [b; zeros(1:M)']        //variáveis não-negativas
    [N,M]=size(A)
    sol = encontra_vertices(A,b,c); 
    [n_sols,n_vars]=size(sol)
    index_ok=find(sol(:,n_vars)==1)
    sol_pol=sol(index_ok,:) // vertices possíveis
    [max_f, index_opt]=max((sol_pol(:,n_vars-1))) //escolha o máximo
    vertix_opt = sol_pol(index_opt,1:n_vars-1);
    if(prt)
      disp(sol_pol(:,1:n_vars-1))
      printf("total %d combinações,%d imprópias, %d vértices não-OK, %d vértices OK",...
      n_combi(N,M),n_combi(N,M)-n_sols,n_sols-sum(sol(:,n_vars)),sum(sol(:,n_vars)))
      disp(vertix_opt)
      if (M==2)  plot_lp_2D(A,b,c,sol,sol_pol,vertix_opt) end
      if (M==3)  plot_lp_3D(A,b,c,sol,sol_pol,vertix_opt) end
    end
endfunction

function B=removeDuplicates(B) 
    [nlin,ncol]=size(B)
    for(i=1:nlin)
        for j=[1:i-1 i+1:nlin]
            if (sum(abs(B(j,:)-B(i,:)) ) <1e-8 )
               B(j,:)=B(i,:)
            end
        end
    end
    B=clean(unique(B,1))
endfunction

function vertix_opt=lp_fga_slack(A,b,c,d,prt)
    [N,M]=size(A)
    for(i=1:M) A(:,i)=A(:,i).*(-d) end
    b=b.*(-d)
    A = [A ; -diag(ones(1:M))] //variáveis não-negativas
    b= [b; zeros(1:M)'] //variáveis não-negativas
    [N,M]=size(A)
    I=diag(ones(1:N))
    An = [A I]
    [Nn,Mn]=size(An)
    sol=encontra_vertices_slack(A,b,c)
    [n_sols,n_vars]=size(sol)
    index_ok=find(sol(:,n_vars)==1)
    sol_pol=sol(index_ok,:) // vertices possíveis
    [n_sols1,n_vars]=size(sol_pol)
    sol_pol = removeDuplicates(sol_pol)
    [n_sols2,n_vars]=size(sol_pol)
    [max_f, index_opt]=max((sol_pol(:,n_vars-1)))
    vertix_opt = sol_pol(index_opt,1:n_vars-1);
    if(prt)
        disp(sol_pol(:,1:n_vars-1))
        printf("total %d combinações,%d imprópias,%d vétices não-OK,%d vértices OK (+%d duplicados)",..
        n_combi(Mn,Nn),n_combi(Mn,Nn)-n_sols,n_sols-n_sols1,n_sols2,n_sols1-n_sols2)
        disp(vertix_opt)
        if (M==2)  plot_lp_2D(A,b,c,sol,sol_pol,vertix_opt) end
        if (M==3)  plot_lp_3D(A,b,c,sol,sol_pol,vertix_opt) end
    end
end

function A=pivoting(A,p_lin,p_col,prt)
   [N,M]=size(A)
   pivot=A(p_lin,p_col)
   if pivot==0 then  
       printf("pivot nulo")
       return
   end 
   A(p_lin,:)=A(p_lin,:)/pivot;  // normalização da linha p
   if (prt) printf("Eliminando coluna %d com Pivô %f\n",p_col,pivot) end
   for lin=[1:N]  //eliminação regressiva, progressiva
       if lin==p_lin then
          if (prt) 
              printf("(L%d)=(1)/(%f)*(L%d)\n",lin,pivot,p_lin)
          end
       else
          if (prt) 
              printf("(L%d)=(L%d)-(%f)/(%f)*(L%d)\n",lin,lin,A(lin,p_lin),pivot,p_lin);
          end
          m=A(lin,p_col)  // pivot já está normalizado
          A(lin,1:M)=A(lin,1:M)-m*A(p_lin,1:M); // eliminação
       end
    end
endfunction

function [current_tableau,basic,n_tableau]=optimize_tableau(current_tableau,basic,prt)
   [Nt Mt] = size(current_tableau)
   for(n_tableau=1:18)   
      [basic_in index_in] = min(current_tableau(Nt,1:Mt-1));
         index = find(current_tableau(Nt,1:Mt-1)<0)
         index_in = min(index) //Escolha a variável basic que entra
      ratio = current_tableau(1:Nt-1,Mt)./current_tableau(1:Nt-1,index_in);
      index=find(current_tableau(1:Nt-1,index_in)>=0)
      [basic_out index_temp] = min(ratio(index))
          index_out=index(index_temp) //Escolha a variável basic que sai 
         //ii = find(ratio==basic_out)
         //index_out=ii(int(rand(1)*length(ii))+1)
      if (prt)
         printf("\nTableau(%d)  pivot (%d,%d)",n_tableau,index_out,index_in)
         disp([current_tableau, [1:Nt]'*%nan, [basic';%nan]])
      end
      basic(index_out)=index_in
      current_tableau=pivoting(current_tableau,index_out,index_in,%f)
      index=find(current_tableau(Nt,:)<0)
      if (index==[]) then break; end;  //  atingiu ótimo
  end 
  n_tableau=n_tableau+1
  if (prt)
    printf("\nTableau(%d)  Valor Ótimo",n_tableau)
    disp([current_tableau, [1:Nt]'*%nan, [basic';%nan]])
  end  
endfunction

function [A,b,c]=dual_tableau(A_in,b_in,c_in)
    Aug = [A_in b_in ; c_in 0]' //Transpor para inverter problema
    [N,M] = size(Aug)
    A=Aug(1:N-1,1:M-1) //Extrair novos A, b e c
    b=Aug(1:N-1,M)
    c=Aug(N,1:M-1)
endfunction

function [vertix_opt,current_tableau] =simplex_tableau_max(A,b,c,prt)
    [N,M]=size(A)
    current_tableau = [[A diag(ones(1:N))] b ; [-c zeros(1:N)] 0]   
    basic=[M+1:N+M]
    [tableau_opt,basic,n_tableau]=optimize_tableau(current_tableau,basic,prt)
    [Nt Mt] = size(tableau_opt)
    vertix_opt=zeros(1:N+M);
    vertix_opt(basic)=tableau_opt(1:Nt-1,Mt)';
    vertix_opt =[vertix_opt, tableau_opt(Nt,Mt)]
    if (prt) //ultimo tableau contem o máximo
        printf("Máximo atingido, foram analisados %d tableaux\n",n_tableau)
        disp(vertix_opt)
    end
end

function [vertix_opt, current_tableau] =simplex_tableau_min(A,b,c,prt)
    [A,b,c]=dual_tableau(A,b,c)
    [N,M]=size(A)
    current_tableau = [[A diag(ones(1:N))] b ; [-c zeros(1:N)] 0]   
    basic=[M+1:N+M]
    [tableau_opt,basic,n_tableau]=optimize_tableau(current_tableau,basic,prt)
    [Nt Mt] = size(tableau_opt)
    vertix_opt =tableau_opt(Nt,1:Mt)
    if (prt) //ultimo tableau contem o mínimo
        printf("Mínimo atingido, foram analisados %d vertices\n",n_tableau)
        disp(vertix_opt)
    end
end

function [vertix_opt, current_tableau] =simplex_tableau_mix(A,b,c,d,prt)
    [N,M]=size(A)
    current_tableau = [[A -diag(d)] ; [-c zeros(1:N)] 0]   
    basic=[M+1:N+M]
    [tableau_opt,basic,n_tableau]=optimize_tableau(current_tableau,basic,prt)
    [Nt Mt] = size(tableau_opt)
    vertix_opt=zeros(1:N+M);
    vertix_opt(basic)=tableau_opt(1:Nt-1,Mt)';
    vertix_opt =[vertix_opt, tableau_opt(Nt,Mt)]
    if (prt) //ultimo tableau contem o máximo
        printf("Máximo atingido, foram analisados %d vertices\n",n_tableau)
        disp(vertix_opt)
    end
end

function plot_lp_2D(A,b,c,sol,sol_pol,vertix_opt)
        box(1,1)= min(sol(:,1))-max(sol(:,1))*0.1;
        box(1,2)= max(sol(:,1))*1.1;
        box(2,1)= min(sol(:,2))-max(sol(:,2))*0.1;
        box(2,2)= max(sol(:,2))*1.1;
        plot_constraints(A,b,c,box)
        fill_polygon(sol)
        plot2d(sol(:,1), sol(:,2),-9)
        plot2d(vertix_opt(1),vertix_opt(2),-4)
        xstring(sol_pol(:,1), sol_pol(:,2),string(sol_pol(:,3)))
endfunction

function plot_lp_3D(A,b,c,sol,sol_pol,vertix_opt)
        box(1,1)= min(sol(:,1))-max(sol(:,1))*0.1; 
        box(1,2)= max(sol(:,1))*1.1;
        box(2,1)= min(sol(:,2))-max(sol(:,2))*0.1;
        box(2,2)= max(sol(:,2))*1.1;
        box(3,1)= min(sol(:,3))-max(sol(:,3))*0.1;
        box(3,2)= max(sol(:,3))*1.1;
        scatter3d(sol_pol(:,1),sol_pol(:,2),sol_pol(:,3));
        scatter3d([vertix_opt(1),vertix_opt(1)],[vertix_opt(2),...
        vertix_opt(2)],[vertix_opt(3),vertix_opt(3)],'fill')
        [N,M]=size(sol_pol)
        h=combi(N,2)
        [lin,col]=size(h)
        for (i=1:lin)  sol_hull(2*i-1:2*i,:) = sol_pol(h(i,:),:) end
        plot3d3(sol_hull(:,1),sol_hull(:,2),sol_hull(:,3))
        gca().data_bounds=[box(1,1),box(2,1),box(3,1);...
                           box(1,2),box(2,2),box(3,2)]
endfunction

function sol_sorted=fill_polygon(sol)
    [N,M] = size(sol)
    index=find(sol(:,M)==1)
    sol_sorted = sol(index,:)
    xc = mean(sol_sorted(:,1));
    yc= mean(sol_sorted(:,2));
    sol_sorted(:,5)=atand(sol_sorted(:,1)-xc,sol_sorted(:,2)-yc);
    [k,j] = gsort(sol_sorted(:,5));
    sol_sorted = sol_sorted(j,:)
    [Ns,Ms]=size(sol_sorted)
    sol_sorted(Ns+1,:)=sol_sorted(1,:)
    gca().foreground = 31;
    xfpoly(sol_sorted(:,1),sol_sorted(:,2))
    plot(sol_sorted(:,1),sol_sorted(:,2),'bk')
    plot2d(sol_sorted(:,1),sol_sorted(:,2),-2)
endfunction

function y=combi(n,r)
    y=combine([1:n]',r,%F)
    y=strtod(y(:,1:r))
endfunction

function c = n_combi(n,j)
    c = exp(gammaln(n+1)-gammaln(j+1)-gammaln(n-j+1));
endfunction

function yc=combi_fga1(n,k)
    y=perms(1:n,"unique")
    yk = y(:,1:k)
    ys=gsort(yk,'c','i')
    yc = unique(ys,1)
endfunction

function [C]=combi_fga2(n,r)
    k=1;
    N=n^r
    disp([n r])
    for(i =0:N-1)
        a=dec2base(i+N,n);
        b=strsplit(a);
        d=base2dec(b,n);
        if  prod(d(r+1:-1:3)>d(r:-1:2))
            C(k,:)=d(2:r+1)+1;
            k=k+1;   
        end
    end
endfunction

//THIS FUNCTION COMBINES A GROUP OF ELEMENTS OF SIZE N ARRANGED IN A COLUMN IN 
//SUBGROUPS OF SIZE K WITH OR WITHOUT REPETITION
//WRITTEN BY JOSE-FERNANDO GIRALDO-J//2012
//NOTICE THAT THIS FUNCTION IS RECURSIVE AND DOES NOT NEED TO CALCULATE FACTORIALES
function [combinations]=combine(elements,groupsize,repeat)
    global b
    global g
    global d
    global a
    a=1
    if repeat==%T then
        a=0
    end
    b=0
    d=0
    n=size(elements,1)
    g=cell(1,groupsize)
    p=0
    l=1
    r=''
    docombinations(n,groupsize,p,l,r,elements)
    combinations=g;
endfunction

function docombinations(n,k,p,l,r,e)
    global b
    global g
    global d
    global a
    s=''
    z=0
    h=(n-(k-l))
    if a==0 then
        h=n
    end
    for z=p+1:h
        if b==1  then
            b=0
            p=p+1
        end
        s = string(r)+string(e(z))+string('/');
        if l<k then
            docombinations(n,k,p+a,l+1,s,e)
        end
        if b==0  then
            out = (strsplit(s,'/'))'
            if d==0  then
                g=out
                d=1
            else
                g=[g;out]
            end
        end
    end
    b = 1
endfunction





