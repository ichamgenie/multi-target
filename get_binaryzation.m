% 阈值分割函数，根据阈值获取二值图片
function img_out = get_binaryzation(img_in, dThreshold)
[nH,nW] = size(img_in);
img_tmp = zeros(nH,nW);
for j = 1:nH
    for i = 1:nW
        if img_in(j,i)>dThreshold
            img_tmp(j,i) = 1;
        end
    end
end
img_out = img_tmp;