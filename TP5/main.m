clc;
clear;

imgCour = rgb2gray(imread('graou3.png'));
imgRef = rgb2gray(imread('graou4.png'));
[imgPred]=blockmatch( imgRef, imgCour,1,5 );
[imgPred]=blockmatch( imgRef, imgCour,1,10 );
[imgPred]=blockmatch( imgRef, imgCour,1,15 );
[imgPred]=blockmatch( imgRef, imgCour,2,5 );
[imgPred]=blockmatch( imgRef, imgCour,2,10 );
[imgPred]=blockmatch( imgRef, imgCour,2,15 );
[imgPred]=blockmatch( imgRef, imgCour,3,5 );
[imgPred]=blockmatch( imgRef, imgCour,3,10 );
[imgPred]=blockmatch( imgRef, imgCour,3,15 );