function state_player_grind()
{
    var slope = instance_place(x, y + 1, obj_grindrailslope);
    
    if (instance_exists(slope) && !place_meeting_platform(x + hsp, y + vsp, obj_grindrail))
    {
        if (xscale != sign(slope.image_xscale))
            sprite_index = spr_grinddown;
        else
            sprite_index = spr_grindup;
    }
    else
    {
        sprite_index = !skateboarding ? spr_grind : spr_clown;
    }
    
    image_speed = 0.35;
    machhitAnim = 0;
    crouchslideAnim = 1;
    hsp = xscale * movespeed;
    
    if (movespeed < 10)
        movespeed = approach(movespeed, 10, 0.5);
    
    if (!place_meeting_platform(x, y + 1, obj_grindrail) && !place_meeting_slopePlatform(x, y + 1, obj_grindrailslope))
    {
        if (movespeed < 12 || skateboarding)
        {
            state = states.mach2;
            sprite_index = spr_grindfall;
        }
        else
        {
            state = states.mach3;
            sprite_index = spr_grindfall;
        }
    }
    
    if (place_meeting_collision(x + xscale, y, UnknownEnum.Value_1))
    {
        instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
        xscale *= -1;
        hsp *= -1;
    }
    
    if (input_check_pressed("jump"))
    {
        vsp = -11;
        jumpstop = 0;
        
        if (skateboarding)
        {
            sprite_index = spr_clownjump;
            image_index = 0;
        }
        
        if (movespeed < 12 || skateboarding)
        {
            state = states.mach2;
            sprite_index = spr_grindjump;
            image_index = 0;
        }
        else
        {
            state = states.mach3;
            sprite_index = spr_grindjump;
            image_index = 0;
        }
    }
    
    if (!instance_exists(obj_grindeffect))
    {
        instance_create(x, y, obj_grindeffect, 
        {
            playerid: id
        });
    }
    
    exit;
}
