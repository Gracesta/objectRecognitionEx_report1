%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%
%              (2)BoFベクトルと非線形SVMによる分類
%               この関数で時間が掛かる、BoFVectorとCodebookを作る
%               
%
%------------------------------------------------------------------%

% 画像リンクをInit関数にて先に処理し、listで受け取る
% 1~200は寿司/ライオン、201~400は虎
load('FileDir2.mat'); 

m = 400;
imgList = list';
sizeOfCodeBook = 1000;
% 各画像に対して300個のポイントをランダムにサンプリングする
pointsNumberForEachImg = 300;

% 寿司を１、虎を０に
labels = [ones(m/2,1); zeros(m/2,1)];

%　そのままで評価するのがまずいので、先にShufflingする
[imgList, labels] = shuffleData(imgList, labels);


%  先にコードブックを作る、一応各画像に対して300個のポイント
%　をサンプリングする
codebook = makeMyCodeBook(imgList, sizeOfCodeBook, pointsNumberForEachImg);
save('codebook_lion_tiger.mat', 'codebook');

% コードブックはと一致な数の点をランダムにサンプリングし、
% Bag of Featuresを求める
myBoF = getBoFVectorWithRandomPoints(codebook, imgList, pointsNumberForEachImg);
save('BoFVector_lion_tiger.mat', 'myBoF');


%　評価の精度の考慮で、データをShufflingしたので、
%　BoFベクトルのラベルなどの画像データも保存
save('dataForClustering2_lion_tiger.mat', 'labels', 'imgList');