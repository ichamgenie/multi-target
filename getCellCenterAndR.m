function [y, x, r] = getCellCenterAndR(block)
yMin = block{1}(1);
yMax = block{1}(1);
xMin = block{1}(2);
xMax = block{1}(2);
for i = 1:listSize(block)
    currentY = block{i}(1);
    currentX = block{i}(2);
    if yMin > currentY
        yMin = currentY;
    end
    if yMax < currentY
        yMax = currentY;
    end
    if xMin > currentX
        xMin = currentX;
    end
    if xMax < currentX
        xMax = currentX;
    end
end

r = (yMax - yMin)/2.0;
y = (yMin + yMax)/2.0;
x = xMin + r;
