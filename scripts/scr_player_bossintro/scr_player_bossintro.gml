function state_player_bossintro()
{
    hsp = 0;
    xscale = 1;
    hurted = 0;
    inv_frames = 0;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
    {
        state = states.normal;
        image_index = 0;
    }
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        image_speed = 0;
    else
        image_speed = 0.35;
    
    exit;
}
