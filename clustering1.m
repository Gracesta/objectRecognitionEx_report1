%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%
%              (1)カラーヒストグラムとSVM線形カーネル
%
%
%------------------------------------------------------------------%

% 画像リンクをInit関数にて先に処理し、listで受け取る
% 1~200は寿司、201~400は虎

% 画像リンクを読み込む
load('FileDir.mat');

m = 400;
imgList = list;

hist = getColorHist(imgList);

% 寿司を１、虎を０に
labels = [ones(m/2,1); zeros(m/2,1)];

%　そのままで評価するのがまずいので、先にShufflingする
[hist, labels] = shuffleData(hist, labels);

% 5-fold cross validationで評価し、その五つの精度を得る
[prob, miss, hits] = FiveCrossValidation(hist, labels, 'linear');

%　平均を取る
avergeProb = mean(prob);

%------------------------------------------------------------
%
%       実行結果：
%
%         prob =
%
%             0.9250    0.8500    0.9500    0.8875    0.9500
% 
%         avergeProb =
% 
%             0.9125
%-----------------------------------------------------------------