function state_player_hang()
{
    hsp = 0;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        sprite_index = spr_null;
    
    vsp = 0;
    wallclingcooldown = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        jumpstop = 0;
        vsp = -15;
        state = states.jump;
        sprite_index = spr_null;
        image_index = 0;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    exit;
}
