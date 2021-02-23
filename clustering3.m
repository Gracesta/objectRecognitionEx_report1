%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%              
%              (3) AlexNetによるDCNN特徴量と線形SVM
%               先にinit.mの実行で、ファイルのDirectoryをlistで確保した
%
%------------------------------------------------------------------%

% 画像リンクを読み込む
% FileDir: sushi and tiger, FileDir2: lion and tiger
load('FileDir2.mat');      

m = 400;
cv = 5;
idx = [1:m];

net = alexnet;

% sushi: 1~200 tiger: 201~400
imgList = list;
% label sushi with 1, tiger with 0
labels = [ones(m/2,1); zeros(m/2,1)];

% For more convincible result, shuffle the dataset
shuffled_idx = randperm(m);
imgList = imgList(shuffled_idx);
labels = labels(shuffled_idx);



prob = zeros(1,5);

% layer_numの数字のfc層のDCNN特徴量を抽出
for layer_num = 6:8
    layer_name = 'fc' + string(layer_num);
    % DCCN特徴量を抽出する
    IM = [];
    for i = 1:m
        img = imread(imgList{i});
        reimg = imresize(img,net.Layers(1).InputSize(1:2));
        % fprintf('processing with picture[%d]\n', i);
        IM = cat(4, IM, reimg);
    end
    dcnnf = activations(net,IM, layer_name);
    dcnnf = squeeze(dcnnf);
    dcnnf = dcnnf/norm(dcnnf);
    dcnnf_trans = dcnnf';
    

    % 5-fold cross validationで評価し、その五つの精度を得る
    prob = FiveCrossValidation(dcnnf_trans, labels, 'linear');
    
    averge_prob = mean(prob);
    disp(layer_name + ' prob is:' + averge_prob);
end

%------------------------------------------------------------
%
%       実行結果：
%         sushi and tiger:
%         fc6 prob is:1
%         fc7 prob is:1
%         fc8 prob is:1
% 
%         lion and tiger:
%         fc6 prob is:0.9975
%         fc7 prob is:0.9975
%         fc8 prob is:0.9975
%-----------------------------------------------------------------
