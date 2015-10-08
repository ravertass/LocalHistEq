function [ equalizedPixel, firstColumn, intensityFrequencies ] = HistEqOpt( inputImage, oldColumn, oldIntensityFrequencies )
  x = size(inputImage, 1);
  y = size(inputImage, 2);
  noOfPixels = x * y;
  maxIntensity = 255;
  
  newColumn = inputImage(:, x);
  intensityFrequencies = oldIntensityFrequencies;
  
  for j = 1:y
    intensity = round(oldColumn(j) * maxIntensity);
    intensityFrequencies(intensity + 1) = intensityFrequencies(intensity + 1) - 1;
  end
  
  for j = 1:y
    intensity = round(newColumn(j) * maxIntensity);
    intensityFrequencies(intensity + 1) = intensityFrequencies(intensity + 1) + 1;
  end
  
  % See equation 3.3-13 on page 154 in the course book
  newIntensities = (1 / noOfPixels) * cumsum(intensityFrequencies);

  intensity = round(inputImage(round(x / 2), round(y / 2)) * maxIntensity);
  equalizedPixel = newIntensities(intensity + 1);
  
  firstColumn = inputImage(:, 1);
end

