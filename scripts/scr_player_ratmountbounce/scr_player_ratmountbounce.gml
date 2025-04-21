function state_player_ratmountbounce()
{
    image_speed = 0.35;
    
    if (sprite_index == spr_player_ratmountbounce)
    {
        move = input_check("right") - input_check("left");
        hsp = movespeed;
        movespeed = approach(movespeed, 0, 1);
        
        if (floor(image_index) == (image_number - 1))
        {
            hsp = movespeed;
            vsp = tauntstoredvsp;
            sprite_index = spr_player_ratmountwalljump;
            vsp = clamp(vsp, -20, -11);
        }
        
        if (!input_check("jump"))
        {
            if (hsp != 0)
                xscale = sign(hsp);
            
            state = states.ratmount;
        }
    }
    else
    {
        hsp = movespeed;
        move = input_check("right") - input_check("left");
        
        if (move != 0)
            movespeed = approach(movespeed, move * 8, 0.5);
        else
            movespeed = approach(movespeed, 0, 0.5);
        
        if (input_check_pressed("jump") && brick)
        {
            state = states.ratmountgroundpound;
            sprite_index = spr_lonegustavo_jumpstart;
            image_index = 0;
            image_speed = 0.35;
            gustavokicktimer = 5;
            brick = 0;
            movespeed = hsp;
            
            with (instance_create(x, y + 50, obj_ratmountgroundpound))
            {
                image_xscale = other.xscale;
                image_index = 0;
            }
            
            if (input_check_pressed("slap") && brick)
                ratmount_kickbrick();
        }
        
        ratmount_fallingspeed += 0.5;
        
        if (input_check_pressed("jump"))
            input_buffer_jump = 0;
        
        if (brick && scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
        {
            state = states.ratmountclimbwall;
            sticktime = 15;
            xscale = sign(hsp);
            landAnim = 0;
        }
        
        if (grounded && vsp > 0 && brick)
        {
            tauntstoredvsp = -(8 + ratmount_fallingspeed);
            ratmount_fallingspeed = 0;
            sprite_index = spr_player_ratmountbounce;
            image_index = 0;
        }
    }
    
    ratmount_dotaunt();
    exit;
}
