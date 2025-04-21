if (active && dimOpacity > 0)
{
    draw_set_alpha(dimOpacity);
    draw_set_color(c_black);
    draw_rectangle(-50, -50, camera_get_view_width(view_camera[0]) + 50, camera_get_view_height(view_camera[0]) + 50, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
