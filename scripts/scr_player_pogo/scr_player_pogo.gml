function state_player_pogo()
{
    move = input_check("right") - input_check("left");
    
    if (move == 0 && hsp != 0)
        hsp = xscale * movespeed;
    else
        hsp = move * movespeed;
    
    if (move != 0 && !scr_solid(x, y + 1))
    {
        if (movespeed < 6)
            movespeed += 0.5;
    }
    
    if (move != xscale || move == 0 || place_meeting(x + xscale, y, obj_solid))
    {
        movespeed = 0;
        pogospeed = 6;
    }
    
    if (sign(hsp) != 0)
        xscale = sign(hsp);
    else if (move != 0)
        xscale = move;
    
    if (move != xscale)
        pogospeed = 6;
    
    if (grounded && !input_check_pressed("slap") && sprite_index != spr_null && sprite_index != spr_null)
    {
        pogospeedprev = 0;
        image_index = 0;
        movespeed = 0;
        vsp = 0;
        
        if (pogochargeactive == 1)
            sprite_index = spr_null;
        else
            sprite_index = spr_null;
        
        create_particle(x, y, particle.landcloud, 0);
    }
    
    if (floor(image_index) == 3 && pogospeedprev == 0 && (sprite_index == spr_null || sprite_index == spr_null))
    {
        if (input_check_pressed("jump"))
            vsp = -12;
        else if (input_check("down"))
            vsp = -3;
        else
            vsp = -6;
        
        if (move == xscale && movespeed < 12)
            pogospeed += 4;
        
        if (move == -xscale && movespeed > 0)
            pogospeed = 6;
        
        movespeed = pogospeed;
        pogospeedprev = 1;
    }
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_null || sprite_index == spr_null || sprite_index == spr_null || sprite_index == spr_null))
    {
        if (pogochargeactive == 1)
            sprite_index = spr_null;
        else
            sprite_index = spr_null;
    }
    
    if (pogospeed > 12 && pogochargeactive == 0)
    {
        pogochargeactive = 1;
        pogocharge = 100;
        flash = 1;
    }
    
    if (movespeed > 12)
        pogocharge = 100;
    
    if (!input_check("attack"))
        state = states.normal;
    
    image_speed = 0.35;
    exit;
}
