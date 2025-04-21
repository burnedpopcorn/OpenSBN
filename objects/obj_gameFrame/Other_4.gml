view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], defaultwidth * zoom, defaultheight * zoom);

while (surface_get_target() != -1 && surface_get_target() != application_surface)
    surface_reset_target();
