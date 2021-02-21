%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%              (1)カラーヒストグラムと最近傍分類
%
%           学習データを受け取り、中にあるすべての学習画像
%　　　　　　のカラーヒストグラムを返す
%
%
%------------------------------------------------------------------%

function histMat = getColorHist(trainingSet)
% get a colorHistgramMatrix from trainingSet
% Need getVector64.m file
    histMat = [];
    for i=1:length(trainingSet)
            histMat = [histMat; getVector64(trainingSet{i})];
    end
end

