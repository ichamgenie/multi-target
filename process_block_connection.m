list1 = importdata('list1.mat');
nH = 480;
nW = 720;
dataList = {};

dataList{1} = {};
for tmpi = 1:listSize(list1{1})
    blockData.pxList = list1{1}{tmpi};
    blockData.id = tmpi;
    dataList{1}{tmpi} = blockData;
end
numOfTrace = tmpi;

for n = 2:listSize(list1)
    dataList{n} = {};
    for i = 1:listSize(list1{n})
        tmpBlock = list1{n}{i};
        blockData.pxList = list1{n}{i};
        matchFlag = false;
        for k = 1:listSize(list1{n-1})
            tmpBlock2 = list1{n-1}{k};
            if(isBlockConnent(tmpBlock,tmpBlock2))
                blockData.id = dataList{n-1}{k}.id;
                matchFlag = true;
            end
        end
        if(matchFlag==false)
            numOfTrace = numOfTrace + 1;
            blockData.id = numOfTrace;
        end
        dataList{n}{i} = blockData;
    end
    index = n
end
save('dataList.mat','dataList');