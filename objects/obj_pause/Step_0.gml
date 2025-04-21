if (!pause && input_check("start"))
{
    var _cutscenehandler = 0;
    
    with (obj_cutscene_handler)
    {
        if (!loop)
            _cutscenehandler = 1;
    }
    
    if (instance_exists(obj_titlecard) || room == rm_disclaimer)
        _cutscenehandler = 1;
    
    if (obj_savesystem.state == 0 && !_cutscenehandler && room != rank_room && room != Realtitlescreen && room != timesuproom && room != rm_threedaysremain && room != rm_levelselect)
    {
        pause = true;
        pause_all_sounds(true);
        scr_pausemusic();
        scr_pauseinstances();
    }
}

with (obj_player1)
{
    other.paletteselect = paletteselect;
    other.spr_palette = spr_palette;
}

if (pause && !instance_exists(obj_option))
{
    var prevselected = selected;
    moveselect = -input_check_pressed("up") + input_check_pressed("down");
    selected += moveselect;
    
    if (moveselect != 0 && selected >= 0 && selected <= 2)
        selected = clamp(selected, 0, array_length(pause_menu) - 1);
    
    if (prevselected != selected)
    {
        switch (selected)
        {
            case 0:
                peppino_sprite = spr_playerN_idle;
                break;
            
            case 1:
                peppino_sprite = spr_playerN_swingding;
                break;
            
            case 2:
                peppino_sprite = spr_null;
                break;
            
            case 3:
                peppino_sprite = spr_playerN_deathend;
                break;
        }
        
        peppino_sprite_number = sprite_get_number(peppino_sprite);
        peppino_index = 0;
    }
    
    if (input_check_pressed("jump"))
    {
        switch (selected)
        {
            case 0:
                pause = false;
                scr_unpauseinstances();
                scr_unpausemusic();
                pause_all_sounds(false);
                break;
            
            case 2:
                var roomname = room_get_name(room);
                
                if (!global.snickchallenge)
                {
                    var rm = -4;
                    rm = global.leveltorestart;
                    ds_list_clear(global.saveroom);
                    ds_list_clear(global.baddieroom);
                    
                    if (rm != -4 && rm != -1)
                    {
                        stop_all_sounds();
                        scr_unpauseinstances();
                        scr_unpausemusic();
                        savedroom = rm;
                        global.levelreset = 0;
                        scr_playerreset();
                        obj_music.music = -4;
                        global.levelreset = 1;
                        scr_room_goto(rm);
                        pause = 0;
                        obj_player1.targetDoor = "A";
                        
                        if (instance_exists(obj_player2))
                            obj_player2.targetDoor = "A";
                    }
                }
                
                break;
            
            case 1:
                with (instance_create(x, y, obj_option))
                    depth = other.depth - 1;
                
                break;
            
            case 3:
                if (room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
                {
                    pause = 0;
                    instance_activate_all();
                    room_goto(rm_mainmenu);
                    
                    with (obj_player1)
                    {
                        character = "P";
                        scr_characterspr();
                    }
                    
                    scr_playerreset();
                    obj_player1.state = states.titlescreen;
                    obj_player2.state = states.titlescreen;
                    obj_player1.targetDoor = "A";
                    
                    if (instance_exists(obj_player2))
                        obj_player2.targetDoor = "A";
                    
                    global.cowboyhat = 0;
                    global.coop = false;
                }
                else
                {
                    pause = 0;
                    instance_activate_all();
                    scr_playerreset();
                    global.levelreset = 1;
                    obj_player1.targetDoor = "D";
                    
                    if (instance_exists(obj_player2))
                        obj_player2.targetDoor = "D";
                    
                    room_goto(hub_world1);
                    alarm[0] = 2;
                }
                
                break;
        }
    }
    
    cursor_index += 0.35;
    
    if (cursor_index > cursor_sprite_number)
    {
        var p = cursor_index - floor(cursor_index);
        cursor_index = p;
    }
    
    peppino_index += 0.35;
    
    if (peppino_index > peppino_sprite_number)
    {
        var p = peppino_index - floor(peppino_index);
        peppino_index = p;
    }
    
    for (var i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35;
        
        if (toppin_index[i] > toppin_number[i])
        {
            var t = toppin_index[i];
            var p = t - floor(t);
            toppin_index[i] = p;
        }
    }
    
    toppin_has[0] = global.cheesefollow;
    toppin_has[1] = global.pineapplefollow;
    toppin_has[2] = global.sausagefollow;
    toppin_has[3] = global.shroomfollow;
    toppin_has[4] = global.tomatofollow;
}
