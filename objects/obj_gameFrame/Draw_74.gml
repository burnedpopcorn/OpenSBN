var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

if (!surface_exists(gui_surface))
    gui_surface = surface_create(gui_w, gui_h);

if (surface_get_width(gui_surface) != gui_w || surface_get_height(gui_surface) != gui_h)
    surface_resize(gui_surface, gui_w, gui_h);

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);
gpu_set_blendenable(false);
draw_application_surface();
gpu_set_blendenable(true);
