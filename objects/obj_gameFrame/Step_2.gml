var width_current = window_get_width();
var height_current = window_get_height();

if (window_has_focus())
{
    savedwidth = width_current;
    savedheight = height_current;
    saved_guiwidth = display_get_gui_width();
    saved_guiheight = display_get_gui_height();
}
else
{
    do_focus = true;
    
    if (global.option_fullscreen > 0)
        alarm[0] = 5;
}

if (window_has_focus() && (do_focus || global.option_fullscreen != gameframe_get_fullscreen() || currentwidth != width_current || currentheight != height_current))
{
    do_focus = false;
    camera_set_view_size(view_camera[0], defaultwidth * zoom, defaultheight * zoom);
    scale = min(width_current / defaultwidth, height_current / defaultheight);
    
    if (scale > 0)
    {
        surface_resize(application_surface, defaultwidth, defaultheight);
        __display_set_gui_size_hook(defaultwidth, defaultheight);
    }
    
    obj_gameFrame.defaultwidth = camera_get_view_width(view_camera[0]);
    obj_gameFrame.defaultheight = camera_get_view_height(view_camera[0]);
    currentwidth = width_current;
    currentheight = height_current;
}
