function state_player_barreljump()
{
    image_speed = 0.35;
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_barreljump)
        sprite_index = spr_player_barrelfall;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (!jumpstop && !input_check("jump") && vsp < 0)
    {
        jumpstop = 1;
        vsp /= 20;
    }
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = approach(movespeed, xscale * 8, 0.5);
        else
            movespeed = approach(movespeed, 0, 0.5);
        
        if (movespeed <= 0)
            xscale = move;
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.5);
    }
    
    if (grounded)
    {
        state = states.barrel;
        sprite_index = spr_player_barrelland;
        image_index = 0;
        create_particle(x, y, particle.landcloud, 0);
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
        movespeed = 0;
    
    exit;
}
