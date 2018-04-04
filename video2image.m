% 将视频处理为二值图片组，每帧为一张图，有目标物体的地方像素值为1，背景为0。
% 本程序直接运行即可，运行后手动选择视频，程序运行成功后会在视频文件同目录下创建目录，并将所有图片保存在该目录下。
[FileName,PathName] = uigetfile('*.avi','选择视频文件');
if FileName==0
    return;
end
dlg1=waitbar(0,'计算中...');
VideoName = FileName;%'video0004.avi';%视频文件名
Mov = VideoReader([PathName,VideoName]);
nFrames = Mov.NumberOfFrames;%视频帧数
nHeight = double(Mov.Height);
nWidth = double(Mov.Width);

VideoPath = Mov.Path;

[tmp,VideoNameLength] = size(VideoName);
img_path = [VideoPath,'/',VideoName(1:VideoNameLength-4)];
if ~isdir(img_path)
    mkdir(img_path);
end

img_background = double(rgb2gray(read(Mov,1)));%第一帧图，背景1
img_background2 = double(rgb2gray(read(Mov,round(nFrames/4))));
img_background3 = double(rgb2gray(read(Mov,round(nFrames/2))));
img_background4 = double(rgb2gray(read(Mov,round(3*nFrames/4))));

tmp_waitbar = 1;
dThreshold = 25;
for i = 1:nFrames
    img = double(rgb2gray(read(Mov,i)));
    
    img_s = get_binaryzation(-(img-img_background), dThreshold);    
    img2_s = get_binaryzation(-(img-img_background2), dThreshold);
    img3_s = get_binaryzation(-(img-img_background3), dThreshold);
    img4_s = get_binaryzation(-(img-img_background4), dThreshold);

    img_binaryzation = ceil((img_s + img2_s + img3_s + img4_s)/4.0);
    imwrite(img_binaryzation,[img_path,'/',num2str(i,'%04d'),'.png']);
    waitbar((i/nFrames)*tmp_waitbar,dlg1);
end

close(dlg1);

figure(1);
imshow(img_binaryzation);

figure(2);
imshow(img_background,[]);


