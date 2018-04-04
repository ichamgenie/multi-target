function isNearBy = isPointConnect(point1, point2)
x1 = double(point1(1));
y1 = double(point1(2));
x2 = double(point2(1));
y2 = double(point2(2));

isNearBy = (x1-x2)^2 + (y1-y2)^2<=2;