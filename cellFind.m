function rtn = cellFind(list, item)
for i = 1:listSize(list)
    rt = (list{i}==item);
    if(rt(1)&&rt(2))
        rtn = i;
        return;
    end
end
rtn = 0;