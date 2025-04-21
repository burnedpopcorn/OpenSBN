function state_player_ratmountattack()
{
    image_speed = 0.35;
    hsp = xscale * movespeed;
    vsp = 0;
    move = input_check("right") - input_check("left");
    landAnim = 0;
    
    if (movespeed < 10 && grounded)
        movespeed += 0.5;
    else if (!grounded)
        movespeed = 10;
    
    if (input_check_pressed("jump") && !doublejump)
    {
        doublejump = 1;
        vsp = -11;
        state = states.ratmountjump;
        jumpstop = 0;
        sprite_index = spr_player_ratmountwalljump;
    }
    
    if (floor(image_index) == (image_number - 1))
        state = states.ratmount;
    
    var _ledge;
    
    if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
        _ledge = slope_check_up(x + xscale, y, (vsp >= 0) ? 32 : 22);
    
    if (_ledge > 0)
        y -= _ledge;
    
    exit;
}
