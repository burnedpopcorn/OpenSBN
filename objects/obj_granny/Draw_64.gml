if (!global.option_hud || (text_state == states.titlescreen && text_y <= -(text_sprite_height * text_yscale)))
    exit;

reset_blendmode();
var xx = text_borderpad + text_wave_x;
var yy = text_y + text_wave_y;
tex_x -= 0.5;
scr_draw_granny_texture(xx, yy, text_xscale, text_yscale, tex_x, tex_x, background_spr, background_spr2, bubble_spr);
draw_sprite_ext(bubble_spr, 1, xx, yy, text_xscale, text_yscale, 0, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(font);
draw_set_color(text_color);
scr_draw_text_arr(xx + text_contentpad, yy + text_contentpad, text_arr, text_color, 1, texteffect.updown, 
{
    offset: 1
});

with (obj_camera)
    visible = false;

with (obj_tv)
    tv_y = approach(tv_y, -300, 20);
