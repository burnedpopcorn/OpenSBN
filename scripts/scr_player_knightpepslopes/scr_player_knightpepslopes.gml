function state_player_knightpepslopes()
{
    if ((x + hsp) == xprevious)
        slope_buffer--;
    else
        slope_buffer = 20;
    
    alarm[5] = 2;
    alarm[7] = 60;
    
    if (knightmiddairstop == 0)
        hsp = xscale * movespeed;
    
    image_speed = 0.35;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0)
        jumpstop = 0;
    
    if (!scr_slope() && grounded)
        sprite_index = spr_knightpepcharge;
    
    if (scr_slope())
        sprite_index = spr_knightpepdownslope;
    
    if (input_buffer_jump < 8)
    {
        if (can_jump || !doublejump)
        {
            vsp = -11;
            sprite_index = spr_knightpep_fly;
            image_index = 0;
            input_buffer_jump = 8;
            
            if (!grounded)
            {
                vsp = -11;
                doublejump = 1;
                sprite_index = spr_knightpep_doublejump;
            }
        }
    }
    
    if ((sprite_index == spr_knightpep_doublejump || sprite_index == spr_knightpep_fly) && floor(image_index) == (image_number - 1))
        image_index = image_number - 1;
    
    if (place_meeting_collision(x + sign(hsp), y, Exclude.SLOPES) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    {
        movespeed = 0;
        vsp = -6;
        sprite_index = spr_knightpep_bump;
        image_index = floor(image_number - 1);
        state = states.knightpepbump;
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
    }
    
    if (scr_slope())
    {
        var _check = false;
        
        if (place_meeting_slope(x, y + 1, false))
        {
            with (instance_place(x, y + 1, obj_slope))
            {
                if (sign(image_xscale) == -sign(other.xscale))
                    _check = true;
            }
        }
        
        if (place_meeting_slopePlatform(x, y + 1))
        {
            with (instance_place(x, y + 1, obj_slopePlatform))
            {
                if (sign(image_xscale) == -sign(other.xscale))
                    _check = true;
            }
        }
        
        if (_check)
        {
            if (movespeed < 14)
                movespeed += 0.25;
        }
    }
    
    if (!grounded && input_check_pressed("down") && sprite_index != spr_knightpep_downtrust)
    {
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_knightpep_downcloud;
        
        sprite_index = spr_knightpep_downtrust;
        vsp = -5;
        hsp = 0;
        movespeed = 0;
        state = states.knightpep;
    }
    
    exit;
}
