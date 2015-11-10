function [ G_y_per ] = perturb_set( G_y, combos, counter )
%G_y_per array of matrix 90,90 each element is the result of a perturbed
%matrix
%G_y the original matrix
%combos the matrix or list of al perurbations, eachrow tells which nodes
%need to be deleted
% counter is the number of columns or nodes to delete, and the rows is the
% umber of perturbed matrix to create
%G_orig = G_y;
numbper = size(combos,1);
disp('Number of perturbation in this cycle')
disp(numbper)
disp('Counter of perturbation is')
disp(counter)
%G_y_per = zeros(:,:,numbper)
%for i=1:numbper
    %modidy G_y at row,colto get  G_y(i)
for j=1:counter
        %assign 0 to G_y(y,:) and G_y(:,y)
        G_y(combos(j),:) = 0;
        G_y(:,combos(j)) = 0;      
end
    %disp('END per')
    %G_y_per(i) = zeros(90,90)
    G_y_per =G_y;

%end


