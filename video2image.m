% ����Ƶ����Ϊ��ֵͼƬ�飬ÿ֡Ϊһ��ͼ����Ŀ������ĵط�����ֵΪ1������Ϊ0��
% ������ֱ�����м��ɣ����к��ֶ�ѡ����Ƶ���������гɹ��������Ƶ�ļ�ͬĿ¼�´���Ŀ¼����������ͼƬ�����ڸ�Ŀ¼�¡�
[FileName,PathName] = uigetfile('*.avi','ѡ����Ƶ�ļ�');
if FileName==0
    return;
end
dlg1=waitbar(0,'������...');
VideoName = FileName;%'video0004.avi';%��Ƶ�ļ���
Mov = VideoReader([PathName,VideoName]);
nFrames = Mov.NumberOfFrames;%��Ƶ֡��
nHeight = double(Mov.Height);
nWidth = double(Mov.Width);

VideoPath = Mov.Path;

[tmp,VideoNameLength] = size(VideoName);
img_path = [VideoPath,'/',VideoName(1:VideoNameLength-4)];
if ~isdir(img_path)
    mkdir(img_path);
end

img_background = double(rgb2gray(read(Mov,1)));%��һ֡ͼ������1
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


