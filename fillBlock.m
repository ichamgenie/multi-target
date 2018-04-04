function rtn = fillBlock(point, image)
filter1 =[1 1 1
          1 1 1
          1 1 1];
[nH, nW] = size(image);
imgTmp = zeros(nH,nW);
imgTmp(point(1),point(2)) = 1;
lastImg = imgTmp.*image;
while(true)
    imgTmp = imdilate(imgTmp, filter1).*image;
    if(imgTmp==lastImg)
        break;
    end
    
    lastImg = imgTmp;
end
tmpBlock = {};
for j = 1:nH
    for i = 1:nW
        if(imgTmp(j,i)>0)
            tmpBlock{listSize(tmpBlock)+1} = [j,i];
        end
    end
end
rtn = tmpBlock;