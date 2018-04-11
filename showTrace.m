path = 'D:/code/matlab/data/20180308/12/12-2_2_trace';%原始图片文件夹
dataList = importdata('dataList.mat');
% cellDataList = importdata('cellDataList.mat');
nH = 480;
nW = 720;
maxBlockNum = 0;
for n = 1:listSize(dataList)
    if(listSize(dataList{n})>maxBlockNum)
        maxBlockNum = listSize(dataList{n});
    end
end
imageAll = uint8(zeros(nH,nW,3));
for n = 1:listSize(dataList)
    image_recover = uint8(zeros(nH,nW,3));
    for i = 1:listSize(dataList{n})
        tmmpBlock = dataList{n}{i}.pxList;
        for k = 1:maxBlockNum
            if(dataList{n}{i}.id==k)
                [R, G, B] = getColor(k, maxBlockNum);

                for j = 1:listSize(tmmpBlock)
                    image_recover(tmmpBlock{j}(1),tmmpBlock{j}(2),1) = R;
                    image_recover(tmmpBlock{j}(1),tmmpBlock{j}(2),2) = G;
                    image_recover(tmmpBlock{j}(1),tmmpBlock{j}(2),3) = B;
                end
                
%                 image_recover(round(cellDataList{n}{i}.center(1)),round(cellDataList{n}{i}.center(2)),1) = R;
%                 image_recover(round(cellDataList{n}{i}.center(1)),round(cellDataList{n}{i}.center(2)),2) = G;
%                 image_recover(round(cellDataList{n}{i}.center(1)),round(cellDataList{n}{i}.center(2)),3) = B;
                tmpY = min([round(cellDataList{n}{i}.center(1)),nH]) ;
                tmpX = min([round(cellDataList{n}{i}.center(2)),nW]) ;
                imageAll(tmpY,tmpX,1) = R;
                imageAll(tmpY,tmpX,2) = G;
                imageAll(tmpY,tmpX,3) = B;
                
            end
        end
    end
    figure(1);
    imshow(image_recover,[]);
    imwrite(image_recover,[path,'/',num2str(n,'%04d'),'.png']);
%     index = n
end
figure(2);
imshow(imageAll,[]);
for i = 1:maxBlockNum
    [R, G, B] = getColor(i, maxBlockNum);
    text(10,15*i,['█',num2str(i,'%02d')],'color',[R, G, B]/255.0);
end