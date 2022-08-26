%This code delets electrodes designed in brainmap based on the electrode
%file name , electrode names you want to delete and what new electrode filname you want
%to give to it. It then saves the new electrode in your current
%directory.By Priscella Asman

function [channame,coor,map_sig,norm,map,color,category,count,radius,thickness] = RemoveElectrode(elec,arr,newelectrodename)
load(elec);
x = 0;
category = category;
radius = radius;
thickness =thickness;

for i= 1:53
    if ismember(i,arr)
        continue
    else
        x=x+1;
        channame2{x} =channame{i};
        coor2(x,:) = coor(i,:);
        map_sig2(x,1) = map_sig(i,:);
        norm2(x,:) = norm(i,:);
        color2(x,:)= color(i,:);
        map2(x,:) = map(i,:);
    end
end
channame ='';
coor = [];
map_sig= [];
norm= [];
map=[];
color = [];

for i = 1:x
    channame{i} =channame2{i};
end
channame = channame'
coor = coor2(1:x,:)
map_sig= map_sig2(1:x,:)
norm= norm2(1:x,:)
color = color2(1:x,:)
count = x
map = map2(1:x,:)

file = fullfile(pwd,sprintf('/%s', newelectrodename));

save(newelectrodename,'channame','coor','map_sig','norm','map','color','category','count','radius','thickness','file')
end
