function state_player_runonball()
{
    move = input_check("right") - input_check("left");
    
    if (!input_check("attack"))
        hsp = move * movespeed;
    else
        hsp = image_xscale * movespeed;
    
    jumpstop = 0;
    vsp = obj_player1.vsp;
    sprite_index = spr_null;
    
    if (input_check("attack") && grounded)
    {
        if (mach2 < 35)
        {
            mach2++;
            movespeed = 4;
        }
        
        if (mach2 >= 35)
            movespeed = 6;
    }
    
    if (!input_check("attack"))
        mach2 = 0;
    
    image_speed = 0.35;
}
