function [ locallyEqualizedImage ] = LocalHistEq( image, boxSideSize, varargin )

  if isempty(length(varargin))
    varargin{1} = 'default';
  elseif (~strcmp(varargin{1}, 'optimized') && ~strcmp(varargin{1}, 'default'))
      error('Mode must be either optimized or default');
  end

  paddedImage = padarray(image, [(fix(boxSideSize/2)), (fix(boxSideSize/2))]);

  x = size(image, 2);
  y = size(image, 1);

  locallyEqualizedImage = zeros(y, x);

  if strcmp(varargin{1}, 'default')

    for j = 1:y
      for i = 1:x
        imageBox = paddedImage(j:(j+boxSideSize-1), i:(i+boxSideSize-1));
        equalizedPixel = HistEq(imageBox);
        locallyEqualizedImage(j, i) = equalizedPixel;
      end
    end
    
  elseif strcmp(varargin{1}, 'optimized')
    
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
    
  end
  
end
