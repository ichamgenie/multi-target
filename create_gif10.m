path = 'D:\code\matlab\data\20180308\12\12-2_2_g_p\\';%原始图片文件夹
gifFrameRate = 25.27;%gif帧率
rate = 1;%慢放倍数
images = dir(fullfile([path,'*.png']));
fileCount = length(images);
dFrameRate = 25.27;
step = round(dFrameRate/(gifFrameRate*rate));
GifName = 'drop.gif';
i = 1;
while(i<fileCount)
    image = imread([path,images(i).name]);
    if i==1
        imwrite(image,GifName,'gif','Loopcount',inf,...
            'DelayTime',1/gifFrameRate);
    else
        imwrite(image,GifName,'gif','WriteMode','append',...
            'DelayTime',1/gifFrameRate);
    end
    i = i+step;
end
imshow(image);


