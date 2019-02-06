function EI(inputx, inputy)

nx=inputx;
ny=inputy;

G=sparse(nx*ny,nx*ny);
E=zeros(1,nx*ny);
solutionSpace = zeros(nx, ny);

for i=1:nx
    for j=1:ny
        n=j+(i-1)*ny;
        if i==1 || i==nx
            E(n)=0;
            G(:,n)=0;
            G(n,n)=1;
        elseif j==1 || j==ny
            E(n)=0;
            G(:,n)=0;
            G(n,n)=1;
%         elseif i >= 10 && i <= 20
%             nxm = j+(i-2)*ny;
%             nxp = j+(i)*ny;
%             nym = (j-1)+(i-1)*ny;
%             nyp = (j+1)+(i-1)*ny;            
%             
%             G(n,n) = -2;
%             G(n,nxm)= 1;
%             G(n,nxp) = 1;
%             G(n,nym) = 1;
%             G(n,nyp) = 1;
        else
            nxm = j+(i-2)*ny;
            nxp = j+(i)*ny;
            nym = (j-1)+(i-1)*ny;
            nyp = (j+1)+(i-1)*ny;            
            
            G(n,n) = -4;
            G(n,nxm)= 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end        
    end
end

figure (1)
spy(G)


[E,D]=eigs(G,9,'SM');

figure(2)
plot(diag(D))



for k = 1:length(E(1,:))
    for i=1:nx
        for j=1:ny
            n=j+(i-1)*ny;
            solutionSpace(i,j) = E(n,k);           
        end
    end
    figure(k)
    surf(solutionSpace, 'edgecolor', 'none')
end



end

