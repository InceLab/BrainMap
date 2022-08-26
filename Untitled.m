Funtion y = removeelectrode(arr)
x=0;
for i= 1:53
    if ismember(i,[1,5:8,9,13:16,17,21:25,29:32,37:39,46:48,51:53])
        continue
    else    
        x=x+1;
        channame2{x} =channame{i};
        coor2(x,:) = coor(i,:);
        map_sig2(x,1) = map_sig(i,:);
        norm2(x,:) = norm(i,:);
        color2(x,:)= color(i,:);
        map2(x,:) = NaN;
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
channame = channame';
coor = coor2(1:x,:);
map_sig= map_sig2(1:x,:);
norm= norm2(1:x,:);
color = color2(1:x,:);
count = x;
map = map2;
end