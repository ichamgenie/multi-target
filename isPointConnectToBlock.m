function isNearBy = isPointConnectToBlock(block, point, image)
filter1 =[1 1 1
          1 1 1
          1 1 1];
[nH, nW] = size(image);
blockImage = zeros(nH,nW);
for i = 1:listSize(block)
    blockImage(block{i}(1),block{i}(2)) = 1;
end
imgTmp = zeros(nH,nW);
imgTmp(point(1),point(2)) = 1;
imgresult = imgTmp.*image;
lastImg = imgresult;
while(true)
    imgTmp = imdilate(imgTmp, filter1).*image;
    if(imgTmp==lastImg)
        break;
    end
    if(sum(sum(imgTmp.*blockImage))>0)
        isNearBy = true;
        return;
    end
    lastImg = imgTmp;
end
isNearBy = false;
