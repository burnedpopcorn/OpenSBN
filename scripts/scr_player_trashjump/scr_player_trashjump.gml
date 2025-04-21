function state_player_trashjump()
{
    image_speed = 0.35;
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    
    if (move != 0)
        movespeed = approach(movespeed, move * 6, 0.5);
    else
        movespeed = approach(movespeed, 0, 0.25);
    
    if (vsp > 0 && sprite_index == spr_player_trashjump)
    {
        sprite_index = spr_player_trashjump2;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
        sprite_index = spr_player_trashfall;
    
    if (vsp < 0 && sprite_index != spr_player_trashjump)
        sprite_index = spr_player_trashjump;
    
    if (grounded && vsp > 0)
    {
        if (scr_slope())
        {
            if (place_meeting_slope(x, y + 1, false))
            {
                with (instance_place(x, y + 1, obj_slope))
                    other.xscale = -sign(image_xscale);
            }
            
            if (place_meeting_slopePlatform(x, y + 1))
            {
                with (instance_place(x, y + 1, obj_slopePlatform))
                    other.xscale = -sign(image_xscale);
            }
        }
        
        movespeed = abs(movespeed);
        dir = xscale;
        movespeed += 3;
        instance_create(x, y, obj_jumpdust);
        state = states.trashroll;
    }
    
    exit;
}
