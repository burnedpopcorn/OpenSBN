function scr_gpinput_isaxis(argument0)
{
    var axes = [32787, 32788, 32786, 32785];
    
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
    var sticks = [32785, 32786, 32787, 32788];
    
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
        case 32785:
        case 32787:
            dz = global.deadzones[deadzone.horizontal];
            break;
        
        case 32786:
        case 32788:
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
    var gpButtons = [32769, 32770, 32771, 32772, 32773, 32775, 32774, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784, 32785, 32786, 32788, 32787];
    
    for (var i = 0; i < array_length(gpButtons); i++)
    {
        if (gamepad_button_check_pressed(argument0, gpButtons[i]))
            return gpButtons[i];
    }
    
    return -4;
}

function scr_check_joysticks(argument0, argument1 = 0.5)
{
    var sticks = [32785, 32786, 32787, 32788];
    
    for (var i = 0; i < array_length(sticks); i++)
    {
        var val = gamepad_axis_value(argument0, sticks[i]);
        
        if (val > argument1)
            return sticks[i];
        
        if (val < -argument1)
            return sticks[i];
    }
    
    return -4;
}

function scr_checkanystick(argument0, argument1 = 0.5)
{
    var sticks = [32785, 32786, 32787, 32788];
    
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
    {
        return -1;
    }
    else if (gamepad_is_connected(argument0))
    {
        if (gamepad_button_check(argument0, gp_face1) || gamepad_button_check(argument0, gp_start))
            return argument0;
    }
    
    return -2;
}

function scr_input_icon_define()
{
    input_addIcon([16], spr_tutorialkey_special, 0);
    input_addIcon([17], spr_tutorialkey_special, 1);
    input_addIcon([32], spr_tutorialkey_special, 2);
    input_addIcon([38], spr_tutorialkey_special, 3);
    input_addIcon([40], spr_tutorialkey_special, 4);
    input_addIcon([39], spr_tutorialkey_special, 5);
    input_addIcon([37], spr_tutorialkey_special, 6);
    input_addIcon([27], spr_tutorialkey_special, 7);
    input_addIcon([18], spr_tutorialkey_special, 8);
    input_addIcon(["NONE"], spr_tutorialkey_empty);
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    
    for (var i = 0; i < array_length(alphabet); i++)
        input_addIcon([ord(alphabet[i])], spr_tutorialkey_letters, i);
    
    input_addIcon([32785, 32786], spr_gamepadbutton_leftstick);
    input_addIcon([32787, 32788], spr_gamepadbutton_rightstick);
    input_addIcon([32769], spr_gamepadbutton_south);
    input_addIcon([32770], spr_gamepadbutton_east);
    input_addIcon([32771], spr_gamepadbutton_west);
    input_addIcon([32772], spr_gamepadbutton_north);
    input_addIcon([32781], spr_gamepadbutton_up);
    input_addIcon([32782], spr_gamepadbutton_down);
    input_addIcon([32783], spr_gamepadbutton_left);
    input_addIcon([32784], spr_gamepadbutton_right);
    input_addIcon([32778], spr_gamepadbutton_start);
    input_addIcon([32777], spr_gamepadbutton_select);
    input_addIcon([32773], spr_gamepadbutton_leftbumper);
    input_addIcon([32775], spr_gamepadbutton_lefttrigger);
    input_addIcon([32774], spr_gamepadbutton_rightbumper);
    input_addIcon([32776], spr_gamepadbutton_righttrigger);
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
