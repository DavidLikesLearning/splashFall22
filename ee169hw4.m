close all;
% david jose florez rodriguez
%oct 31 2022, ee169, Dr. John Pauly
%% 1a
load ct_data.mat;
figure

%% 1b & 1c
imshow(ct_data', [])
title("original ct data")
abdominalct = makepic(ct_data,256, "ct data");

%% 2a
impulse = makepic(impulse_data,256, "impulse");

impmax = max(max(abs(impulse)));

figure
imshow(min(impmax/10, (impulse)), []);
% windowing down to exclude values that are too high
title("reconstructed impulse, background")

%% 2b
dwnsamp = impulse_data(:,1:4:end);
dwnsamp_impulse = makepic(dwnsamp, 256, "downsampled impulse");
% similar windwoing as before
mx2  = max(max(abs(dwnsamp_impulse)));

figure 
imshow(min(abs(dwnsamp_impulse),mx2/10),[]);
title("reconstructed downsampled impulse, background")

%THE FOV IN THE LAST IMAGE IS ABOUT 1/2 THE RADIUS OF
%THE FOV WITH 400 SAMPLES, SO NOW WE HAVE ABOUT 128 PIXELS
%OF CLEAN IMAGE IN THE CENTER AND THE REST IS NOTICEABLY
%NOISY





