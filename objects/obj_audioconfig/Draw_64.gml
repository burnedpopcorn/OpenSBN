draw_rectangle_color(0, 0, obj_gameFrame.defaultwidth, obj_gameFrame.defaultheight, c_black, c_black, c_black, c_black, 0);
draw_set_font(global.bigfont);
draw_set_halign(fa_left);
draw_set_color(c_white);
var _os = audio_select;
draw_text_colour(330, 100, "BACK", c_white, c_white, c_white, c_white, (_os == -1) ? 1 : 0.5);
draw_text_colour(330, 175, "MASTER", c_white, c_white, c_white, c_white, (_os == 0) ? 1 : 0.5);
draw_text_colour(580, 175, string(audiosaved_master), c_white, c_white, c_white, c_white, (_os == 0) ? 1 : 0.5);
draw_text_colour(330, 250, "MUSIC", c_white, c_white, c_white, c_white, (_os == 1) ? 1 : 0.5);
draw_text_colour(580, 250, string(audiosaved_music), c_white, c_white, c_white, c_white, (_os == 1) ? 1 : 0.5);
draw_text_colour(330, 325, "SFX", c_white, c_white, c_white, c_white, (_os == 2) ? 1 : 0.5);
draw_text_colour(580, 325, string(audiosaved_sfx), c_white, c_white, c_white, c_white, (_os == 2) ? 1 : 0.5);
