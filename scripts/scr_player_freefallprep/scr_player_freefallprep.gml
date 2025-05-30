function state_player_freefallprep()
{
    move = input_check("right") - input_check("left");
    
    if (!grounded)
    {
        hsp = move * movespeed;
        
        if (move != xscale && momemtum == 1 && movespeed != 0)
            movespeed -= 0.05;
        
        if (movespeed == 0)
            momemtum = 0;
        
        if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
        {
            movespeed = 0;
            mach2 = 0;
        }
        
        if (move != 0 && movespeed < (7 * getRPGMulti("movespeed")))
            movespeed += (0.25 * getRPGMulti("movespeed"));
        
        if (movespeed > (7 * getRPGMulti("movespeed")))
            movespeed -= 0.05;
        
        if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
            movespeed = 0;
        
        if (dir != xscale)
        {
            mach2 = 0;
            dir = xscale;
            movespeed = 0;
        }
        
        if (move == -xscale)
        {
            mach2 = 0;
            movespeed = 0;
            momemtum = 0;
        }
        
        if (move != 0)
            xscale = move;
        
        if (vsp > 0)
            vsp = 0;
    }
    
    image_speed = 0.5;
    
    if (animation_end())
    {
        state = states.freefall;
        
        if (shotgunAnim == 0)
            sprite_index = spr_bodyslamfall;
        else
            sprite_index = spr_shotgunjump3;
    }
    
    exit;
}
