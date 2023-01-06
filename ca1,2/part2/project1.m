clear;        
close all;  


di=dir('nums');
st={di.name};
nam=st(3:end);
len=length(nam);


TRAIN=cell(2,len);
for i=1:len
   a = imread(['nums','\',cell2mat(nam(i))]);
   threshold = graythresh(a);
   picture =~im2bw(a,threshold);
   TRAIN(1,i) = {picture};
  % TRAIN(1,i)={imread(['nums','\',cell2mat(nam(i))])};
   temp=cell2mat(nam(i));
   TRAIN(2,i)={temp(1)};
end

save('TRAININGSET.mat','TRAIN');
%clear;