function [ NMSE, SNR ] = q1( img1, img2 )

% mean_line : moyenne empirique pour chaque ligne
mean_line = mean(img1, 1);

% mean_total : moyenne empirique de l'image complète
mean_total = mean( mean_line, 2);

% a : somme de (x(m,n) - mean_total) ^2 
% b : somme de (c(m,n) - x_chapeau(m,n)) ^2
a = double(0);
b = double(0);

[ligne, colonne] = size(img1);

for i = 1 : ligne
    for j = 1 : colonne
        a = a + double((img1(i,j) - mean_total)^2);
        b = b + double((img1(i,j) - img2(i,j))^2);
    end
end

NMSE = b/a;
SNR = -10 * log10(NMSE);

end

