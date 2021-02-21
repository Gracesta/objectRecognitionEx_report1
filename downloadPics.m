%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%
%             実験用画像を集めるためのプログラム
%              urllist1.txt/urllist2.txtのURLの画像全部ダウンロード
%               
%
%------------------------------------------------------------------%

list = textread('urllist2.txt','%s'); % list = textread('urllist1.txt','%s');

OUTDIR='tiger';                     % OUTDIR='sushi';        
mkdir(OUTDIR);
for i=1:size(list,1)
  fname=strcat(OUTDIR,'/',num2str(i,'%04d'),'.jpg')
  websave(fname,list{i});
end