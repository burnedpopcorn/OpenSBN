function state_player_shoulderbash()
{
    movespeed = (sprite_index == spr_pepperman_shoulderstart) ? shoulderbash_mspeed_start : approach(movespeed, shoulderbash_mspeed_loop, 0.5);
    hsp = xscale * movespeed;
    
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x + 5, y - 5, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
            depth = other.depth - 1;
        }
    }
    
    if (sprite_index == spr_pepperman_shoulderstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_shoulderloop;
    
    if (sprite_index == spr_pepperman_shoulderloop && !input_check("attack"))
    {
        state = states.normal;
        image_index = 0;
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (grounded)
        jumpstop = 0;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (input_buffer_jump < 8 && can_jump)
    {
        vsp = -shoulderbash_jumpspeed;
        event_play_oneshot("event:/SFX/bo/jump", x, y);
    }
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y - 5, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (place_meeting(x + xscale, y, obj_solid))
        state = states.normal;
    
    exit;
}
