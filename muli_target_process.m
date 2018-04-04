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
        ttt = j
        for i = 1:nW
            if(image(j,i)<=0)
                continue;
            end
            if(listSize(blockList)<=0)
                blockList{1} = {[j,i]};
                continue;
            end
            findFlag = false;
            for k = 1:listSize(blockList)
                if(isPointConnectToBlock(blockList{k},[j,i],image))
                    blockList{k}{listSize(blockList{k})+1} = [j,i];
                    findFlag = true;
                    break;
                end
            end
            if(findFlag==false)
                blockList{listSize(blockList)+1} = {[j,i]};
            end
        end
    end
    list1{listSize(list1)+1} = blockList;
    index = index+step
end
imshow(image);


