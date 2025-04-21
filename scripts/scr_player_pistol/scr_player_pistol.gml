function state_player_pistol()
{
    move = input_check("right") - input_check("left");
    hsp = xscale * movespeed;
    
    if (movespeed < 10)
        movespeed += 0.15;
    
    if (floor(image_index) == (image_number - 1) && grounded && input_check("attack"))
        state = states.mach2;
    else if (floor(image_index) == (image_number - 1))
        state = states.normal;
    
    if (input_check_pressed("jump") && grounded && !input_check("down"))
    {
        jumpstop = 0;
        vsp = -11;
        state = states.tumble;
        sprite_index = spr_mach2jump;
    }
    
    if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        var _ledge = slope_check_up(x + xscale, y, (vsp >= 0) ? 32 : 22);
        
        if (_ledge > 0)
        {
            y -= _ledge;
        }
        else
        {
            jumpstop = 1;
            state = states.jump;
            vsp = -4;
            sprite_index = spr_suplexbump;
            instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
        }
    }
    
    if (input_check("down") && grounded && global.attackstyle != 2)
    {
        grav = 0.5;
        sprite_index = spr_crouchslip;
        machhitAnim = 0;
        state = states.crouchslide;
        movespeed += 3;
    }
    
    if (state != states.bump && move != xscale && move != 0)
    {
        image_index = 0;
        
        if (!grounded)
        {
            sprite_index = spr_suplexcancel;
            jumpAnim = 1;
            grav = 0.5;
            state = states.jump;
        }
        else
        {
            state = states.normal;
            grav = 0.5;
        }
    }
    
    image_speed = 0.35;
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 4)
        instance_create(x, y, obj_slidecloud);
    
    exit;
}
