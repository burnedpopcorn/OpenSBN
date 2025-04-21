if (!global.option_secret_greenifier)
{
    instance_destroy();
    exit;
}

draw_set_alpha(green);
draw_rectangle_color(0, 0, 999, 999, c_lime, c_lime, c_lime, c_lime, false);
draw_set_alpha(1);
