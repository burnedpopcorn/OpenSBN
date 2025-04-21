function state_player_bombdelete()
{
    image_speed = 0.35;
    hsp = move * movespeed;
    sprite_index = spr_bombpeprun;
    move = input_check("right") - input_check("left");
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 5)
            movespeed += 0.5;
        else if (floor(movespeed) == 5)
            movespeed = 5;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 5)
        movespeed -= 0.1;
    
    if (input_check_pressed("slap"))
    {
        state = states.normal;
        
        with (instance_create(x, y, obj_bomb))
        {
            hsp = other.xscale * 10;
            vsp = -8;
        }
    }
    
    exit;
}
