%% Algorithm developed by Jaime Gomez Ramirez
%% OKACOGNET Project

function [eff_value]=graph_efficiency(AdjMax)
% *INPUT:* 
% AdjMax: Adjacent matrix that represents a sparse graph
%
% *OUTPUT:*
% S: eficiency value calculated based on Latora-Melchiori genios


 spRZcor=sparse(AdjMax);
 %matrix dimension
 M=89;
 n_effic=0;
 for i= 1:M
     for j=1:M
         if i ==j 
         else
             
         [mydist,mypath,mypred]= graphshortestpath(spRZcor,i,j,'directed',false);
         n_effic=n_effic+(1/mydist);
         end
     end
 end
 eff_value= (n_effic)/(89*(89-1));

%% END