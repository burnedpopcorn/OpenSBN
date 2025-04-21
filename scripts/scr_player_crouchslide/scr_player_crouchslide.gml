function state_player_crouchslide()
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
    
    if (movespeed >= 0 && grounded)
        movespeed -= (0.2 * getRPGMulti("movespeed"));
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (can_jump && input_buffer_jump < 8 && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
    {
        sprite_index = spr_player_jumpdive1;
        image_index = 0;
        vsp = -11 * getRPGMulti("jump");
        
        with (instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (grounded && (sprite_index == spr_player_jumpdive1 || sprite_index == spr_crouchslipFall) && vsp > 0)
    {
        sprite_index = spr_crouchslip;
        jumpstop = 0;
    }
    
    if (sprite_index == spr_player_jumpdive1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_crouchslipFall;
    
    mask_index = spr_crouchmask;
    
    if (grounded && input_check("attack") && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
    {
        movespeed = 8;
        state = states.mach2;
        image_index = 0;
        sprite_index = spr_rollgetup;
    }
    
    if (((movespeed <= 5 || (scr_solid(x + 1, y) && xscale == 1) || (scr_solid(x - 1, y) && xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slope)) || movespeed <= 0)
        state = states.crouch;
    
    if (scr_solid(x + 1, y) && xscale == 1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
        state = states.crouch;
    
    if (scr_solid(x - 1, y) && xscale == -1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
        state = states.crouch;
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    image_speed = movespeed / 24;
    exit;
}
