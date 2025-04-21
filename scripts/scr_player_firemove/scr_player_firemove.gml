function state_player_firemove()
{
    movespeed = 8;
    firemovedir = (firemovedir + ((input_check("right") - input_check("left")) * 3)) % 360;
    
    if (firemovedir < 0)
        firemovedir += 360;
    
    hsp = lengthdir_x(movespeed * xscale, firemovedir);
    vsp = lengthdir_y(movespeed * xscale, firemovedir);
    
    if (movespeed <= 8)
        sprite_index = spr_player_firemove;
    
    if (movespeed > 8 && sprite_index == spr_player_firemove)
        sprite_index = spr_null;
    
    if (place_meeting(x, y + sign(vsp), obj_solid) && !place_meeting(x, y + sign(vsp), obj_destructibles))
    {
        if ((hsp * xscale) < 0)
            firemovedir = lerp(firemovedir, 180, 0.15);
        else
            firemovedir = lerp(firemovedir, 0, 0.15);
    }
    
    angle = firemovedir;
    
    if (place_meeting(x + 1, y, obj_solid) || (place_meeting(x - 1, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles)))
    {
        sprite_index = spr_player_firemovehitwall;
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
        event_play_oneshot("event:/SFX/bo/bumpwall", x, y);
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        image_speed = 0.35;
        
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
            {
                stun = 1;
                alarm[0] = 200;
                ministun = 0;
                vsp = -5;
                hsp = 0;
            }
        }
        
        flash = 0;
        state = states.bump;
        hsp = -3.5 * xscale;
        vsp = -6;
        mach2 = 0;
        xscale = sign(hsp);
        image_index = 0;
        instance_create(x - 10, y + 10, obj_bumpeffect);
    }
    
    if (sprite_index == spr_player_firemove)
    {
        if (input_check_pressed("jump"))
        {
            xscale = sign(hsp);
            state = states.mach2;
            sprite_index = spr_mach2jump;
            vsp = -12;
            angle = 0;
        }
    }
    
    if ((!instance_exists(obj_dashcloud) && grounded) && move != 0)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
}
