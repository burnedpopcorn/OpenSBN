function state_player_blockstance()
{
    hsp = approach(hsp, 0, 0.5);
    movespeed = 0;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        sprite_index = spr_null;
    
    if (!input_check("attack") && sprite_index != spr_null)
    {
        state = states.normal;
        landAnim = 0;
    }
    
    exit;
}
