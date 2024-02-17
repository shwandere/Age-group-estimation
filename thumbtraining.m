clear all
clc
train=0;
thumb=[];
for i=1:3
    for j=1:25
        for jj=0:9
            if i==1
                k=strcat(num2str(j),num2str(jj));
                finger=imread(strcat('C:\Users\HP\Desktop\sir\DATABASE-3\6-9\',k,'.bmp'));
            end
            if i==2
                k=strcat(num2str(j),num2str(jj));
                finger=imread(strcat('C:\Users\HP\Desktop\sir\DATABASE-3\10-13\',k,'.bmp'));
            end
            if i==3
                k=strcat(num2str(j),num2str(jj));
                finger=imread(strcat('C:\Users\HP\Desktop\sir\DATABASE-3\14-17\',k,'.bmp'));
            end
            finger=double(finger);
            [cA cV cD cH]=dwt2(finger, 'db1'); 
            [cA cV cD cH]=dwt2(cA, 'db1'); %2nd level
            [cA cV cD cH]=dwt2(cA, 'db1'); %3rd level
            [cA cV cD cH]=dwt2(cA, 'db1'); %4th level
            [U S V]=svd(finger);
            what = [];
            for ii=1:256 
                temp=S(ii,ii);
                what = [what temp];
            end
            B=cA';
            C=B(:)';
            print=[];
            print=[print C];
            print=[print what];
            thumb=[thumb; print];
            train=train+1;
        end
    end
end
savefile = 'thumb.mat';
save(savefile, 'thumb')