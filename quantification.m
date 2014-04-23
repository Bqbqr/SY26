clear;
clc;

%img = imread('airfield512x512.tif');
%img = imread('boats512x512.tif');
% img = imread('peppers512x512.tif');
%img = imread('bridge512x512.tif');
img = imread('harbour512x512.tif');

%Laisse ça en tant que script, c'est la merde sinon pour que ça marche
%simplement

% Quantification uniforme

debit=2;
N=2^debit;
step=round(255/N);
[ligne, colonne]=size(img);
quantifiedImg=img;

for i=1 : ligne
    for j=1 : colonne
        quantifiedImg(i,j) = getQuantValue(img(i,j),step);
    end
end

[ NMSE, SNR ] = getNmseSnr(img, quantifiedImg);
quantifiedImgLloyd = getQuantifiedImgLloyd( img, N );

[ NMSElloyd, SNRlloyd ] = getNmseSnr(img, quantifiedImgLloyd);
NMSE
SNR
% imwrite(quantifiedImg,'airfieldQ.jpg','jpg','Quality',100);
NMSElloyd
SNRlloyd
% imwrite(quantifiedImgLloyd,'airfieldQL.jpg','jpg','Quality',100);
