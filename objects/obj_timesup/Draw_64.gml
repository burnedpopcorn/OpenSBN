if (fadealpha > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(fadealpha);
    draw_rectangle(-10, -10, camera_get_view_width(view_camera[0]) + 10, camera_get_view_height(view_camera[0]) + 10, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    fadealpha = approach(fadealpha, 1, fadeacc);
}
