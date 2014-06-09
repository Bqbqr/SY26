function MSD = msd( C, P )

% sum : somme des |C(i,j) - P(i,j)|
sum = double(0);

[ligne, colonne] = size(C);

for i = 1 : ligne
    for j = 1 : colonne
        sum = sum + double((C(i,j) - P(i,j))^2);
    end
end

MSD = sum/(ligne-1)^2;

end
