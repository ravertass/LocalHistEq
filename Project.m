loadedImage = load('forest.mat');
image = loadedImage.forestgray;

imshow(image);

globallyEqualizedImage = histeq(image);
figure, imshow(globallyEqualizedImage);

boxSideSize = 51;
locallyEqualizedImage = LocalHistEq(image, boxSideSize, 'optimized');
figure, imshow(locallyEqualizedImage);