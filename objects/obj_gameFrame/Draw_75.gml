if (scale <= 0)
    exit;

surface_reset_target();
shader_reset();
draw_clear_alpha(c_black, 1);
draw_set_alpha(1);
draw_set_color(c_white);
gpu_set_blendenable(false);
draw_gui_surface();
gpu_set_blendenable(true);
gpu_set_blendmode(bm_normal);
gpu_set_texfilter(false);

if (window_has_focus())
    gameframe_draw();
