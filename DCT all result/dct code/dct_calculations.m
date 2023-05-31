
% Load original and distorted images
host = imread("PeppersRGB.jpg");

watermarked_before_noise = imread("DCT all result\DCT IMAGE\DCT before noise\DCT extreact watermarke befor noise baboon.jpg");
watermarked_after_noise = imread("DCT all result\DCT IMAGE\DCT after noise\dct watermarked after noise boboon.jpg");

watermrkdata=imread("water.jpg");
watermrkdata_extrect_before_noise =imread("DCT all result\DCT IMAGE\DCT before noise\DCT extreact watermarke befor noise baboon.jpg");
watermrkdata_extrect_after_noise =imread("DCT all result\DCT IMAGE\DCT after noise\dct extracted after noise boboon.jpg");


% Convert to double precision
host = im2double(host);
watermarked_before_noise= im2double(watermarked_before_noise);
watermarked_after_noise = im2double(watermarked_after_noise);
watermrkdata= im2double(watermrkdata);
watermrkdata_extrect_before_noise= im2double(watermrkdata_extrect_before_noise);
watermrkdata_extrect_after_noise= im2double(watermrkdata_extrect_after_noise);

watermrkdata_resize=imresize( watermrkdata,size(watermrkdata_extrect_before_noise));

MSE = mean(mean(mean((watermrkdata_resize - watermrkdata_extrect_before_noise).^2)));
psnr_ = 10*log10(1/MSE);

% Calculate NC
mean1 = mean(watermrkdata(:));
mean2 = mean(watermrkdata_extrect_after_noise(:));
std1 = std(watermrkdata(:));
std2 = std(watermrkdata_extrect_after_noise(:));

resize_im1=imresize(watermrkdata, size(mean1));
resize_im2=imresize(watermrkdata_extrect_after_noise,size(mean2));
NC = sum((resize_im1 - mean1) .* (resize_im2 - mean2)) / sqrt(sum((resize_im1 - mean1).^2) * sum((resize_im2 - mean2).^2));
% Calculate ssim

[SSIM, ~] = ssim(resize_im1, resize_im1);


% Display results
fprintf(' host && watermarkedimage  :\n \n  ');
fprintf('MSE: %f dB\n', MSE);

fprintf('PSNR: %f dB\n \n ', psnr_);

fprintf(' extracted watermark  && orgianl watermarke : \n \n    ');
fprintf(' NC= %.2f\n', NC);
fprintf('SIM = is %.2f\n \n ', SSIM -0.);


