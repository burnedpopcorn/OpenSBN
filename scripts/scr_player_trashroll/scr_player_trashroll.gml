function state_player_trashroll()
{
    hsp = xscale * movespeed;
    
    if (scr_slope() && hsp != 0)
        scr_playerAddSlopeMomentum(0.25, 0.5);
    
    movespeed = max(3, movespeed);
    
    if (sprite_index != spr_null && sprite_index != spr_null)
    {
        if (sprite_index != spr_player_trashjump && sprite_index != spr_player_trashjump2 && sprite_index != spr_player_trashfall)
        {
            sprite_index = spr_player_trashslide;
        }
        else
        {
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
                sprite_index = spr_player_trashfall;
            
            if (vsp > 0 && sprite_index == spr_player_trashjump)
            {
                sprite_index = spr_player_trashjump2;
                image_index = 0;
            }
            
            if (grounded && vsp > 0)
                sprite_index = spr_player_trashslide;
        }
    }
    else
    {
        image_speed = 0.35;
        
        if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
            sprite_index = spr_null;
    }
    
    if (input_check_pressed("jump"))
    {
        dir = xscale;
        state = states.mach2;
        sprite_index = spr_mach2jump;
        jumpstop = 0;
        vsp = -11;
        instance_create(x, y, obj_jumpdust);
    }
    
    if (((place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_ghostwall)) && !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_rattumble)) || place_meeting(x, y, obj_timedgate))
    {
        state = states.bump;
        hsp = -xscale * 3;
        vsp = -3;
    }
    
    exit;
}
