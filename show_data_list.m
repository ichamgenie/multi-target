nH = 480;
nW = 720;
for n = 1:354
    image_recover = zeros(nH,nW);
    for i = 1:listSize(list1{n})
        tmmpBlock = list1{n}{i};
        for j = 1:listSize(tmmpBlock)
            image_recover(tmmpBlock{j}(1),tmmpBlock{j}(2)) = 1;
        end
    end
    imshow(image_recover,[]);
end