function state_player_boxxedpepspin()
{
    image_speed = 0.5;
    hsp = xscale * movespeed;
    doublejump = 1;
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
    }
    
    move = input_check("right") - input_check("left");
    hsp = movespeed + (railmovespeed * raildir);
    
    if (move != 0)
    {
        if (abs(movespeed) <= 8)
            movespeed += (move * 0.3);
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.25);
    }
    
    if (grounded)
    {
        vsp = -6;
        instance_create(x, y, obj_stompeffect);
    }
    
    if (scr_solid(x + sign(hsp), y) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_slope) || scr_solid_slope(x + hsp, y)))
        movespeed = -(sign(hsp) * 6);
    
    instance_destroy(instance_place(x + hsp, y, obj_destructibles));
    
    if (!input_check("slap"))
    {
        state = states.boxxedpepjump;
        sprite_index = spr_boxxedpepair;
    }
    
    exit;
}
