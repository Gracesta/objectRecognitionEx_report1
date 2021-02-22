%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%               (2)BoFベクトルと非線形SVMによる分類
%
%               5-fold cross-validation:
%               data, labelsでデータを入力、
%               myKernelにより線形・非線形のKernelの指定
%              
%
%------------------------------------------------------------------%

function [prob, miss, nomiss] = FiveCrossValidation(data, labels, myKernel)
    miss = [];
    nomiss = [];
    m = size(data, 1);
    cv = 5;
    prob = zeros(1, 5);
    idx = [1:m];
    for k = 1:5
         train_idx = find(mod(idx,cv) ~= (k-1));
         eval_idx = find(mod(idx,cv) == (k-1));

         train_set = data(train_idx, :);
         train_label = labels(train_idx, :);

         eval_set = data(eval_idx, :);
         eval_label = labels(eval_idx, :);

         model = fitcsvm(train_set, train_label, 'KernelFunction',myKernel, 'KernelScale','auto');
         [pred, scores] = predict(model, eval_set);
         hits = sum(pred == eval_label);
         
         prob(k) = hits / m * cv;
         nomiss = [nomiss eval_idx(pred == eval_label)];
         miss = [miss eval_idx(pred ~= eval_label)];
    end
    
end