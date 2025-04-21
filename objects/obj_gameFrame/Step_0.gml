var cr = -4;

if (gameframe_mouse_in_window() && (device_mouse_x_to_gui(0) != previousMouseX || device_mouse_y_to_gui(0) != previousMouseY))
{
    previousMouseX = device_mouse_x_to_gui(0);
    previousMouseY = device_mouse_y_to_gui(0);
    captionBuffer = 100;
    
    if (window_get_cursor() == -1)
        cr = 0;
}

if (captionBuffer > 0)
{
    global.gameframe_alpha = approach(global.gameframe_alpha, 1, 0.2);
    captionBuffer--;
    cr = 0;
}
else
{
    global.gameframe_alpha = approach(global.gameframe_alpha, 0, 0.1);
    cr = -1;
}

if (cr != -4)
{
    window_set_cursor(cr);
    global.gameframe_current_cursor = cr;
    
    if (cr == -1)
        global.gameframe_set_cursor = false;
    else
        global.gameframe_set_cursor = true;
}

switch (room)
{
    case hub_fruitytower:
    case hub_mansion:
    case hub_secretmidway:
    case hub_task:
    case hub_world1:
        global.gameframe_caption_text = "A Mansion Super Bo Noise is inside";
        break;
    
    case rm_evilleafyishere:
        global.gameframe_caption_text = "3 days.";
        break;
    
    case hub_entrancehall:
        global.gameframe_caption_text = "Welcome to the Super Bo Noise";
        break;
    
    case midway_1:
        global.gameframe_caption_text = "British architecture... And Super Bo Noise.";
        break;
    
    case water_1:
        global.gameframe_caption_text = "Super Bo Noise goes for a dip!";
        break;
    
    case rank_room:
        global.gameframe_caption_text = "Super Bo Noise's Judgement.";
        break;
    
    case smb_1_32:
        global.gameframe_caption_text = "Super Bo Noise Panic";
        break;
    
    case plain_1:
        global.gameframe_caption_text = "If a tree falls but no one is there to hear it";
        break;
    
    case creditsroom:
        global.gameframe_caption_text = "Bye bye Super Bo Noise!";
        break;
    
    case hub_soundtest:
        global.gameframe_caption_text = "Super groovy Bo Noise!";
        break;
    
    case Loadiingroom:
        global.gameframe_caption_text = "Super Bo Noise will begin shortly.";
        break;
    
    case Realtitlescreen:
    case rm_mainmenu:
    case rm_levelselect:
        global.gameframe_caption_text = "The Bo-ginning of Super Bo Noise!";
        break;
}

if (window_has_focus() || global.option_fullscreen != 1)
    gameframe_update();

if (global.option_focusmute)
{
    if (window_has_focus())
        fmod_global_setParameter("focus", 1, false);
    else
        fmod_global_setParameter("focus", 0, false);
}
else
{
    fmod_global_setParameter("focus", 1, false);
}
