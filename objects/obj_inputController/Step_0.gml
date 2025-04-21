if (active)
{
    if (device_found && !device_selected[UnknownEnum.Value_0])
    {
        for (i = 0; i < 8; i++)
        {
            var _index = scr_button_pressed(i);
            
            if (_index != -2)
            {
                device_selected[UnknownEnum.Value_0] = true;
                global.player_input_device = _index;
            }
        }
    }
    
    var i = 0;
    
    while (i < 2)
    {
        if (device_selected[i] && global.player_input_device >= 0)
        {
            if (!gamepad_is_connected(global.player_input_device))
            {
                active = false;
                device_selected[i] = false;
                global.player_input_device = -2;
                disconnected_device = i;
                break;
            }
            else
            {
                i++;
                continue;
            }
        }
        else
        {
            i++;
            continue;
        }
    }
    
    if (global.player_input_device >= 0 && gamepad_is_connected(global.player_input_device))
    {
        if (vibrationDecay1 > 0)
        {
            vibrationDecay1--;
        }
        else if (vibration1 != 0)
        {
            vibration1 = 0;
            gamepad_set_vibration(global.player_input_device, vibration1, vibration1);
        }
    }
}
else
{
    for (var i = 0; i < 8; i++)
    {
        var slot = scr_button_pressed(i);
        
        if (global.player_input_device == -2 && slot >= -1)
        {
            global.player_input_device = slot;
            active = true;
            break;
        }
    }
}

if (keyboard_check_pressed(vk_f1))
    scr_resetinput();
