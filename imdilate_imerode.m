path = 'D:\\code\\matlab\\data\\20180308\\12\\12-2_2_g\\';%原始图片文件
pathTarget = 'D:\\code\\matlab\\data\\20180308\\12\\12-2_2_g_p\\';%原始图片文件
gifFrameRate = 25.27;%gif帧率
rate = 1;%慢放倍数
images = dir(fullfile([path,'*.png']));
fileCount = length(images);
dFrameRate = 25.27;
step = round(dFrameRate/(gifFrameRate*rate));
filter1 =[0 1 0
          1 1 1
          0 1 0];
i = 1;
while(i<fileCount)
    image = imread([path,images(i).name]);
%     image = imdilate(image,filter1);
%     image = imdilate(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    
    image = imdilate(image,filter1);
    image = imdilate(image,filter1);
    
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    
    image = imdilate(image,filter1);
    image = imdilate(image,filter1);
    image = imdilate(image,filter1);
    image = imdilate(image,filter1);
    
    image = imerode(image,filter1);
    image = imerode(image,filter1);
    
    imwrite(image,[pathTarget,images(i).name]);
    i = i+step;
end
imshow(image);


