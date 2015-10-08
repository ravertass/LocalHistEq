function [ equalizedPixel ] = HistEq( inputImage )
  x = size(inputImage, 1);
  y = size(inputImage, 2);
  noOfPixels = x * y;
  maxIntensity = 255;
  
  intensityFrequencies = zeros(maxIntensity + 1, 1);
  
  for j = 1:y
    for i = 1:x
      intensity = round(inputImage(i, j) * maxIntensity);
      intensityFrequencies(intensity + 1) = intensityFrequencies(intensity + 1) + 1;
    end
  end
  
  % See equation 3.3-13 on page 154 in the course book
  newIntensities = (1 / noOfPixels) * cumsum(intensityFrequencies);
  
  intensity = round(inputImage(round(x / 2), round(y / 2)) * maxIntensity);
  equalizedPixel = newIntensities(intensity + 1);
  
end

