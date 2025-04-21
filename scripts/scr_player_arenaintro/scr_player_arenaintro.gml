function state_player_arenaintro()
{
    hsp = 0;
    hurted = 0;
    inv_frames = 0;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        image_index = 3;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        image_speed = 0;
    else
        image_speed = 0.35;
    
    exit;
}
