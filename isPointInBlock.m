function rtn = isPointInBlock(block, point)
for i = 1:listSize(block)
    if(block{i}(1)==point(1)&&block{i}(2)==point(2))
        rtn = true;
        return;
    end
end
rtn = false;