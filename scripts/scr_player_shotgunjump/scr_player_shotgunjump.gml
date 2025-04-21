function state_player_shotgunjump()
{
    image_speed = 0.35;
    move = input_check("right") - input_check("left");
    hsp = move * movespeed;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 0;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
        else if (floor(movespeed) == 8)
            movespeed = 6;
    }
    else
    {
        movespeed = 0;
    }
    
    if (!input_check("jump") && vsp < 0.5 && !jumpstop)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (scr_solid(x, y - 1) && !jumpstop)
    {
        vsp = grav;
        jumpstop = 1;
    }
    
    if (input_buffer_jump < 8 && can_jump)
    {
        input_buffer_jump = 8;
        state = states.shotgunjump;
        vsp = -11;
        jumpstop = 0;
        sprite_index = spr_shotgunjump;
        image_index = 0;
    }
    
    if (grounded && vsp > 0)
    {
        sprite_index = spr_shotgunland;
        image_index = 0;
        landAnim = 1;
        state = states.shotgun;
    }
    
    if (input_check_pressed("attack"))
    {
        state = states.shotgundash;
        sprite_index = spr_shotgunsuplexdash;
        image_index = 0;
        movespeed = 10;
    }
    
    if (input_check_pressed("slap"))
    {
        if (!input_check("down"))
        {
            sprite_index = spr_shotgunshoot;
            image_index = 0;
            state = states.shotgunshoot;
            
            with (instance_create(x, y, obj_pistoleffect))
                image_xscale = other.xscale;
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                spdh = 4;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                spdh = -4;
                shotgun = 1;
            }
        }
        else
        {
            state = states.shotgunfreefall;
            sprite_index = spr_shotgunjump1;
            image_index = 0;
            vsp = -11;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = spr_null;
                spdh = -10;
                spd = 0;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = spr_null;
                spdh = -10;
                spd = 5;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = spr_null;
                spdh = -10;
                spd = -5;
                shotgun = 1;
            }
        }
    }
    
    if (sprite_index == spr_shotgunjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_shotgunfall;
    
    exit;
}
