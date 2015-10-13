function [meanImage] = Mean(image, boxSideSize, E, k_0, k_1, k_2)
globalmean = mean2(image);
globalvar = var(image(:));

%E = 2.0;
%k_0 = 0.4;
%k_1 = 0.002;
%k_2 = 0.4;

meanImage = image;

x = size(image, 2);
y = size(image, 1);

% How many pixels "off" the center of the imagebox is from top left
pixel_diff = round(boxSideSize/2);

paddedImage = padarray(image, [(fix(boxSideSize/2)), (fix(boxSideSize/2))]);

    for j = 1:y
        
        for i = 1:x
            imageBox = paddedImage(j:(j+boxSideSize-1), i:(i+boxSideSize-1));
            pxmean = mean2(imageBox);
            pxvar = var(imageBox(:));
            
            if ((pxmean <= (k_0 * globalmean)) && ((k_1*globalvar) <= pxvar) && (pxvar <= (k_2 *globalvar)))
                meanImage(j,i) = E*paddedImage(j+pixel_diff,i+pixel_diff);
            end
        end
    end
end