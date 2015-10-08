boxSideSize = 51;

loadedImage = load('forest.mat');
image = loadedImage.forestgray;
%image = double(imread('spooky.jpg')) / 255.0;
imshow(image);
equalizedImage = histeq(image);
figure, imshow(equalizedImage);

paddedImage = padarray(image, [(fix(boxSideSize/2)), (fix(boxSideSize/2))], 0);

x = size(image, 2);
y = size(image, 1);

locallyEqualizedImage = zeros(y, x);

for j = 1:y  
  oldColumn = zeros(y, 1);
  imageBox = paddedImage(j:(j+boxSideSize-1), 1:(boxSideSize));
  [equalizedPixel, oldIntensityFrequencies] = HistEqNewRow(imageBox);
  locallyEqualizedImage(j, 1) = equalizedPixel;
  
  for i = 2:x
    imageBox = paddedImage(j:(j+boxSideSize-1), i:(i+boxSideSize-1));
    [equalizedPixel, oldColumn, oldIntensityFrequencies] = HistEqOpt(imageBox, oldColumn, oldIntensityFrequencies);
    locallyEqualizedImage(j, i) = equalizedPixel;
  end
end

figure, imshow(locallyEqualizedImage);
