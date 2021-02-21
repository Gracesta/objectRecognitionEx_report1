%-------------レポート課題1 (2クラス物体分類実験)-----------------------%
%               (2)BoFベクトルと非線形SVMによる分類
%
%               例題コード：randompointsでsampling
%              
%
%------------------------------------------------------------------%

function PT=createRandomPoints(I,num)
  [sy, sx]=size(I);
  sz=[sx sy];
  for i=1:num
    s=0;
    while s<1.6
      s=randn()*3+3;
    end
    p=ceil((sz-ceil(s)*2).*rand(1,2)+ceil(s));
    if i==1
      PT=[SURFPoints(p,'Scale',s)];
    else
      PT=[PT; SURFPoints(p,'Scale',s)];
    end
  end
end
