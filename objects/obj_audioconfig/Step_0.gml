if (updown_buffer > 0)
{
    updown_buffer--;
    
    if (!input_check_pressed("up") && !input_check_pressed("down") && !keyboard_check_pressed(vk_up) && !keyboard_check_pressed(vk_down))
        updown_buffer = 0;
}
else
{
    if ((input_check_pressed("up") || keyboard_check_pressed(vk_up)) && audio_select > -1)
    {
        updown_buffer = updown_max;
        audio_select -= 1;
    }
    
    if ((input_check_pressed("down") || keyboard_check_pressed(vk_down)) && audio_select < 2)
    {
        updown_buffer = updown_max;
        audio_select += 1;
    }
}

if (input_check_pressed("jump") || keyboard_check_pressed(vk_enter))
{
    switch (audio_select)
    {
        case -1:
            set_audio_config();
            
            with (obj_option)
            {
                visible = true;
                buffer = 15;
            }
            
            instance_destroy();
            break;
        
        default:
            set_audio_config();
            break;
    }
}

if (key_buffer > 0)
{
    key_buffer--;
}
else
{
    if (-input_check("left") || keyboard_check(vk_left))
    {
        switch (audio_select)
        {
            case 0:
                audiosaved_master--;
                break;
            
            case 1:
                audiosaved_music--;
                break;
            
            case 2:
                audiosaved_sfx--;
                break;
        }
        
        key_buffer = key_max;
    }
    
    if (input_check("right") || keyboard_check(vk_right))
    {
        switch (audio_select)
        {
            case 0:
                audiosaved_master++;
                break;
            
            case 1:
                audiosaved_music++;
                break;
            
            case 2:
                audiosaved_sfx++;
                break;
        }
        
        key_buffer = key_max;
    }
}

audiosaved_master = clamp(audiosaved_master, 0, 100);
audiosaved_music = clamp(audiosaved_music, 0, 100);
audiosaved_sfx = clamp(audiosaved_sfx, 0, 100);
