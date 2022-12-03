function [pic, fpm] = makepic(mdata,n, titlestr)
%UNTITLED Summary of this function goes here
dims = size(mdata);
rows = dims(1);
cols = dims(2);

%making the rho filter
rf = zeros(rows*2,1);
rf(1:rows)=[0:rows-1]/rows;
rf(rows+1:2*rows) = [rows:-1:1]/rows;
rf(1) = rf(2)/4;
%center value of rho filter is not set to 0 because
%it would kill the low frequencies

%here we zero pad our signal and apply the fourier transform
padded = zeros(rows,cols);
padded(1:rows/2,:) = mdata(rows/2+1:rows,:);
padded(rows*3/2+1:rows*2,:) = mdata(1:rows/2,:);
fourier = fft(padded);


rfM = rf*ones(1,cols);
transform = fourier.*rfM;

%after tranforming, multiplying in the frequency domain
% and inverse transforming, we now need to put our filtered 
% projections back into a non padded array to rebuild
% the original image
filt_data = ifft(transform);
fpm = zeros(rows,cols);
fpm(rows/2+1:rows,:) = filt_data(1:rows/2,:);
fpm(1:rows/2,:) = filt_data(rows*3/2+1:rows*2,:);
figure
imshow(fpm', [])
title("filtered data, "+titlestr);
projsnum = cols;
im = zeros(n,n);

%now we'll compute where in the image each projection's samples
%should go
for k = 1:projsnum
    pangle = (k-1)*pi/projsnum;
    ndx = get_indcs(pangle,n, rows);
    fp = fpm(:,k);
    fp(1) = 0;
    fp(projsnum) = 0;
    im = im+fp(ndx);
end
figure
imshow(im, [])
title("reconstructed image, "+titlestr);
pic=im;
%that was pretty cool tbh


end