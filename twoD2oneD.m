cellDataList = importdata('cellDataList.mat');
frameRate = 25.27;
frameTime = 1/frameRate;%每两帧之间的时间间隔
dPPC = 300;%图像分辨率，每厘米包含的像素数
dMPP = 1/(dPPC*100);%每个像素多长（单位：m）
nFitN = 4;%拟合阶数

maxBlockNum = 0;
for n = 1:listSize(cellDataList)
    if(listSize(cellDataList{n})>maxBlockNum)
        maxBlockNum = listSize(cellDataList{n});
    end
end

oneDirDataList = {};
oneDirDataList{maxBlockNum} = {};
for n = 1:listSize(cellDataList)
    for k = 1:listSize(cellDataList{n})
        id = cellDataList{n}{k}.id;
        center = cellDataList{n}{k}.center;
        r = cellDataList{n}{k}.r * dMPP;
        for i = 1 : maxBlockNum
            if i==id
                length = listSize(oneDirDataList{i});
                oneDirDataList{i}{length+1}.point = center;
                oneDirDataList{i}{length+1}.time = (n-1)*frameTime;
            end
        end
    end
end

for i = 1 : maxBlockNum
    p0 = oneDirDataList{i}{1}.point;
    for k = 1:listSize(oneDirDataList{i})
        currentP = oneDirDataList{i}{k}.point;
        oneDirDataList{i}{k}.l = getDistance(p0, currentP)*dMPP;
    end
end

showData = {};
for i = 1 : maxBlockNum
    arraySize = listSize(oneDirDataList{i});
    timeArray = zeros(1,arraySize);
    lArray = zeros(1,arraySize);
    for k = 1:arraySize
        timeArray(k) = oneDirDataList{i}{k}.time;
        lArray(k) = oneDirDataList{i}{k}.l;
    end
    showData{i}.timeArray = timeArray;
    showData{i}.lArray = lArray;
end

plot(showData{3}.timeArray, showData{3}.lArray);