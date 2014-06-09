clc;
clear;

imgRef = imread('airfield512x512.tif');
imgCour = imread('boats512x512.tif');

blockmatch( imgRef, imgCour )