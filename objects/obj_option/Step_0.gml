var no_menus = !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig) && !instance_exists(obj_modconfig);

if (!no_menus)
    exit;

if (stopInputs)
{
    if (alarm[0] <= 0)
        alarm[0] = 15;
    
    exit;
}

if ((input_check_pressed("up") || keyboard_check_pressed(vk_up)) && optionselected > 0)
    optionselected -= 1;

if ((input_check_pressed("down") || keyboard_check_pressed(vk_down)) && optionselected < 5)
    optionselected += 1;

if (optionselected == 0)
{
    if (input_check_pressed("right") && optionsaved_fullscreen == false)
        optionsaved_fullscreen = true;
    
    if (input_check_pressed("left") && optionsaved_fullscreen == true)
        optionsaved_fullscreen = false;
    
    if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter))
    {
        window_set_fullscreen(!optionsaved_fullscreen);
        ini_open("saveData.ini");
        global.option_fullscreen = !optionsaved_fullscreen;
        ini_write_real("Option", "fullscreen", !optionsaved_fullscreen);
        ini_close();
        alarm[1] = 1;
    }
}

if (optionselected == 1)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && optionsaved_resolution < 2)
        optionsaved_resolution += 1;
    
    if ((input_check_pressed("left") || keyboard_check_pressed(vk_left)) && optionsaved_resolution > 0)
        optionsaved_resolution -= 1;
    
    if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter))
    {
        ini_open("saveData.ini");
        ini_write_real("Option", "resolution", optionsaved_resolution);
        ini_close();
        global.option_resolution = optionsaved_resolution;
        var _os_r = optionsaved_resolution;
        var resolutionX = (_os_r == 0) ? 480 : ((_os_r == 1) ? obj_gameFrame.defaultwidth : 1920);
        var resolutionY = (_os_r == 0) ? 270 : ((_os_r == 1) ? obj_gameFrame.defaultheight : 1080);
        window_set_size(resolutionX, resolutionY);
        window_center();
    }
}

if (optionselected == 2)
{
    if (!instance_exists(obj_keyconfig))
    {
        if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_enter))
        {
            stopInputs = true;
            show_message("Bitch you didnt make me yet.");
        }
    }
}

if (buffer > 0)
    buffer--;

if (optionselected == 3)
{
    if (buffer <= 0 && !instance_exists(obj_audioconfig))
    {
        if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter))
        {
            visible = false;
            
            with (instance_create(x, y, obj_audioconfig))
                depth = other.depth - 1;
        }
    }
}

if (optionselected == 4)
{
    if (!instance_exists(obj_modconfig))
    {
        if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_enter))
        {
            visible = false;
            
            with (instance_create(x, y, obj_modconfig))
                depth = other.depth - 1;
        }
    }
}

if (optionselected == 5)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && optionsaved_vibration == 0)
        optionsaved_vibration = 1;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && optionsaved_vibration == 1)
        optionsaved_vibration = 0;
    
    if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter))
    {
        ini_open("saveData.ini");
        global.option_vibration = !optionsaved_vibration;
        ini_write_real("Option", "vibration", !optionsaved_vibration);
        ini_close();
    }
}

if ((input_check_pressed("slap") || keyboard_check_pressed(vk_escape)) && no_menus)
    instance_destroy();
