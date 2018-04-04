nH = 480;
nW = 720;
list1_2 = list1;

for tmpi = 1:listSize(list1{1})
    list1_2{1}{tmpi}{listSize(list1_2{1}{tmpi})+1} = tmpi;
end
numOfTrace = tmpi;

for n = 2:listSize(list1)
    for i = 1:listSize(list1{n})
        tmpBlock = list1{n}{i};
        matchFlag = false;
        for k = 1:listSize(list1{n-1})
            tmpBlock2 = list1{n-1}{k};
            if(isBlockConnent(tmpBlock,tmpBlock2))
                list1_2{n}{i}{listSize(list1{n}{i})+1} = list1_2{n-1}{k}{listSize(list1_2{n-1}{k})};
                matchFlag = true;
            end
        end
        if(matchFlag==false)
            numOfTrace = numOfTrace + 1;
            list1_2{n}{i}{listSize(list1{n}{i})+1} = numOfTrace;
        end
    end
    index = n
end