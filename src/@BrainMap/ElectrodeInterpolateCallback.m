function ElectrodeInterpolateCallback(obj)
electrode=obj.SelectedElectrode;
if ~isempty(electrode)
    ind=logical(electrode.selected);
    
    channame=['C',num2str(size(electrode,1)+1)];
    
    coor=electrode.coor(ind,:);
    coor=mean(coor,1);
    
    norm=mean(electrode.norm(ind,:),1);
    radius=obj.JElectrodeRadiusSpinner.getValue();
    thickness=obj.JElectrodeThicknessSpinner.getValue();
    
    radius_ratio=obj.JElectrodeRadiusRatioSpinner.getValue()/100;
    thickness_ratio=obj.JElectrodeThicknessRatioSpinner.getValue()/100;
    color=mean(electrode.color(ind,:),1);
    
    prompt={'ChannelName','Position','Norm vector','Radius','Thickness','Color'};
    def={channame,num2str(coor),num2str(norm),num2str(radius),num2str(thickness),num2str(color)};
    title='Interpolation';
    
    answer=inputdlg(prompt,title,1,def);
    
    if ~isempty(answer)
        new_channame=answer{1};
        if ismember(new_channame,electrode.channame)
            errordlg([new_channame,' already exist !']);
            return
        end
        new_coor=str2num(answer{2});
        new_norm=str2num(answer{3});
        new_radius=str2double(answer{4});
        new_thickness=str2double(answer{5});
        new_color=str2num(answer{6});
        
        electrode.coor=cat(1,electrode.coor,new_coor);
        electrode.norm=cat(1,electrode.norm,new_norm);
        electrode.radius=cat(1,electrode.radius(:),new_radius);
        electrode.radius_ratio=cat(1,electrode.radius_ratio,radius_ratio);
        electrode.thickness=cat(1,electrode.thickness(:),new_thickness);
        electrode.color=cat(1,electrode.color,new_color);
        electrode.thickness_ratio=cat(1,electrode.thickness_ratio,thickness_ratio);
        
        electrode.selected=ones(size(electrode.coor,1),1)*false;
        electrode.selected(end)=true;
        
        electrode.channame=cat(1,electrode.channame(:),new_channame);
        electrode.map=cat(1,electrode.map,nan);
        electrode.map_sig=cat(1,electrode.map_sig,0);
        
        [faces,vertices] = createContact3D(new_coor,new_norm,new_radius,new_thickness);
        
        userdat.name=new_channame;
        userdat.ele=electrode;
        new_h=patch('parent',obj.axis_3d,'faces',faces,'vertices',vertices,...
        'facecolor',new_color,'edgecolor','y','UserData',userdat,...
        'ButtonDownFcn',@(src,evt) ClickOnElectrode(obj,src,evt),'facelighting','gouraud');
        set(electrode.handles,'edgecolor','none');
        electrode.handles=cat(1,electrode.handles(:),new_h);
        
        if electrode.ind==obj.electrode_settings.select_ele
            notify(obj,'ElectrodeSettingsChange')
        end
        
        material dull;
    end
    
end
end
