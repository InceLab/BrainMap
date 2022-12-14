function BuildToolbar( obj )
import src.java.PushButton;
import src.java.TogButton;
import javax.swing.ButtonGroup;

obj.Toolbar=uitoolbar(obj.fig);
drawnow
obj.JToolbar=get(get(obj.Toolbar,'JavaContainer'),'ComponentPeer');
d=obj.JToolbar(1).getPreferredSize();
btn_d=javaObjectEDT(java.awt.Dimension());
btn_d.width=d.height;
btn_d.height=d.height;
col=obj.JToolbar(1).getBackground();

obj.IconLightOn=javaObjectEDT(javax.swing.ImageIcon([obj.brainmap_path,'/db/icon/light.png']));
obj.IconLightOff=javaObjectEDT(javax.swing.ImageIcon([obj.brainmap_path,'/db/icon/nolight.png']));

obj.JRecenter=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/recenter.png'],btn_d,char('Recenter'),col));
set(handle(obj.JRecenter,'CallbackProperties'),'MousePressedCallback',@(h,e) RecenterCallback(obj));
obj.JToolbar(1).add(obj.JRecenter);

obj.JLight=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/nolight.png'],btn_d,char('Light off'),col));
set(handle(obj.JLight,'CallbackProperties'),'MousePressedCallback',@(h,e) LightOffCallback(obj));
obj.JToolbar(1).add(obj.JLight);

obj.JCanvasColor=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/bg_color.png'],btn_d,char('Canvas color'),col));
set(handle(obj.JCanvasColor,'CallbackProperties'),'MousePressedCallback',@(src,evt) ChangeCanvasColor(obj));
obj.JToolbar(1).add(obj.JCanvasColor);

obj.JToolbar(1).addSeparator();
obj.JTogNavigation=javaObjectEDT(TogButton([obj.brainmap_path,'/db/icon/arrow.png'],btn_d,char('Navigation'),col));
obj.JToolbar(1).add(obj.JTogNavigation);

obj.JToolbar(1).addSeparator();
obj.JTogNewElectrode=javaObjectEDT(TogButton([obj.brainmap_path,'/db/icon/new_ele.png'],btn_d,char('New electrode'),col));
obj.JToolbar(1).add(obj.JTogNewElectrode);

obj.JTogPickElectrode=javaObjectEDT(TogButton([obj.brainmap_path,'/db/icon/pick_ele.png'],btn_d,char('Pick electrode ctrl+e'),col));
obj.JToolbar(1).add(obj.JTogPickElectrode);
obj.JToolbar(1).addSeparator();

obj.JZoomIn=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/zoom_in.png'],btn_d,char('Zoom in'),col));
set(handle(obj.JZoomIn,'CallbackProperties'),'MousePressedCallback',@(h,e) ZoomInCallback(obj));
obj.JToolbar(1).add(obj.JZoomIn);

obj.JZoomOut=javaObjectEDT(PushButton([obj.brainmap_path,'/db/icon/zoom_out.png'],btn_d,char('Zoom out'),col));
set(handle(obj.JZoomOut,'CallbackProperties'),'MousePressedCallback',@(h,e) ZoomOutCallback(obj));
obj.JToolbar(1).add(obj.JZoomOut);
obj.JToolbar(1).addSeparator();


group=javaObjectEDT(ButtonGroup());
group.add(obj.JTogNavigation);
group.add(obj.JTogNewElectrode);
group.add(obj.JTogPickElectrode);

obj.JToolbar(1).repaint;
obj.JToolbar(1).revalidate;
end
