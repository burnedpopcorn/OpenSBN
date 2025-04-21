function state_player_finishingblow()
{
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    
    if (floor(image_index) < 4 && sprite_index != spr_swingdingend)
        movespeed = approach(movespeed, 0, 1);
    else
        movespeed = approach(movespeed, -xscale * 4, 0.5);
    
    if (floor(image_index) == (image_number - 1))
    {
        movespeed = abs(movespeed);
        state = states.normal;
    }
    
    if (floor(image_index) == 0 && !instance_exists(obj_swordhitbox))
    {
        gamepad_vibrate_constant(2, 2);
        
        with (instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index;
    }
    
    image_speed = 0.4;
    landAnim = 0;
    
    if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 3)
    {
        with (instance_create(x, y, obj_dashcloud2))
            image_xscale = other.xscale;
    }
    
    if (punch_afterimage > 0)
    {
        punch_afterimage--;
    }
    else
    {
        punch_afterimage = 5;
        create_spink_afterimage(x, y, sprite_index, image_index, xscale * scale_xs, image_yscale);
    }
    
    exit;
}
