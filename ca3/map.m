map = cell(2,32);
letters = 'abcdefghijklmnopqrstuvwxyz .,!?;"';

for i=1:32
   map(1,i) = {letters(i)};
   map(2,i)={dec2bin(i-1,5)};
end

 mapset = containers.Map(map(1,:), map(2,:));
 
 save('MAPSET.mat','mapset');