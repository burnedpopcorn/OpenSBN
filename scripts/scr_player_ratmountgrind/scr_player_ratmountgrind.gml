function state_player_ratmountgrind()
{
    move = input_check("right") - input_check("left");
    
    if (move != 0)
    {
        xscale = move;
        movespeed = move * 6;
        sprite_index = spr_lonegustavo_hangwalk;
    }
    else
    {
        movespeed = 0;
        sprite_index = spr_lonegustavo_hang;
    }
    
    image_speed = 0.35;
    hsp = movespeed;
    vsp = 0;
    y -= 46;
    
    if (!place_meeting_platform(x, y + 1, obj_grindrail) && !place_meeting_slopePlatform(x, y + 1, obj_grindrailslope))
    {
        state = states.ratmountjump;
        sprite_index = spr_player_ratmountgroundpoundfall;
    }
    
    y += 46;
    
    if (move != 0)
    {
        y -= 46;
        y += slope_check_up(x + sign(hsp), y);
        y += slope_check_down(x + sign(hsp), y);
        y += 46;
    }
    
    if (input_check_pressed("jump"))
    {
        state = states.ratmountjump;
        
        if (input_check("down"))
        {
            sprite_index = spr_player_ratmountgroundpoundfall;
            vsp = 5;
        }
        else
        {
            image_index = 0;
            sprite_index = spr_player_ratmountgroundpound;
            vsp = -11;
        }
        
        jumpstop = 0;
        jumpAnim = 1;
        create_particle(x, y, particle.highjumpcloud1, 0);
    }
    
    exit;
}
