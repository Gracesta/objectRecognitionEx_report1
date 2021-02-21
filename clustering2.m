%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%
%              (2)BoFベクトルと非線形SVMによる分類
%              先にconstructBoFVector.mの方でコードブック、
%              BoFベクトルとそのラベルを処理し、ここで評価する
%
%------------------------------------------------------------------%

% 画像リンクを読み込む
load('FileDir.mat');

% constructBoFVector.mの方で処理したデータを読み込む
load('codebook.mat');               %　コードブック
load('BoFVector.mat');              %　BoFベクトル
load('dataForClustering2.mat');     %　Shufflingした後のBoFベクトルに張り付けたラベルなど

% 5-fold cross validationで評価し、その五つの精度を得る
prob = FiveCrossValidation(myBoF, labels, 'rbf');

%　平均を取る
avergeProb = mean(prob);

%------------------------------------------------------------
%
%       実行結果：
%
%         prob =
%
%             0.9500    0.9375    0.9500    0.9500    0.9250
% 
%         avergeProb =
% 
%             0.9425
%-----------------------------------------------------------------