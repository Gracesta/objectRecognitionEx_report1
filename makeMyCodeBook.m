
%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%              (2)BoFベクトルと非線形SVMによる分類
%
%              makeMyCodeBook.m
%              画像集合のリンクリストを受け取り、
%              その画像集合のコードブックを返す
%              サンプリングはランダムで行い、300個を取る
%
%------------------------------------------------------------------%
function CB = makeMyCodeBook(list, size_of_codebook, pointsNumberForEachImg_)
   totalFeatures = [];
   for i=1:length(list)
       I = rgb2gray(imread(list{i}));
       
       %　Densely　Sampling
       points = createRandomPoints(I, pointsNumberForEachImg_);
       
       %　SURF特徴量でサンプリング場合：
       %  points = detectSURFFeatures(I);
       [features, validPoints] = extractFeatures(I, points);
       
       totalFeatures = [totalFeatures; features];
   end 
   tic
   [idx, CB] = kmeans(totalFeatures, size_of_codebook, 'MaxIter', 300);
   toc
end
