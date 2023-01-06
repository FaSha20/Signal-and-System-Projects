
clc
close all;
clear;
load TRAININGSET;
totalLetters=size(TRAIN,2);


% SELECTING THE TEST DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
subplot(1,2,1)
imshow(picture)
picture=imresize(picture,[300 1000]);
subplot(1,2,2)
imshow(picture)


%RGB2GRAY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
picture=rgb2gray(picture);
figure
subplot(1,2,1)
imshow(picture)

% THRESHOLDIG and CONVERSION TO A BINARY IMAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
threshold = graythresh(picture);
picture =~im2bw(picture,threshold);
subplot(1,2,2)
imshow(picture)



% Removing the small objects and background
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure
% picture = bwareaopen(picture,30); % removes all connected components (objects) that have fewer than 30 pixels from the binary image BW
picture = bwareaopen(picture,200); 
subplot(1,3,1)
imshow(picture)
background=bwareaopen(picture,30000);
subplot(1,3,2)
imshow(background)
picture2=picture-background;
subplot(1,3,3)
imshow(picture2)
% picture2=bwareaopen(picture2,200);
% subplot(1,4,4)
% imshow(picture2)
%%


% Labeling connected components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
imshow(picture2)
[L, Ne]=bwlabel(picture2);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off



% Decision Making
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
final_output=[];
t=[];
per_c = 0;
letter = '';
for n=1:Ne
    [r,c] = find(L==n);
    if(min(c)< per_c)
       continue;
    end;
    per_c = max(c);

    Y=picture2(min(r):max(r),min(c):max(c));
    subplot(5,5,n);
    Y=imresize(Y,[100,50]);
    imshow(Y)
    pause(0.2)
    
    
    ro=zeros(1,totalLetters);
    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end
    [MAXRO,pos]=min(ro);
    disp(MAXRO);
    disp(pos);
    if MAXRO<-0.4
        out=cell2mat(TRAIN(2,pos)); 
        %disp(out);
        if(out == 'n')
            letter = ['?'];
        elseif(out == 'h')
            letter = ['?'];
        elseif(out == 'l')
            letter = ['?'];
        elseif(out == 'd')
            letter = ['?'];
        elseif(out == 'o')
            letter = ['?'];
        elseif(out == 't')
            letter = ['?'];
        elseif(out == 'm')
            letter = ['?'];
        elseif(out == 's')
            letter = ['?'];
        elseif(out == 'y')
            letter = ['?'];
        elseif(out == 'b')
            letter = ['?'];
        elseif(out == 'g')
            letter = ['?'];
        elseif(out == 'j')
            letter = ['?'];
        elseif(out == 'v');
            letter = ['?'];
        end
        final_output=[final_output out];
    end
end



% Printing the plate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s',final_output(1:2),letter,final_output([4:length(final_output)]));
%fprintf(file,'%s',final_output);
fclose(file);
winopen('number_Plate.txt')