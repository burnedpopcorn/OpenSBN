var s = surface_create(obj_gameFrame.defaultwidth, obj_gameFrame.defaultheight);
surface_set_target(s);
draw_clear_alpha(c_black, 0);
surface_reset_target();
array_push(surfArr, s);
alarm[0] = 5;
