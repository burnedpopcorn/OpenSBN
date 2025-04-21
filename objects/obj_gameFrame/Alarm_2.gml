if (!window_has_focus())
{
    alarm[2] = 1;
    exit;
}

switch (global.option_fullscreen)
{
    case 0:
        window_set_fullscreen(false);
        gameframe_set_fullscreen(0);
        
        with (obj_gameFrame)
            alarm[0] = 1;
        
        break;
    
    case 1:
        window_set_fullscreen(true);
        gameframe_set_fullscreen(2);
        alarm[4] = 1;
        break;
    
    case 2:
        window_set_fullscreen(false);
        gameframe_set_fullscreen(2);
        break;
}

alarm[0] = 1;
