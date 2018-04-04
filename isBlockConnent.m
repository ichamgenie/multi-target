function rtn = isBlockConnent(block1, block2)
for i = 1:listSize(block1)
    if(isPointInBlock(block2,block1{i}))
        rtn = true;
        return;
    end
end
rtn = false;