if ((input_check_pressed("up") || keyboard_check_pressed(vk_up)) && optionselected > 0)
    optionselected -= 1;

if ((input_check_pressed("down") || keyboard_check_pressed(vk_down)) && optionselected < 5)
    optionselected += 1;

ini_open("saveData.ini");

if (optionselected == 0)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && attackstyle < 2)
        attackstyle++;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && attackstyle > 0)
        attackstyle--;
    
    if (input_check_pressed("jump"))
    {
        global.attackstyle = attackstyle;
        ini_write_real("ScoutModConfig", "attackstyle", attackstyle);
    }
}

if (optionselected == 1)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && hardmode == 1)
        hardmode = 0;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && hardmode == 0)
        hardmode = 1;
    
    if (input_check_pressed("jump"))
    {
        global.hardmode = hardmode;
        ini_write_real("ScoutModConfig", "hardmode", hardmode);
    }
}

if (optionselected == 2)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && doubleenem == 1)
        doubleenem = 0;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && doubleenem == 0)
        doubleenem = 1;
    
    if (input_check_pressed("jump"))
    {
        global.doubleenem = doubleenem;
        ini_write_real("ScoutModConfig", "doubleEnem", doubleenem);
    }
}

if (optionselected == 3)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && badHud == 1)
        badHud = 0;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && badHud == 0)
        badHud = 1;
    
    if (input_check_pressed("jump"))
    {
        global.shithud = badHud;
        ini_write_real("ScoutModConfig", "badHud", badHud);
    }
}

if (optionselected == 4)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && collisions == 1)
        collisions = 0;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && collisions == 0)
        collisions = 1;
    
    if (input_check_pressed("jump"))
    {
        global.showing_collisions = collisions;
        ini_write_real("ScoutModConfig", "collisions", collisions);
    }
}

if (optionselected == 5)
{
    if ((input_check_pressed("right") || keyboard_check_pressed(vk_right)) && lowperf == 1)
        lowperf = 0;
    
    if ((-input_check_pressed("left") || keyboard_check_pressed(vk_left)) && lowperf == 0)
        lowperf = 1;
    
    if (input_check_pressed("jump"))
    {
        global.performance_mode = lowperf;
        ini_write_real("ScoutModConfig", "performance", lowperf);
    }
}

ini_close();

if (input_check_pressed("slap") || keyboard_check_pressed(vk_escape))
{
    if (instance_exists(obj_option))
        obj_option.visible = true;
    
    instance_destroy();
}
