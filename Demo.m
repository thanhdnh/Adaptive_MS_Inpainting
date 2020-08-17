clearvars;
close all;
clc;

% Call  I_inpainted = Adaptive_MS_Inpainting(I_in, mask, maxiter, tol)
% where: I_in is a corrupted image, mask is a corrupted mask, maxiter is
% maximum iteration, tol is tolerance. By default, maxiter = 20, tol =
% 1e-10.

imagefilename = '3096.jpg';
maskfilename  = 'mask.jpg';

I_original = imread(imagefilename);
mask = imread(maskfilename);
I_in = I_original;
I_in(mask~=0)=255;

I_inpainted = Adaptive_MS_Inpainting(I_in, mask);

imshow([I_original; I_in; I_inpainted]);
title('Original | Corrupted | Inpainted');

psnr(I_in, I_original)
psnr(I_inpainted, I_original)
ssim(I_in, I_original)
ssim(I_inpainted, I_original)