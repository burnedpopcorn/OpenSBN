function state_player_highjump()
{
    move = input_check("right") - input_check("left");
    
    if (momemtum == 0)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    if (move == 0 && momemtum == 0)
        movespeed = 0;
    
    if (move != 0 && movespeed < 6)
        movespeed += 0.5;
    
    if (((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
        movespeed = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
    }
    
    landAnim = 1;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0)
    {
        vsp /= 2;
        jumpstop = 1;
    }
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
    {
        vsp = grav;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0)
    {
        if (input_check("attack"))
            landAnim = 0;
        
        state = states.normal;
        jumpAnim = 1;
        jumpstop = 0;
        image_index = 0;
        freefallstart = 0;
    }
    
    if (can_jump && input_buffer_jump < 8 && !input_check("attack") && !input_check("down") && vsp > 0)
    {
        vsp = -9;
        state = states.jump;
        jumpAnim = 1;
        jumpstop = 0;
        image_index = 0;
        freefallstart = 0;
        event_play_oneshot("event:/SFX/bo/jump", x, y);
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (jumpAnim == 1)
    {
        sprite_index = spr_player_Sjumpstart;
        
        if (floor(image_index) == 3)
            jumpAnim = 0;
    }
    
    if (jumpAnim == 0)
        sprite_index = spr_player_Sjump;
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
    
    if (!grounded && scr_checkgroundpound())
    {
        vsp = 0;
        mach2 = 0;
        image_index = 0;
        vsp = -7;
        state = states.freefallprep;
    }
    
    exit;
}
