function BuildIOBar( obj )
import src.java.PushButton;
position = getpixelposition(obj.toolbtnpane);
col=get(obj.toolbtnpane,'BackgroundColor');
btn_d=javaObjectEDT(java.awt.Dimension());
btn_d.width=position(4);
btn_d.height=position(4);
col=javaObjectEDT(java.awt.Color(col(1),col(2),col(3)));

%             obj.JNewBtn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/new.png'],btn_d,char('Recenter'),col));
%             set(handle(obj.JRecenter,'CallbackProperties'),'MousePressedCallback',@(h,e) RecenterCallback(obj));

width=position(4)/position(3);

obj.JLoadBtn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/load_vol.png'],btn_d,char('Load volume'),col));
set(handle(obj.JLoadBtn,'CallbackProperties'),'MousePressedCallback',@(h,e) LoadVolume(obj));

[jh,gh]=javacomponent(obj.JLoadBtn,[0,0,1,1],obj.toolbtnpane);
set(gh,'Units','Norm','Position',[0,0,width,1]);

obj.JDeleteBtn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/delete_vol.png'],btn_d,char('Delete volume'),col));
set(handle(obj.JDeleteBtn,'CallbackProperties'),'MousePressedCallback',@(h,e) DeleteVolume(obj));

[jh,gh]=javacomponent(obj.JDeleteBtn,[0,0,1,1],obj.toolbtnpane);
set(gh,'Units','Norm','Position',[width,0,width,1]);

obj.JNewBtn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/new_vol.png'],btn_d,char('New volume'),col));
set(handle(obj.JNewBtn,'CallbackProperties'),'MousePressedCallback',@(h,e) NewVolume(obj));

[jh,gh]=javacomponent(obj.JNewBtn,[0,0,1,1],obj.toolbtnpane);
set(gh,'Units','Norm','Position',[width*2,0,width,1]);

obj.JSaveBtn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/save_vol.png'],btn_d,char('Save volume'),col));
set(handle(obj.JSaveBtn,'CallbackProperties'),'MousePressedCallback',@(h,e) SaveVolume(obj));

[jh,gh]=javacomponent(obj.JSaveBtn,[0,0,1,1],obj.toolbtnpane);
set(gh,'Units','Norm','Position',[width*3,0,width,1]);

obj.JExtraBtn1 = javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/vol3d.png'],btn_d,char('3D rendering'),col));
set(handle(obj.JExtraBtn1,'CallbackProperties'),'MousePressedCallback',@(h,e) VolumeRenderCallback(obj));

[jh,obj.HExtraBtn1]=javacomponent(obj.JExtraBtn1,[0,0,1,1],obj.toolbtnpane);
set(obj.HExtraBtn1,'Units','Norm','Position',[width*4,0,width,1],'visible','on');

obj.JExtraBtn2 = javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/map.png'],btn_d,char('Load map'),col));
set(handle(obj.JExtraBtn2,'CallbackProperties'),'MousePressedCallback',@(h,e) LoadMap(obj));

[jh,obj.HExtraBtn2]=javacomponent(obj.JExtraBtn2,[0,0,1,1],obj.toolbtnpane);
set(obj.HExtraBtn2,'Units','Norm','Position',[width*5,0,width,1],'visible','off');

obj.JSettingsBtn = javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/more.png'],btn_d,char('More'),col));
set(handle(obj.JSettingsBtn,'CallbackProperties'),'MousePressedCallback',@(h,e) VolumeSettingsCallback(obj));

[jh,gh]=javacomponent(obj.JSettingsBtn,[0,0,1,1],obj.toolbtnpane);
set(gh,'Units','Norm','Position',[1-width/3,0,width/3,1],'visible','on');


end

