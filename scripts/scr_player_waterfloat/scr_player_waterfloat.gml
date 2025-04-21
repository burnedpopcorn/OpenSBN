function state_player_waterfloat()
{
    sprite_index = spr_playerN_rockethitwall;
    move_h = input_check("right") - input_check("left");
    move_v = input_check("down") - input_check("up");
    var maxspeed = 6;
    var hspaccel = 0.3;
    var vspaccel = 0.5;
    
    if (hsp != 0)
        xscale = sign(hsp);
    else
        movespeed = 0;
    
    if (abs(hsp) < 4 || sign(hsp) != move_h)
        hsp = approach(hsp, move_h * maxspeed, hspaccel);
    
    vsp -= grav;
    
    if (place_meeting_collision(x + sign(hsp), y))
        movespeed = 0;
    
    if (!place_meeting(x, y, obj_water) && !place_meeting(x, y, obj_waterTop))
    {
        state = states.jump;
        
        if (input_check("attack"))
        {
            state = states.mach2;
            movespeed = clamp(movespeed, 6, 14);
        }
        
        jumpstop = true;
        vsp = -6;
    }
    
    image_speed = 0.35;
    exit;
}
