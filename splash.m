close all;
% david jose florez rodriguez
load ct_data.mat;
figure
dim = 400;
x1 = [0:.05:.05*dim];
x1M = x1'*ones(1,dim+1);
sinM = sin(x1M);
imshow(sinM, []);
title('sin(y)')

figure
sinMft = fft(sinM);
imshow(sinMft, []);
title('F(sin(y))')

figure
sin5xM = sin(20*x1M);
imshow(sin5xM, []);
title('sin(10y)')

figure
sin5xMft = fft(sin5xM);
imshow(sin5xMft, []);
title('F(sin(10y))')

pic1 = zeros(dim,dim);
for i = 1:dim
    for j = 1:dim
        x = (j-dim/2)/(dim/2);
        y = (i-dim/2)/(dim/2);
        if x*x + y*y <.6^2 && x*x + y*y >.4^2 
            pic1(i,j)=1;
        end
    end
end

figure
imshow(pic1,[]);
title('circle .4<r<.6')

figure
noisycirc = pic1+sin5xM(1:dim,1:dim);
imshow(noisycirc,[]);
title('circle with noise')

figure
noisycircft = fft(noisycirc);
imshow(noisycircft, []);
title('F(noisy circle')


filt = zeros(dim,1);
filt(1:18)=1;
filt(dim-18:dim)=1;
filtM = filt*ones(1,dim);

figure
imshow(filtM*.9)
title('low pass filter')

filtcirc = filtM.*noisycircft;
figure
imshow(filtcirc,[])
title('filtered noisy circ')

filtcircift= ifft(filtcirc, []);
imshow(filtcircift,[])




%rf(rows+1:2*rows) = [rows:-1:1]/rows;
%rf(1) = rf(2)/4;


%padded = zeros(rows,cols);
%padded(1:rows/2,:) = mdata(rows/2+1:rows,:);
%padded(rows*3/2+1:rows*2,:) = mdata(1:rows/2,:);
%fourier = fft(padded);

