clc
close all
warning off
% Prompt the user to select an image file
[fileName, filePath] = uigetfile({'*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff'
    'Image Files (*.png, *.jpg, *.jpeg, *.bmp, *.tif, *.tiff)'}, 'Select an Image');
if isequal(fileName, 0)
    disp('No image selected. Exiting.');
    return;  % User canceled the file selection
end

% Construct the full path to the selected image
imageFilePath = fullfile(filePath, fileName);

% Load the selected image
x = imread(imageFilePath);
imshow(x);
msg = readBarcode(x);
if(msg~="")
disp(msg);
else
disp("Barcode not detected");
end