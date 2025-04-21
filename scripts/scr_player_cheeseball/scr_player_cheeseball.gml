function state_player_cheeseball()
{
    image_speed = 0.35;
    
    if ((x + hsp) == xprevious)
        stop_buffer--;
    else
        stop_buffer = 8;
    
    if (vsp < 0)
        vsp += 0.25;
    
    hsp = xscale * movespeed;
    
    if (scr_slope())
    {
        var _check = -4;
        
        if (place_meeting_slope(x, y + 1, false) && !instance_exists(_check))
        {
            with (instance_place(x, y + 1, obj_slope))
            {
                if (sign(image_xscale) == other.xscale)
                    _check = id;
            }
        }
        
        if (place_meeting_slopePlatform(x, y + 1) && !instance_exists(_check))
        {
            with (instance_place(x, y + 1, obj_slopePlatform))
            {
                if (sign(image_xscale) == other.xscale)
                    _check = id;
            }
        }
        
        if (instance_exists(_check))
        {
            slopejump = 1;
            slopejumpx = _check.x + (_check.image_xscale * 32);
        }
    }
    
    if (x > (slopejumpx - 10) && x < (slopejumpx + 10) && slopejump == 1 && cheeseballbounce == 0)
    {
        vsp = -12;
        cheeseballbounce = 1;
        slopejump = 0;
    }
    
    if (grounded && vsp > 0 && cheeseballbounce > 0)
    {
        if (cheeseballbounce == 2)
            vsp = -7;
        else if (cheeseballbounce == 1)
            vsp = -6;
        else
            vsp = -5;
        
        cheeseballbounce -= 1;
        
        repeat (2)
            create_debris(x + random_range(-8, 8), y + 43, spr_cheesechunk);
    }
    
    if (grounded)
        movespeed = approach(movespeed, 12, 0.25);
    
    sprite_index = spr_cheeseballplayer;
    
    if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)))
    {
        cheeseballbounce = 0;
        slopejump = 0;
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
        image_index = 0;
        movespeed = 0;
        cheesepeptimer = 2;
        state = states.cheesepepjump;
        sprite_index = spr_cheesepepfall;
        
        repeat (8)
            create_debris(x + random_range(-8, 8), y + random_range(-8, 8), spr_cheesechunk);
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (grounded && (floor(image_index) % 4) == 0)
        create_debris(x, y + 43, spr_grapedebris);
    
    exit;
}
