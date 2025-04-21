function state_player_cheesepepjump()
{
    image_speed = 0.35;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepjumpstart)
            sprite_index = spr_cheesepepjump;
        else if (sprite_index == spr_cheesepepjump && vsp > 0)
            sprite_index = spr_cheesepepfall;
    }
    
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    
    if (!input_check("jump") && !jumpstop && vsp < 0)
    {
        jumpstop = 1;
        vsp /= 10;
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (move != 0)
        movespeed = approach(movespeed, move * 3, 0.5);
    else
        movespeed = approach(movespeed, 0, 0.25);
    
    if (place_meeting(x + sign(movespeed), y, obj_solid) && !place_meeting(x, y + 1, obj_slope))
    {
        state = states.cheesepepstick;
        sprite_index = spr_cheesepepstickside;
        hsp = 0;
        vsp = 0;
        xscale = sign(movespeed);
        
        repeat (3)
            create_debris(x + (xscale * 30), y + random_range(-8, 8), spr_cheesechunk);
        
        movespeed = 0;
    }
    
    if (grounded)
    {
        repeat (3)
            create_debris(x + random_range(-8, 8), y + 43, spr_cheesechunk);
        
        state = states.cheesepep;
        sprite_index = spr_cheesepepland;
        image_index = 0;
        movespeed = abs(movespeed);
    }
    
    exit;
}
