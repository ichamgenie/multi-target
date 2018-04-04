path = 'D:\\code\\matlab\\data\\20180308\\12\\12-2_2_g_p\\';%原始图片文件夹
gifFrameRate = 25.27;%gif帧率
rate = 1;%慢放倍数
images = dir(fullfile([path,'*.png']));
fileCount = length(images);
dFrameRate = 25.27;
step = round(dFrameRate/(gifFrameRate*rate));

index = 1;
list1 = {};
while(index<=fileCount)
    blockList = {};
    image = get_binaryzation(imread([path,images(index).name]));
    [nH,nW] = size(image);
    for j = 1:nH
        for i = 1:nW
            if(image(j,i)>0)
                blockFirstPoint = [j,i];
                newBlock = fillBlock([j,i], image);
                blockList{listSize(blockList)+1} = newBlock;
                for k = 1:listSize(newBlock)
                    tmpPoint = newBlock{k};
                    image(tmpPoint(1),tmpPoint(2)) = 0;
                end
            end
            
        end
    end
    list1{listSize(list1)+1} = blockList;
    index = index+step
end
imshow(image);


