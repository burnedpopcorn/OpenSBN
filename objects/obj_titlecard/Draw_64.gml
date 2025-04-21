if (start)
{
    draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
    var s = 1;
    draw_sprite(title_sprite, title_index, irandom_range(-s, s), irandom_range(-s, s));
}

if (!instance_exists(obj_fadeout))
    draw_set_alpha(fadealpha);
else
    draw_set_alpha(obj_fadeout.fadealpha);

draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);
