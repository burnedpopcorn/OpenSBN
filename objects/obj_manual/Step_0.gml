if (input_check_pressed("right") && i < 12)
    i += 1;

if (-input_check_pressed("left") && i > 0)
    i -= 1;

if (input_check_pressed("slap") || keyboard_check_pressed(vk_f5) || input_check("start"))
{
    instance_destroy();
    obj_mainmenuselect.selected = 0;
}
