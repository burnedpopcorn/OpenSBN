hsp = image_xscale * movespeed;

if (!kick)
{
    mask_index = spr_player_mask;
    
    if (place_meeting(x + image_xscale, y, obj_solid))
        image_xscale *= -1;
    
    if (grounded && vsp > 0)
        movespeed = 0;
    
    if (image_index > (image_number - 1))
    {
        if (sprite_index == spr_null)
        {
            sprite_index = spr_null;
            image_index = 0;
            vsp = -5;
            movespeed = 6;
        }
        else if (sprite_index == spr_null)
        {
            sprite_index = spr_null;
            image_index = 0;
        }
    }
    
    if (sprite_index == spr_null && countdown < (countdownmax / 2))
        sprite_index = spr_null;
    
    if (sprite_index == spr_null || sprite_index == spr_null)
        countdown--;
    
    if (countdown <= 0)
        instance_destroy();
    
    if (grounded && sprite_index != spr_null && vsp > 0)
    {
        movespeed = 0;
        sprite_index = spr_null;
        image_index = 0;
    }
}
else
{
    mask_index = spr_crouchmask;
    
    if (place_meeting(x + hsp, y, obj_solid))
    {
        sprite_index = spr_null;
        image_index = 0;
        kick = 0;
        hsp = 0;
    }
}

if (drop && grounded)
    instance_destroy();

scr_collide();
