function state_player_antigrav()
{
    sprite_index = spr_currentplayer;
    move = input_check("right") - input_check("left");
    hsp = approach(hsp, move * 8, 0.5);
    movespeed = hsp;
    
    if (vsp > -14)
        vsp -= 0.5;
    
    if (input_check_pressed("jump"))
    {
        movespeed = abs(hsp);
        state = states.jump;
        sprite_index = spr_machfreefall;
    }
    
    if (scr_solid(x, y - 1))
    {
        vsp = 8;
        
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        hsp = -hsp * 0.8;
        
        repeat (3)
        {
            with (create_debris(x, y, spr_slapstar))
            {
                hsp = random_range(-5, 5);
                vsp = random_range(-10, 10);
            }
        }
    }
    
    image_speed = abs(vsp) / 15;
    exit;
}
