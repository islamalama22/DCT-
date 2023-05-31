%% Read watermarked image and original image
watermarked = imread('water.jpg');
original_1 = imread("PeppersRGB.jpg");
figure, imshow(watermarked), title('Watermarked Image');
figure, imshow(original_1),title('Original Image');

%% Convert original to grayscale
original = rgb2gray(original_1);

%% Create binary image from watermarked image
watermarked_binary = imbinarize(watermarked);

%% Resize original and watermarked_binary to have the same size 
original = imresize(original, [960, 960]);
watermarked_binary = imresize(watermarked_binary, [120, 120]);

%% Define the key
key = 1000;

%% Start embedding process
for i = 1:120
    for j = 1:120
        %% Deduct the (x-y) for original
        x = ((i-1) * 8 + 1);
        y = ((j-1) * 8 + 1);

        %% Extract the block from the original image
        block = original(x:x+7, y:y+7);

        %% Convert block to frequency domain
        dct_transform = dct2(block);

        %% Choose a, b for the equation
        b = 0.05; % Adjusted the value of b for better results
        if watermarked_binary(i, j) == 1
            a = 1;
        else
            a = -1;
        end

        %% Create a key matrix for this block
        key_mat = ones(8, 8) * key;

        %% Apply the key to encrypt the block
        encrypted_dct = (dct_transform + double(imresize(bitxor(uint8(dct_transform), uint8(key_mat)), size(dct_transform)))) * (1 + a * b);

        %% Return the block to spatial domain
        block = idct2(encrypted_dct);

        %% Replace the block in the original image
        original(x:x+7, y:y+7) = block;
    end
end

%% Convert the watermarked grayscale image back to RGB
watermarked = cat(3, original, original, original);

%% Display the watermarked image
figure, imshow(watermarked), title('Watermarked Image');

%% Save the watermarked image
imwrite(watermarked, 'DCT watermarked befor noise pepeer.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555

%% Create a binary matrix to store the extracted watermark
water_extracted = zeros(120, 120);

%% Start extraction process
for i = 1:120 
    for j = 1:120 
        %% Deduct the (x-y) for original
        x = ((i-1) * 8 + 1);
        y = ((j-1) * 8 + 1);

        %% Cut block from original
        block = original(x:x+7, y:y+7);

        %% Convert block to frequency domain
        dct_transform = dct2(block);

        %% Choose a, b for the equation
        b = 1; % Adjusted the value of b for better results
        if watermarked_binary(i, j) == 1
            a = 1;
        else 
            a = -1;
        end   

        %% Create a key matrix for this block
        key_mat = ones(8, 8) * key;

        %% Apply the key to decrypt the block
        encrypted_dct = dct_transform / (1 + a * b) - double(imresize(bitxor(uint8(dct_transform), uint8(key_mat)), size(dct_transform)));
          %% return the block for not freq
        block = idct2(encrypted_dct);

        %% return the block to its location in original image
        original(x:x+7, y:y+7) = block;

    end
end    

%% display extracted watermark
figure,imshow(original), title('extract');

%% store the extracted image in new name is extracted image 
imwrite(original, 'DCT extreact watermarke befor noise pepeer.jpg');


