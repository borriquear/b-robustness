function [ G_y_per ] = perturb_set_cell( G_y, combos, counter )
%G_y_per array of matrix 90,90 in which the combos nodes and their
%connections have been deleted
%G_y the original matrix
%combos is the list of nodes to delete
% counter is the number of elements to delete

for j=1:counter
        %assign 0 to G_y(y,:) and G_y(:,y)
         
        G_y(combos(j),:) = 0;
        G_y(:,combos(j)) = 0;      
end
G_y_per =G_y;


