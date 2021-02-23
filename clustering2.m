%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%
%              (2)BoFベクトルと非線形SVMによる分類
%              先にconstructBoFVector.mの方でコードブック、
%              BoFベクトルとそのラベルを処理し、ここで評価する
%
%------------------------------------------------------------------%


% 画像リンクを読み込む
% FileDir: sushi and tiger, FileDir2: lion and tiger
load('FileDir2.mat');      

% constructBoFVector.mの方で処理したデータを読み込む
load('codebook_lion_tiger.mat');               %　コードブック
load('BoFVector_lion_tiger.mat');              %　BoFベクトル
load('dataForClustering2_lion_tiger.mat');     %　Shufflingした後のBoFベクトルに張り付けたラベルなど

% 5-fold cross validationで評価し、その五つの精度を得る
[prob, miss, hits] = FiveCrossValidation(myBoF, labels, 'rbf');

%　平均を取る
avergeProb = mean(prob);

%------------------------------------------------------------
%
%       実行結果：
%       虎と寿司：
%         prob =
%
%             0.9500    0.9375    0.9500    0.9500    0.9250
% 
%         avergeProb =
% 
%             0.9425
%        虎とライオン
%          prob =
% 
%             0.8500    0.7625    0.8250    0.8250    0.9000
% 
%             avergeProb =
% 
%             0.8325
%-----------------------------------------------------------------