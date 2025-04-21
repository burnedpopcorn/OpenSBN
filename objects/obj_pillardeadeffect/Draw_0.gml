var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
draw_set_alpha(fade);
draw_rectangle_color(cx - 32, cy - 32, cx + cw + 32, cy + ch + 32, c_white, c_white, c_white, c_white, 0);

with (obj_baddieDead)
{
    if (sprite_index == spr_hungrypillar_angry)
        draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, 0, image_alpha);
}

with (obj_player1)
{
    if (visible)
        draw_sprite_ext_flash(sprite_index, image_index, x, y, xscale, yscale, angle, 0, image_alpha);
}

draw_set_alpha(1);
