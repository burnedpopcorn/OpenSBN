function scr_initinput()
{
    scr_setinput_init();
    scr_input_create();
}

function scr_setinput_init()
{
    function Input(argument0, argument1, argument2, argument3 = 0, argument4 = false) constructor
    {
        name = argument0;
        held = false;
        pressed = false;
        released = false;
        keyInputs = argument1;
        gpInputs = argument2;
        gpInputDeadzone = argument3;
        gpAxisInvert = argument4;
        stickpressed = false;
        icon = scr_input_set_icon(argument0);
        
        update = function()
        {
            checkheld();
            checkpressed();
            checkreleased();
        };
        
        checkheld = function()
        {
            for (var i = 0; i < array_length(keyInputs); i++)
            {
                if (keyboard_check(keyInputs[i]))
                {
                    held = true;
                    exit;
                }
            }
            
            for (var i = 0; i < array_length(gpInputs); i++)
            {
                var dz = scr_checkdeadzone(gpInputs[i], name);
                
                if (scr_gpinput_isaxis(gpInputs[i]))
                {
                    if ((!gpAxisInvert && gamepad_axis_value(global.player_input_device, gpInputs[i]) >= dz) || (gpAxisInvert && gamepad_axis_value(global.player_input_device, gpInputs[i]) <= -dz))
                    {
                        held = true;
                        exit;
                    }
                }
                else if (gamepad_button_check(global.player_input_device, gpInputs[i]))
                {
                    held = true;
                    exit;
                }
            }
            
            held = false;
        };
        
        checkpressed = function()
        {
            for (var i = 0; i < array_length(keyInputs); i++)
            {
                if (keyboard_check_pressed(keyInputs[i]))
                {
                    pressed = true;
                    exit;
                }
            }
            
            for (var i = 0; i < array_length(gpInputs); i++)
            {
                var dz = scr_checkdeadzone(gpInputs[i], name);
                
                if (scr_gpinput_isaxis(gpInputs[i]))
                {
                    if (!scr_input_stickpressed(gpInputs[i]) && ((!gpAxisInvert && gamepad_axis_value(global.player_input_device, gpInputs[i]) >= dz) || (gpAxisInvert && gamepad_axis_value(global.player_input_device, gpInputs[i]) <= -dz)))
                    {
                        pressed = true;
                        ds_map_set(global.stickpressed, string(gpInputs[i]), true);
                        exit;
                    }
                }
                else if (gamepad_button_check_pressed(global.player_input_device, gpInputs[i]))
                {
                    pressed = true;
                    exit;
                }
            }
            
            pressed = false;
        };
        
        checkreleased = function()
        {
            for (var i = 0; i < array_length(keyInputs); i++)
            {
                if (keyboard_check_released(keyInputs[i]))
                {
                    released = true;
                    exit;
                }
            }
            
            for (var i = 0; i < array_length(gpInputs); i++)
            {
                var dz = scr_checkdeadzone(gpInputs[i], name);
                
                if (scr_gpinput_isaxis(gpInputs[i]))
                {
                    if ((!gpAxisInvert && !scr_input_stickpressed(gpInputs[i]) && gamepad_axis_value(global.player_input_device, gpInputs[i]) <= dz) || (gpAxisInvert && gamepad_axis_value(global.player_input_device, gpInputs[i]) >= -dz))
                    {
                        released = true;
                        exit;
                    }
                }
                else if (gamepad_button_check_released(global.player_input_device, gpInputs[i]))
                {
                    released = true;
                    exit;
                }
            }
            
            released = false;
        };
    }
    
    ini_open_from_string(obj_savesystem.ini_str_options);
    global.deadzones[deadzone.master] = ini_read_real("Option", "deadzoneMaster", 0.3);
    global.deadzones[deadzone.vertical] = ini_read_real("Option", "deadzoneVertical", 0.5);
    global.deadzones[deadzone.horizontal] = ini_read_real("Option", "deadzoneHorizontal", 0.5);
    global.deadzones[deadzone.press] = ini_read_real("Option", "deadzonePress", 0.5);
    global.deadzones[deadzone.sjump] = ini_read_real("Option", "deadzoneSJump", 0.8);
    global.deadzones[deadzone.crouch] = ini_read_real("Option", "deadzoneCrouch", 0.65);
    ini_close();
}

enum deadzone
{
	master = 0,
	vertical = 1,
	horizontal = 2,
	press = 3,
	sjump = 4,
	crouch = 5,
}

function scr_input_create()
{
    if (!variable_global_exists("input_map"))
        global.input_map = ds_map_create();
    
    if (!variable_global_exists("stickpressed"))
    {
        global.stickpressed = ds_map_create();
        var stickarr = [32785, 32786, 32787, 32788];
        
        for (var i = 0; i < array_length(stickarr); i++)
            ds_map_set(global.stickpressed, string(stickarr[i]), false);
    }
    
    ini_open_from_string(obj_savesystem.ini_str_options);
    scr_input_ini_read("up", false, [38]);
    scr_input_ini_read("down", false, [40]);
    scr_input_ini_read("left", false, [37]);
    scr_input_ini_read("right", false, [39]);
    scr_input_ini_read("jump", false, [90]);
    scr_input_ini_read("slap", false, [88]);
    scr_input_ini_read("taunt", false, [67]);
    scr_input_ini_read("shoot", false, [65]);
    scr_input_ini_read("attack", false, [16]);
    scr_input_ini_read("superjump", false, []);
    scr_input_ini_read("groundpound", false, []);
    scr_input_ini_read("start", false, [27]);
    scr_input_ini_read("special", false, [86]);
    scr_input_ini_read("upC", true, [32781, 32786], true, true);
    scr_input_ini_read("downC", true, [32782, 32786], true, false);
    scr_input_ini_read("leftC", true, [32783, 32785], true, true);
    scr_input_ini_read("rightC", true, [32784, 32785], true, false);
    scr_input_ini_read("jumpC", true, [32769], true);
    scr_input_ini_read("slapC", true, [32771], true);
    scr_input_ini_read("tauntC", true, [32772], true);
    scr_input_ini_read("shootC", true, [32770], true);
    scr_input_ini_read("attackC", true, [32774, 32776], 1);
    scr_input_ini_read("superjumpC", true, [], true);
    scr_input_ini_read("groundpoundC", true, [], true);
    scr_input_ini_read("startC", true, [32778], true);
    scr_input_ini_read("specialC", true, [32775], true);
    ini_close();
}

function scr_input_add(argument0, argument1)
{
    ds_map_set(global.input_map, argument0, argument1);
}

function input_get(argument0)
{
    return ds_map_find_value(global.input_map, argument0);
}

function scr_input_ini_read(argument0, argument1, argument2, argument3 = false, argument4 = false)
{
    var _inp = ini_read_string("Control", argument0, "");
    var inputs_string_arr = string_split(_inp, ",");
    var inputs = [];
    
    for (var i = 0; i < array_length(inputs_string_arr); i++)
    {
        var action = inputs_string_arr[i];
        
        if (action == "")
            break;
        
        array_push(inputs, real(action));
    }
    
    if (_inp == "")
        inputs = argument2;
    
    show_debug_message(string("loaded input {0}: {1}", argument0, inputs));
    scr_input_add(argument0, new Input(argument0, argument1 ? [] : inputs, argument1 ? inputs : [], argument3, argument4));
}

function input_save(argument0)
{
    var gpCheck = false;
    var key = string_replace(argument0.name, "C", "");
    
    if (string_length(key) < string_length(argument0.name))
        gpCheck = true;
    
    var str = "";
    
    if (!gpCheck)
    {
        for (var i = 0; i < array_length(argument0.keyInputs); i++)
        {
            if (str == "")
                str = argument0.keyInputs[i];
            else
                str = string_concat(str, ",", argument0.keyInputs[i]);
        }
    }
    else
    {
        for (var i = 0; i < array_length(argument0.gpInputs); i++)
        {
            if (str == "")
                str = argument0.gpInputs[i];
            else
                str = string_concat(str, ",", argument0.gpInputs[i]);
        }
    }
    
    trace(string("Trace input_save: {0} = {1}", argument0.name, str));
    ini_open_from_string(obj_savesystem.ini_str_options);
    ini_write_string("Control", string(argument0.name), string(str));
    obj_savesystem.ini_str_options = ini_close();
    gamesave_async_save_options();
}

function scr_resetinput()
{
    ini_open_from_string(obj_savesystem.ini_str_options);
    trace("Deleting Control Settings");
    ini_section_delete("Control");
    obj_savesystem.ini_str_options = ini_close();
    scr_initinput();
}

function scr_input_update(argument0 = -1)
{
    var dz = global.deadzones[deadzone.master];
    gamepad_set_axis_deadzone(argument0, dz);
    var keys = ds_map_keys_to_array(global.input_map);
    
    for (var i = 0; i < array_length(keys); i++)
        ds_map_find_value(global.input_map, array_get(keys, i)).update(object_index);
    
    scr_input_stickpressed_update();
}

function input_check(argument0)
{
    if (!instance_exists(obj_inputController))
    {
        instance_create(0, 0, obj_inputController);
        return false;
    }
    
    if (global.shellactivate)
        return false;
    
    var result = false;
    var keyStruct = input_get(argument0);
    
    if (!is_undefined(keyStruct))
        result = keyStruct.held;
    
    var gpStruct = input_get(concat(argument0, "C"));
    
    if (!is_undefined(gpStruct))
        result = result || gpStruct.held;
    
    return result;
}

function input_check_pressed(argument0)
{
    if (!instance_exists(obj_inputController))
    {
        instance_create(0, 0, obj_inputController);
        return false;
    }
    
    if (global.shellactivate)
        return false;
    
    var result = false;
    var keyStruct = input_get(argument0);
    
    if (!is_undefined(keyStruct))
        result = keyStruct.pressed;
    
    var gpStruct = input_get(concat(argument0, "C"));
    
    if (!is_undefined(gpStruct))
        result = result || gpStruct.pressed;
    
    return result;
}
