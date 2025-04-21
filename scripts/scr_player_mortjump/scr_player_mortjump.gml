function state_player_mortjump()
{
    image_speed = 0.35;
    move = input_check("right") - input_check("left");
    hsp = movespeed;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (!input_check("jump") && !jumpstop && vsp < 0.5)
    {
        jumpstop = 1;
        vsp /= 20;
    }
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = approach(movespeed, xscale * 8, 0.5);
        else
            movespeed = approach(movespeed, 0, 0.5);
        
        if (movespeed <= 0)
            xscale = move;
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.5);
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
    {
        movespeed = 0;
        
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_null;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_mortjumpstart)
            sprite_index = spr_player_mortjump;
        else if (sprite_index == spr_player_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
            sprite_index = spr_mortdoublejump;
    }
    
    if (can_jump && vsp > 0.5)
    {
        if (input_buffer_jump < 8)
        {
            input_buffer_jump = 8;
            state = states.mortjump;
            vsp = -14;
            sprite_index = spr_player_mortjumpstart;
            image_index = 0;
            doublejump = 0;
            jumpstop = 0;
            event_play_oneshot("event:/SFX/bo/jump", x, y);
            create_particle(x, y, particle.jumpdust, 0);
        }
        else
        {
            state = states.mort;
            landAnim = 1;
            sprite_index = spr_land;
            image_index = 0;
        }
    }
    else if (!doublejump && input_check_pressed("jump"))
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        jumpstop = 0;
        input_buffer_jump = 8;
        doublejump = 1;
        state = states.mortjump;
        sprite_index = spr_player_mortdoublejump;
        image_index = 0;
        vsp = -11;
        
        repeat (4)
            create_debris(x, y, spr_null);
    }
    
    mort_attack();
    exit;
}
