show = 0;
donepanic = 0;
wave_timer = 0;
text = "";
text_borderpad = 32;
text_contentpad = 24;
text_ystart = text_borderpad;
text_y = -200;
tex_x = 0;
text_state = states.titlescreen;
text_xscale = (camera_get_view_width(view_camera[0]) - 64) / sprite_get_width(spr_grannybubble);
text_oldxscale = text_xscale;
text_yscale = 1;
text_sprite_width = sprite_get_width(spr_grannybubble);
text_sprite_height = sprite_get_height(spr_grannybubble);
text_wave_x = 0;
text_wave_y = 0;
text_arr = -4;
text_dir = 1;
background_spr = spr_grannybg;
background_spr2 = spr_grannybg2;
bubble_spr = spr_grannybubble;
text_color = 0;
surfclip = -4;
surffinal = -4;
showgranny = 1;
change_y = 1;
alarm[0] = 1;
depth = 10;
voicecooldown = 0;
