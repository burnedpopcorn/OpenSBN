if (active)
{
    with (obj_player1)
    {
        state = states.actor;
        hsp = 0;
        vsp = 0;
        visible = false;
    }
}

if (floor(image_index) == (image_number - 1))
{
    switch (sprite_index)
    {
        case spr_pizzaportal_appear:
            event_play_oneshot("event:/SFX/misc/secretexit", x, y);
            sprite_index = spr_pizzaportalentrancestart;
            break;
        
        case spr_pizzaportalentrancestart:
            sprite_index = spr_pizzaportal_disappear;
            
            with (obj_player1)
            {
                state = states.normal;
                
                if (room == water_9)
                    state = states.fishswim;
                
                visible = true;
            }
            
            active = 0;
            break;
        
        case spr_pizzaportal_disappear:
            instance_create_unique(0, 0, obj_lap2visual);
            instance_destroy();
            break;
    }
}
