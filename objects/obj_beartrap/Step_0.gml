if (press >= 8 && drop == 0)
{
    obj_player1.image_index = 0;
    obj_player1.alarm[8] = 60;
    obj_player1.state = states.hurt;
    drop = 1;
    closed = 0;
}

if (closed == 1)
    y = obj_player1.y;

if (drop == 1)
{
    if (place_meeting(x + floor(hsp), y, obj_null))
    {
        x = floor(x);
        
        while (!place_meeting(x + sign(hsp), y, obj_null))
            x += sign(hsp);
        
        hsp = 0;
    }
    
    x += hsp;
    
    if (place_meeting(x, y + floor(vsp), obj_null))
    {
        y = floor(y);
        
        while (!place_meeting(x, y + sign(vsp), obj_null))
            y += sign(vsp);
        
        vsp = 0;
    }
    
    y += floor(vsp);
    
    if (vsp < 20)
        vsp += grav;
}
