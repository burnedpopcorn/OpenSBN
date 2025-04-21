function state_player_stringjump()
{
    hsp = xscale * movespeed;
    move = input_check("right") - input_check("left");
    
    if (move != 0)
    {
        if (xscale != move)
        {
            if (movespeed > 0)
            {
                movespeed = approach(movespeed, 0, 0.5);
            }
            else
            {
                xscale = move;
                movespeed = 0;
            }
        }
        else if (movespeed < 8)
        {
            movespeed = approach(movespeed, 8, 0.25);
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
        movespeed = 0;
    
    if (grounded && vsp > 0)
    {
        state = states.normal;
        landAnim = 1;
        sprite_index = spr_land;
        create_particle(x, y, particle.landcloud, 0);
    }
}

function state_player_stringfall()
{
    if (instance_exists(stringid))
    {
        sprite_index = spr_player_mrpinch;
        hsp = movespeed;
        move = input_check("right") - input_check("left");
        
        if (move == 0)
            movespeed = approach(movespeed, 0, 0.1);
        else
            movespeed = approach(movespeed, move * 4, 0.25);
        
        if (abs(movespeed) > 14)
            movespeed = approach(movespeed, 0, 0.5);
    }
    
    hsp = movespeed;
}
