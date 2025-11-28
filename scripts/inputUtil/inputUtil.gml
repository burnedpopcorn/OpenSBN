function scr_gpinput_isaxis(argument0)
{
    var axes = [gp_axisrh, gp_axisrv, gp_axislv, gp_axislh];
    
    if (array_contains(axes, argument0))
        return true;
    
    return false;
}

function scr_input_stickpressed(argument0)
{
    var s = string(argument0);
    return ds_map_find_value(global.stickpressed, s);
}

function scr_input_stickpressed_update(argument0 = global.player_input_device, argument1 = global.deadzones[deadzone.master])
{
    var sticks = [gp_axislh, gp_axislv, gp_axisrh, gp_axisrv];
    
    for (var i = 0; i < array_length(sticks); i++)
    {
        var s = string(sticks[i]);
        var val = gamepad_axis_value(argument0, sticks[i]);
        var pressed = ds_map_find_value(global.stickpressed, s);
        
        if (pressed && val < argument1 && val > -argument1)
            ds_map_set(global.stickpressed, s, false);
    }
}

function scr_checkdeadzone(argument0, argument1)
{
    var dz = global.deadzones[deadzone.press];
    
    switch (argument0)
    {
        case gp_axislh:
        case gp_axisrh:
            dz = global.deadzones[deadzone.horizontal];
            break;
        
        case gp_axislv:
        case gp_axisrv:
            dz = global.deadzones[deadzone.vertical];
            break;
    }
    
    if (instance_exists(obj_player1))
    {
        switch (argument1)
        {
            case "upC":
                if (obj_player1.state == states.Sjumpprep)
                    dz = global.deadzones[deadzone.sjump];
                
                break;
            
            case "downC":
                if (obj_player1.state == states.crouch)
                    dz = global.deadzones[deadzone.crouch];
                
                break;
        }
    }
    
    return dz;
}

function scr_checkanygamepad(argument0)
{
    var gpButtons = 
	[
		gp_face1, 
		gp_face2, 
		gp_face3, 
		gp_face4, 
		gp_shoulderl, 
		gp_shoulderlb, 
		gp_shoulderr, 
		gp_shoulderrb, 
		gp_select, 
		gp_start, 
		gp_stickl, 
		gp_stickr, 
		gp_padu, 
		gp_padd, 
		gp_padl, 
		gp_padr, 
		gp_axislh, 
		gp_axislv, 
		gp_axisrv, 
		gp_axisrh
	];
    
    for (var i = 0; i < array_length(gpButtons); i++)
    {
        if (gamepad_button_check_pressed(argument0, gpButtons[i]))
            return gpButtons[i];
    }
    
    return noone;
}

function scr_check_joysticks(argument0, argument1 = 0.5)
{
    var sticks = [gp_axislh, gp_axislv, gp_axisrh, gp_axisrv];
    
    for (var i = 0; i < array_length(sticks); i++)
    {
        var val = gamepad_axis_value(argument0, sticks[i]);
        
        if (val > argument1)
            return sticks[i];
        
        if (val < -argument1)
            return sticks[i];
    }
    
    return noone;
}

function scr_checkanystick(argument0, argument1 = 0.5)
{
    var sticks = [gp_axislh, gp_axislv, gp_axisrh, gp_axisrv];
    
    for (var i = 0; i < array_length(sticks); i++)
    {
        var val = gamepad_axis_value(argument0, sticks[i]);
        
        if (val > argument1 || val < -argument1)
            return true;
    }
    
    return false;
}

function scr_checksuperjump()
{
    var enabled = global.option_sjump_gp;
    
    if (global.player_input_device < 0)
        enabled = global.option_sjump_key;
    
    return (!enabled && input_check("up")) || input_check("superjump");
}

function scr_checkgroundpound()
{
    var enabled = global.option_groundpound_gp;
    
    if (global.player_input_device < 0)
        enabled = global.option_groundpound_key;
    
    return input_check_pressed("down") || (enabled && input_check_pressed("groundpound"));
}

function scr_button_pressed(argument0)
{
    if (keyboard_check_pressed(vk_enter) || input_get("jump").pressed)
        return -1;
    else if (gamepad_is_connected(argument0))
    {
        if (gamepad_button_check(argument0, gp_face1) || gamepad_button_check(argument0, gp_start))
            return argument0;
    }
    
    return -2;
}

function scr_input_icon_define()
{
    input_addIcon([vk_shift], spr_tutorialkey_special, 0);
    input_addIcon([vk_control], spr_tutorialkey_special, 1);
    input_addIcon([vk_space], spr_tutorialkey_special, 2);
    input_addIcon([vk_up], spr_tutorialkey_special, 3);
    input_addIcon([vk_down], spr_tutorialkey_special, 4);
    input_addIcon([vk_right], spr_tutorialkey_special, 5);
    input_addIcon([vk_left], spr_tutorialkey_special, 6);
    input_addIcon([vk_escape], spr_tutorialkey_special, 7);
    input_addIcon([vk_alt], spr_tutorialkey_special, 8);
    input_addIcon(["NONE"], spr_tutorialkey_empty);
	
    var alphabet = 
	[
		"A", "B", "C", "D", "E", "F", 
		"G", "H", "I", "J", "K", "L", 
		"M", "N", "O", "P", "Q", "R", 
		"S", "T", "U", "V", "W", "X", 
		"Y", "Z"
	];
    for (var i = 0; i < array_length(alphabet); i++)
        input_addIcon([ord(alphabet[i])], spr_tutorialkey_letters, i);
    
    input_addIcon([gp_axislh, gp_axislv], spr_gamepadbutton_leftstick);
    input_addIcon([gp_axisrh, gp_axisrv], spr_gamepadbutton_rightstick);
    input_addIcon([gp_face1], spr_gamepadbutton_south);
    input_addIcon([gp_face2], spr_gamepadbutton_east);
    input_addIcon([gp_face3], spr_gamepadbutton_west);
    input_addIcon([gp_face4], spr_gamepadbutton_north);
    input_addIcon([gp_padu], spr_gamepadbutton_up);
    input_addIcon([gp_padd], spr_gamepadbutton_down);
    input_addIcon([gp_padl], spr_gamepadbutton_left);
    input_addIcon([gp_padr], spr_gamepadbutton_right);
    input_addIcon([gp_start], spr_gamepadbutton_start);
    input_addIcon([gp_select], spr_gamepadbutton_select);
    input_addIcon([gp_shoulderl], spr_gamepadbutton_leftbumper);
    input_addIcon([gp_shoulderlb], spr_gamepadbutton_lefttrigger);
    input_addIcon([gp_shoulderr], spr_gamepadbutton_rightbumper);
    input_addIcon([gp_shoulderrb], spr_gamepadbutton_righttrigger);
}

function scr_input_set_icon(argument0)
{
    var ico = [spr_null, 0];
    
    switch (argument0)
    {
        case "up":
        case "upC":
            ico = [spr_keyconfig_icons, 0];
            break;
        
        case "down":
        case "downC":
            ico = [spr_keyconfig_icons, 1];
            break;
        
        case "right":
        case "rightC":
            ico = [spr_keyconfig_icons, 2];
            break;
        
        case "left":
        case "leftC":
            ico = [spr_keyconfig_icons, 3];
            break;
        
        case "jump":
        case "jumpC":
            ico = [spr_keyconfig_icons, 4];
            break;
        
        case "slap":
        case "slapC":
            ico = [spr_keyconfig_icons, 5];
            break;
        
        case "attack":
        case "attackC":
            ico = [spr_keyconfig_icons, 6];
            break;
        
        case "taunt":
        case "tauntC":
            ico = [spr_keyconfig_icons, 7];
            break;
        
        case "start":
        case "startC":
            ico = [spr_keyconfig_icons, 8];
            break;
        
        case "superjump":
        case "superjumpC":
            ico = [spr_keyconfig_icons, 9];
            break;
        
        case "groundpound":
        case "groundpoundC":
            ico = [spr_keyconfig_icons, 10];
            break;
        
        case "shoot":
        case "shootC":
            ico = [spr_keyconfig_icons, 11];
            break;
    }
    
    return ico;
}

function input_addIcon(argument0, argument1, argument2 = 0)
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        var input = argument0[i];
        ds_map_set(global.input_icons, input, [argument1, argument2]);
        show_debug_message(concat("Added ", sprite_get_name(argument1), string(" (frame: {0}) to input icon map for {1}.", argument2, input)));
    }
}

function scr_input_get_icon(argument0, argument1 = false)
{
    var result = [];
    var inputArr = [];
    var use_gamepad = global.player_input_device >= 0 || (instance_exists(obj_option_keyconfig) && obj_option_keyconfig.gamepad);
    var keyStruct = input_get(argument0);
    
    if (!use_gamepad && !is_undefined(keyStruct))
    {
        if (array_length(keyStruct.keyInputs) > 0)
            inputArr = keyStruct.keyInputs;
    }
    
    var gpStruct = input_get(concat(argument0, "C"));
    
    if (use_gamepad && !is_undefined(gpStruct))
    {
        if (array_length(gpStruct.gpInputs) > 0)
            inputArr = gpStruct.gpInputs;
    }
    
    var length = argument1 ? array_length(inputArr) : 1;
    
    if (array_length(inputArr) > 0)
    {
        for (var i = 0; i < length; i++)
        {
            var ico = ds_map_find_value(global.input_icons, array_get(inputArr, i));
            
            if (!is_undefined(ico))
                array_push(result, ico);
        }
    }
    
    if (array_length(result) == 0)
        result = [ds_map_find_value(global.input_icons, "NONE")];
    
    return argument1 ? result : result[0];
}
