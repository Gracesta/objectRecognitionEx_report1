function prob = FiveCrossValidation(data, labels, myKernel)
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
    end

end