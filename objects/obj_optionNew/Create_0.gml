menu = 0;
menuprev = 0;
menuarr = [];
selected = 0;
backbuffer = 0;
slidebuffer = 0;
slidevalue = 0;
moveslide = 0;
bg_x = 0;
bg_y = 0;
keystring = "";
keyboard_string = "";

enum MENUS
{
	mainmenu = 0,
	
	audio = 1,
	video = 2,
	game = 3,
	controls = 4,
	// submenus of controls
	keyboard = 5,
	gamepad = 6,
	deadzones = 7,
	
	secret = 8
}

enum menutype
{
	menu = 0, // one where you select submenu to enter
	press = 1,
	redirect = 2, // back button
	toggle = 3,
	multiple = 4,
	slider = 5
}

optionMenu = function(argument0, argument1 = bg_options_general, argument2 = false) constructor
{
    type = menutype.menu;
    index = argument0;
    align_center = argument2;
    bgspr = argument1;
    ypad = 40;
    xpad = 150;
    options = [];
    alpha = 0;
    
    addOption = function()
    {
        for (var i = 0; i < argument_count; i++)
        {
            var option = argument[i];
            array_push(options, option);
            show_debug_message(concat("Added option: ", option.name, " to menu index: ", index));
        }
    };
};

optionPress = function(argument0) constructor
{
    type = menutype.press;
    name = argument0;
    onActivate = undefined;
    
    onPress = function()
    {
        if (!is_undefined(onActivate))
            onActivate();
    };
};

optionRedirect = function(argument0, argument1, argument2 = [spr_null, 0]) constructor
{
    type = menutype.redirect;
    name = argument0;
    drawArr = argument2;
    target = argument1;
    onActivate = undefined;
    
    drawIcon = function(argument0, argument1, argument2 = 1, argument3 = 1, argument4 = 0, argument5 = c_white, argument6 = 1)
    {
        draw_sprite_ext(drawArr[0], drawArr[1], argument0, argument1, argument2, argument3, argument4, argument5, argument6);
    };
    
    onPress = function()
    {
        with (obj_optionNew)
        {
            menuprev = menu;
            menu = other.target;
            selected = 0;
        }
        
        if (!is_undefined(onActivate))
            onActivate();
    };
};

optionToggle = function(argument0, argument1, argument2) constructor
{
    type = menutype.toggle;
    name = argument0;
    variable = argument1;
    key = argument2;
    value = variable_global_get(argument1);
    onActivate = undefined;
    
    onPress = function()
    {
        var val = variable_global_get(variable);
        val = !val;
        variable_global_set(variable, val);
        value = val;
        ini_open_from_string(obj_savesystem.ini_str_options);
        ini_write_real("Option", key, val);
        obj_savesystem.ini_str_options = ini_close();
        
        if (!is_undefined(onActivate))
            onActivate();
    };
};

optionMultiple = function(argument0, argument1, argument2, argument3) constructor
{
    type = menutype.multiple;
    name = argument0;
    variable = argument1;
    key = argument2;
    value = variable_global_get(argument1);
    dictionary = argument3;
    onActivate = undefined;
    
    onPress = function(argument0)
    {
        var val = variable_global_get(variable);
        val += argument0;
        
        if (val < 0)
            val = array_length(dictionary) - 1;
        
        if (val >= array_length(dictionary))
            val = 0;
        
        variable_global_set(variable, val);
        value = val;
        ini_open_from_string(obj_savesystem.ini_str_options);
        ini_write_real("Option", key, val);
        obj_savesystem.ini_str_options = ini_close();
        
        if (!is_undefined(onActivate))
            onActivate();
    };
};

optionSlide = function(argument0, argument1, argument2, argument3 = 100, argument4 = undefined, argument5 = false, argument6 = 0) constructor
{
    type = menutype.slider;
    name = argument0;
    variable = argument1;
    key = argument2;
    use_array = argument5;
    index = argument6;
    value_min = 0;
    value_max = 100;
    
    if (argument5)
        value = array_get(variable_global_get(argument1), argument6) * argument3;
    else
        value = variable_global_get(argument1) * argument3;
    
    multiplier = argument3;
    moving = false;
    onActivate = undefined;
    
    onChange = function(argument0)
    {
        var val = 50;
        
        if (use_array)
            val = array_get(variable_global_get(variable), index) * multiplier;
        else
            val = variable_global_get(variable) * multiplier;
        
        val += argument0;
        val = clamp(val, 0, 100);
        value = val;
        
        if (val != 0 && val != 100)
        {
            moving = true;
            
            if (!is_undefined(sound))
            {
                if (!event_isplaying(sound))
                    fmod_event_play(sound);
            }
        }
        
        if (use_array)
            array_set(variable_global_get(variable), index, val / multiplier);
        else
            variable_global_set(variable, val / multiplier);
    };
    
    doSet = function()
    {
        silence();
        var val = 0.5;
        
        if (use_array)
            val = array_get(variable_global_get(variable), index);
        else
            val = variable_global_get(variable);
        
        ini_open_from_string(obj_savesystem.ini_str_options);
        ini_write_real("Option", key, val);
        obj_savesystem.ini_str_options = ini_close();
        moving = false;
        
        if (!is_undefined(onActivate))
            onActivate();
    };
    
    makeSound = function(argument0)
    {
        if (is_undefined(argument0))
            return undefined;
        
        return fmod_createEventInstance(argument0);
    };
    
    silence = function()
    {
        if (!is_undefined(sound))
        {
            if (event_isplaying(sound))
                fmod_event_stop(sound, true);
        }
    };
    
    sound = makeSound(argument4);
};

event_user(0);
