dataList = importdata('dataList.mat');
frameRate = 25.27;
cellDataList = {};
for n = 1:listSize(dataList)
    cellDataList{n} = {};
    for k = 1:listSize(dataList{n})
        [y, x, r] = getCellCenterAndR(dataList{n}{k}.pxList);
        cellDataList{n}{k}.center = [y, x];
        cellDataList{n}{k}.r = r;
        cellDataList{n}{k}.id = dataList{n}{k}.id;
    end
end
save('cellDataList.mat','cellDataList');
