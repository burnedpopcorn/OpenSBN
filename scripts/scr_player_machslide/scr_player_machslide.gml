function state_player_machslide()
{
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    move = input_check("right") - input_check("left");
    
    if (movespeed >= 0)
        movespeed -= (0.4 * getRPGMulti("movespeed"));
    
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_machslide;
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
        image_speed = 0;
    else
        image_speed = 0.35;
    
    landAnim = 0;
    
    if (floor(movespeed) <= 0 && (sprite_index == spr_machslide || sprite_index == spr_crouchslide))
    {
        state = states.normal;
        image_index = 0;
        
        if (sprite_index == spr_machslide)
            machslideAnim = 1;
        
        movespeed = 0;
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && (sprite_index == spr_machslide || sprite_index == spr_machslidestart))
    {
        sprite_index = spr_player_wallsplat;
        event_play_oneshot("event:/SFX/bo/splat", x, y);
        state = states.bump;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost && grounded)
    {
        hsp = 0;
        image_index = 0;
        xscale *= -1;
        movespeed = 8 * getRPGMulti("movespeed");
        state = states.mach2;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach3boost && grounded)
    {
        if (!launch)
        {
            hsp = 0;
            sprite_index = spr_mach4;
            image_index = 0;
            xscale *= -1;
            movespeed = 12 * getRPGMulti("movespeed");
            state = states.mach3;
        }
        else
        {
            xscale *= -1;
            sprite_index = spr_dashpadmach;
            image_index = 0;
            state = states.mach3;
            movespeed = 14 * getRPGMulti("movespeed");
            launched = 1;
            launch = 0;
            launch_buffer = 20;
        }
    }
    
    if (sprite_index == spr_null && movespeed == 0 && grounded)
    {
        facehurt = 1;
        state = states.normal;
        sprite_index = spr_facehurtup;
    }
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting_platform(x, y + 1, obj_waterTop))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting_platform(x, y + 1, obj_waterTop) && !place_meeting_solid(x, y + 1) && !place_meeting_slope(x, y + 1))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            sprite_index = spr_watereffect;
            
            with (obj_secretportal)
            {
                if (secret)
                {
                    other.secret = true;
                    other.image_blend = #0043FF;
                }
            }
            
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    exit;
}
