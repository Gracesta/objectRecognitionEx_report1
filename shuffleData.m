%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%              
%           データの「行ベクトル」をShuffling
%
%
%------------------------------------------------------------------%
function [data, labels] = shuffleData(myData, myLabel)
    m = size(myData, 1);
    shuffled_idx = randperm(m);
    data = myData(shuffled_idx, :);
    labels = myLabel(shuffled_idx, :);

end