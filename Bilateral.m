clc
clear
close

imRGB = imread('retina.png');

imLAB = rgb2lab(imRGB);

patch = imcrop(imLAB,[10,10,130,130]);

patchSq = patch.^2;
edist = sqrt(sum(patchSq,3));
patchVar = std2(edist).^2;

DoS2 = 4*patchVar;
smoothedLAB2 = imbilatfilt(imLAB,DoS2,7);
smoothedRBG2 = lab2rgb(smoothedLAB2,'Out','uint8');
montage({imRGB,smoothedRBG2})
title(['Original Image vs. Filtered Image with Degree of Smoothing: ',num2str(DoS2),' and Spatial Sigma: 7'])

