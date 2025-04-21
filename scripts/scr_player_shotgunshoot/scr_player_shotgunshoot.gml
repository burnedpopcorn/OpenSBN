function state_player_shotgunshoot()
{
    image_speed = 0.4;
    move = input_check("right") - input_check("left");
    hsp = xscale * movespeed;
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
        movespeed = 0;
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = approach(movespeed, 4, 0.25);
        else
            movespeed = approach(movespeed, -8, 0.2);
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.1);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded)
            state = states.normal;
        else
            state = states.jump;
        
        if (move == -xscale)
        {
            xscale = move;
            dir = xscale;
            movespeed = abs(movespeed);
            momemtum = 1;
        }
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (input_check_pressed("slap"))
        input_buffer_slap = 0;
    
    if (input_check_pressed("shoot") && image_index > (image_number - 3))
        scr_kungfu();
    
    exit;
}
