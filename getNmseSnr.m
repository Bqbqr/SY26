function [ NMSE, SNR ] = getNmseSnr( img1, img2 )

% moyLigne : moyenne pour chaque ligne
moyLigne = mean(img1, 1);

% moyTotal : moyenne de l'image complète
moyTotal = mean(moyLigne, 2);

% num : somme de (c(m,n) - x_chapeau(m,n)) ^2
% denum : somme de (x(m,n) - mean_total) ^2 

num = double(0);
denum = double(0);

[nbLigne, nbColonne] = size(img1);

for i = 1 : nbLigne
    for j = 1 : nbColonne
        num = num + double((img1(i,j) - img2(i,j))^2);
        denum = denum + double((img1(i,j) - moyTotal)^2);
    end
end

NMSE = num/denum;
SNR = -10 * log10(NMSE);

end
