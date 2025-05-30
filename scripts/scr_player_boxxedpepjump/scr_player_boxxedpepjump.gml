function state_player_boxxedpepjump()
{
    move = input_check("right") - input_check("left");
    
    if (boxxeddash == 1)
        image_speed = abs(movespeed) / 15;
    else
        image_speed = 0.5;
    
    if (abs(hsp) <= 2)
        boxxeddash = 0;
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
    }
    
    hsp = movespeed + (railmovespeed * raildir);
    
    if (scr_solid(x + sign(hsp), y) && xscale == move && (!place_meeting(x + xscale, y, obj_slope) || scr_solid_slope(x + xscale, y)))
        movespeed = 0;
    
    if (!input_check("jump") && !jumpstop && vsp < 0)
    {
        jumpstop = 1;
        vsp /= 5;
    }
    
    if (move != 0)
    {
        if (((xscale > 0 && movespeed < 8) || (xscale < 0 && movespeed > -8)) && move == xscale)
            movespeed += (xscale * 0.8);
        
        if (boxxeddash == 0)
            xscale = move;
        else if (move != xscale)
            movespeed = approach(movespeed, 0, 0.8);
    }
    else if (boxxeddash == 0)
    {
        movespeed = approach(movespeed, 0, 0.8);
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.25);
    }
    
    if (grounded)
    {
        state = states.boxxedpep;
        sprite_index = spr_boxxedpepidle;
    }
    
    if (input_check_pressed("jump") && boxxedpepjump > 4)
    {
        jumpstop = 0;
        sprite_index = spr_boxxedpep_flap;
        image_index = 0;
        
        repeat (7)
        {
            with (instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_highjumpcloud2))
            {
                vspeed = 2;
                sprite_index = spr_cloudeffect;
            }
        }
        
        state = states.boxxedpepjump;
        boxxedpepjump *= 0.9;
        vsp = -boxxedpepjump;
    }
    
    if (sprite_index == spr_boxxedpep_flap && floor(image_index) == (image_number - 1))
        sprite_index = spr_boxxedpepair;
    
    if (input_check_pressed("slap"))
    {
        state = states.boxxedpepspin;
        sprite_index = spr_boxxedpep_spin;
        image_index = 0;
    }
    
    exit;
}
