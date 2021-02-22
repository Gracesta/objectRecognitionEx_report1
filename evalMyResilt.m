m = length(miss);
figure;
for i = 1:7
    row = i - 1;
    for j = 1: 7
        subplot(7, 7, row*7+j);
        imshow(imgList{hits(row*7+j)});
    end
end