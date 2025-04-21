if (!instance_exists(obj_option))
{
    if (!instance_exists(obj_fadeout))
    {
        var _m = input_check_pressed("down") - input_check_pressed("up");
        selected_world += _m;
        selected_world = clamp(selected_world, 0, array_length(level_array) - 1);
        
        if (_m != 0)
            selected_level = 0;
        
        selected_level += (-input_check_pressed("left") + input_check_pressed("right"));
        selected_level = clamp(selected_level, 0, array_length(level_array[selected_world]) - 1);
    }
    
    with (obj_player1)
    {
        movespeed = 0;
        hsp = 0;
        vsp = 0;
    }
    
    if (!active)
        exit;
    
    if (input_check_pressed("jump") && !instance_exists(obj_fadeout))
    {
        var _levelinfo = level_array[selected_world][selected_level];
        
        with (obj_player1)
        {
            global.leveltosave = _levelinfo[2];
            global.leveltorestart = _levelinfo[1];
            sprite_index = spr_victory;
            image_index = 0;
            state = states.victory;
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            targetRoom = _levelinfo[1];
            targetDoor = "A";
            instance_create(x, y, obj_fadeout);
            global.level_seconds = 0;
            global.level_minutes = 0;
            backtohubroom = room;
        }
    }
    
    if (instance_exists(obj_fadeout))
    {
        with (obj_player1)
            image_index = 0;
    }
}

for (var i = 0; i < array_length(toppin_info); i++)
{
    toppin_info[i][0] += 0.35;
    
    if (toppin_info[i][0] > sprite_get_number(toppin_info[i][1]))
        toppin_info[i][0] = frac(toppin_info[i][0]);
}
