%% Calculate global enhancement and plot
loadedImage = load('forest.mat');
image = loadedImage.forestgray;
globallyEqualizedImage = histeq(image);

subplot(2,2,1), imshow(image)
title('original image')

subplot(2,2,2), imhist(image)
title('original histogram')

subplot(2,2,3), imshow(globallyEqualizedImage)
title('globally enchanced')

subplot(2,2,4), imhist(globallyEqualizedImage)
title('enhanced histogram')

%% Calculate local enhancement and plot
loadedImage = load('forest.mat');
image = loadedImage.forestgray;
boxSideSize = 51;
locallyEqualizedImage = LocalHistEq(image, boxSideSize, 'optimized');

subplot(2,2,1), imshow(image)
title('original image')

subplot(2,2,2), imhist(image)
title('original histogram')

subplot(2,2,3), imshow(locallyEqualizedImage)
title('locally enchanced')

subplot(2,2,4), imhist(locallyEqualizedImage)
title('enhanced histogram')


%% Calculate mean and variance enhancement and plot
loadedImage = load('forest.mat');
image = loadedImage.forestgray;
boxSideSize = 3;
meanImage = Mean(image, boxSideSize, 2.0, 0.5, 0.002, 0.4);

subplot(2,2,1), imshow(image)
title('original image')

subplot(2,2,2), imhist(image)
title('original histogram')

subplot(2,2,3), imshow(meanImage)
title('mean & variance enchanced')

subplot(2,2,4), imhist(meanImage)
title('enhanced histogram')

%% Print pout with histogram
pout = imread('pout.tif');

subplot(1,2,1), imshow(pout)
title('original image')

subplot(1,2,2), imhist(pout)
title('image histogram')

%% Use global eq on pout and print with histogram
pout = imread('pout.tif');
eqpout = histeq(pout);

subplot(1,2,1), imshow(eqpout)
title('equalized pout')

subplot(1,2,2), imhist(eqpout)
title('equalized histogram')




