if (selected == 0)
{
    if (input_check_pressed("right") && optionselected < 2)
        optionselected += 1;
    else if (input_check_pressed("left") && optionselected > 0)
        optionselected -= 1;
    
    if ((input_check_pressed("jump") || keyboard_check_pressed(vk_enter)) && optionselected == 0)
    {
        obj_file1.sprite_index = spr_null;
        selected = 1;
        alarm[0] = 50;
    }
    
    if ((input_check_pressed("jump") || keyboard_check_pressed(vk_enter)) && optionselected == 1)
    {
        selected = 1;
        alarm[1] = 5;
    }
    
    if ((input_check_pressed("jump") || keyboard_check_pressed(vk_enter)) && optionselected == 2)
    {
        selected = 1;
        alarm[2] = 5;
    }
}

var lay_id = layer_get_id("Backgrounds_2");
var back_id = layer_background_get_id_fixed(lay_id);
layer_background_index(back_id, optionselected);
