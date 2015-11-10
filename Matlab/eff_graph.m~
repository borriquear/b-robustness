function [ y ] = eff_graph(G, N)
%Formula 2, input: graph with N nodes, output: 1/(N(N-1)\sum dij) 
%Calculate average efficiency of a graph based on the minimum distance
%between any two nodes
n_effic_total= 0; 
%array of N components
%effic2nodes = efficiency of any two nodes
for i= 1:N
    for j=1:N
        if i ==j
        else
        [mydist,mypath,mypred]= graphshortestpath(G,i,j,'directed',false);
        n_effic_total=n_effic_total+(1/mydist);
        end
    end
end
%average efficiency of all pair of nodes in the graph
y= (n_effic_total)/(N*(N-1));

end

