function state_player_balloon()
{
    sprite_index = spr_player_ratballoon;
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    vsp = -5;
    
    if (move != 0)
        movespeed = approach(movespeed, move * 6, 0.35);
    else
        movespeed = approach(movespeed, 0, 0.35);
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
        movespeed = 0;
    
    if (balloonbuffer > 0)
    {
        balloonbuffer--;
    }
    else
    {
        create_particle(x, y - 20, particle.genericpoofeffect, 0);
        instance_create(x, y - 20, obj_balloongrabbableeffect);
        state = states.jump;
        sprite_index = spr_fall;
        jumpAnim = 0;
    }
    
    if (input_check_pressed("jump"))
    {
        create_particle(x, y - 20, particle.genericpoofeffect, 0);
        instance_create(x, y - 20, obj_balloongrabbableeffect);
        state = states.jump;
        sprite_index = spr_jump;
        image_index = 0;
        jumpAnim = 1;
        movespeed = abs(movespeed);
        vsp = -11;
        jumpstop = 0;
    }
}
