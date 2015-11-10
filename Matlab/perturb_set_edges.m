function [ G_y_per ] = perturb_set_edges( G_y, combos_orig, combos_dest, counter_orig, counter_dest)
%G_y_per array of matrix 90,90 in which the connections between elements in origne and dest are deleted. 
%This is a perturbation edge-based 
%G_y the original matrix
%combos_orig, dest list of nodes to disconnect  between themselves
% counter_orig dest is the number of elements to whose connections need to
% be deleted

for i1=1:counter_orig
    for i2=1:counter_dest         
        G_y(combos_orig(i1),combos_dest(i2)) = 0;
    end
end
for i1=1:counter_dest
    for i2=1:counter_orig
        G_y(combos_dest(i1),combos_orig(i2)) = 0;
    end
end
G_y_per =G_y;