clear;
clc;
%img = imread('airfield512x512.tif');
%img = imread('boats512x512.tif');
%img = imread('peppers512x512.tif');
img = imread('airfieldQL.jpg');
%img = imread('harbour512x512.tif');
[count, symboles] = imhist(img);
%On vire les valeurs de gris non présentes dans le count (=0)
symbolesSansZeros = find(count>0);
countSansZero = count(symbolesSansZeros);
symbolesSansZeros = symboles(symbolesSansZeros);
%Mise sous forme de probas (on divise chaque "valeurs" par le nombre total
%de valeurs)
[largeur, hauteur] = size(img);
probabilities = countSansZero ./ (largeur*hauteur);
%Codage et décodage par Huffman
[dict,avglenght]=huffmandict(symbolesSansZeros,probabilities);
imgencodee = huffmanenco (img(:), dict);
imgdecodee =huffmandeco(imgencodee, dict);
imgdecodee = reshape(imgdecodee, [largeur, hauteur]);
%Calcul du Tx de Compression
txcompression = 1-size(imgencodee(:))/(largeur*hauteur*8)
avglenght
%Codeur Arithmétique
%modification de l'image
[largeur, hauteur] = size(img);
imgtemp = zeros(largeur,hauteur);
for i = 1:largeur
    for j = 1:hauteur
        imgtemp(i,j) = find(symbolesSansZeros == img(i,j));
    end;
end;
imgencodee = arithenco(imgtemp(:), countSansZero);
imgdecodee = arithdeco(imgencodee, countSansZero, largeur*hauteur);
imgdecodee = reshape(imgdecodee, [largeur, hauteur]);
imshow(imgdecodee);
%Modification de l'image pour qu’elle corresponde au nombre de symboles
%utilisés au départ
imgdecodeetemp = zeros(largeur,hauteur);
for i=1:largeur,
    for j=1:hauteur,
        imgdecodeetemp(i,j) = symbolesSansZeros(imgdecodee(i,j));
    end;
end;
imgdecodee = imgdecodeetemp;
txcompression = 1-((size(imgencodee,1)) / ((largeur * hauteur) * 8))