% Load original and distorted images
host = imread("BaboonRGB.jpg");

watermarked_before_noise = imread("DCT all result\DCT IMAGE\DCT before noise\DCT extreact watermarke befor noise baboon.jpg");
watermarked_after_noise= imread("DCT all result\DCT IMAGE\DCT after noise\dct watermarked after noise boboon.jpg");

watermrkdata=imread("water.jpg");
watermrkdata_extrect_before_noise =imread("DCT all result\DCT IMAGE\DCT before noise\DCT extreact watermarke befor noise baboon.jpg");
watermrkdata_extrect_after_noise =imread("DCT all result\DCT IMAGE\DCT after noise\dct extracted after noise boboon.jpg");

host_H=histogram(host);
title('HOST histogram') ;
 imwrite(host_H,'histogram  DCT host boboon .jpg');

watermarked_before_noise_H =histogram(watermarked_before_noise);
title('watermarked before noise') ;
  imwrite(watermarked_before_noise_H, 'histogram DCT watermarked befor noise boboon  .jpg');


watermarked_after_noise_H=histogram(watermarked_after_noise);
title('watermarked after noise') ;
 imwrite(watermarked_after_noise_H, 'histogram DCT watermarked after  noise boboon  .jpg');

watermrkdata_H=histogram(watermrkdata);
title('watermrkdata ') ; 
 imwrite(watermrkdata_H ,'histogram waterdata ');

watermrkdata_extrect_before_noise_H=histogram(watermrkdata_extrect_before_noise);
title('watermarked extrect before noise') ;
 imwrite(watermarked_before_noise ,' histogram DCT watermarked extrect before noise boboon .jpg');

watermrkdata_extrect_after_noise_H=histogram(watermrkdata_extrect_after_noise); 
title('watermarked extrect after noise ');
imwrite(watermrkdata_extrect_after_noise_H ,' histogram DCT  watermarked extrect after noise boboon .jpg') ;

