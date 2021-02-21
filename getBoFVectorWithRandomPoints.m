%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%               (2)BoFベクトルと非線形SVMによる分類
%
%               getBoFVectorWithRandomPoints.m
%               RandomPointsでsamplingした特徴量についてのBoF特徴量の抽出
%              
%               コードブック、画像集合のリンク、作りたいポイントの数を受け取り、
%               Bag-of-feature特徴量を返す
%
%------------------------------------------------------------------%
function myBoF = getBoFVectorWithRandomPoints(codebook, img, points_num)
    codebook_size = size(codebook, 1);
    img_num = length(img);

    myBoF = zeros(img_num, codebook_size);

    for i = 1: img_num
       I = rgb2gray(imread(img{i}));
       points = createRandomPoints(I, points_num);
       [features, validpoints] = extractFeatures(I, points);
       for j=1: size(features, 1)
           featureMat = repmat(features(j,:), codebook_size, 1);
           rslMat = (featureMat - codebook) .^2;

           % distMat(i): distance between i_th feature in codebook
           % and j_th feature in features
           distMat = sum(rslMat, 2);
           [minVal, minIdx] = min(distMat);

           myBoF(i, minIdx) = myBoF(i, minIdx) + 1;
       end
       % Regularization
       %myBoF(i, :) = myBoF(i, :) / sum(myBoF(i, :));
    end

end