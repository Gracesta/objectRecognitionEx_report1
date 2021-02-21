%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%                     init.m
%              下処理をするコード、先にニクラス物体の画像のデータを読み込む
%
%------------------------------------------------------------------%

LIST={'sushi' 'tiger'};

n = 0;
list = {};
for i=1:length(LIST)
    DIR = strcat(LIST(i), '/');
    W = dir(DIR{:})
    
    for j=1:size(W)
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
      end
    end
end

save('FileDir.mat', 'list');

