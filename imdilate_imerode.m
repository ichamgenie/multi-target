path = 'D:\\code\\matlab\\data\\20180308\\12\\12-2_2_g\\';%ԭʼͼƬ�ļ�
pathTarget = 'D:\\code\\matlab\\data\\20180308\\12\\12-2_2_g_p\\';%ԭʼͼƬ�ļ�
gifFrameRate = 25.27;%gif֡��
rate = 1;%���ű���
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


