function state_player_rocket()
{
    hsp = xscale * movespeed;
    move = input_check("right") - input_check("left");
    
    with (instance_place(x + hsp, y, obj_solid))
        instance_destroy();
    
    alarm[5] = -1;
    alarm[8] = 60;
    alarm[7] = 120;
    hurted = 1;
    
    if (sprite_index != spr_rocketstart)
    {
        var _spd = 6;
        var _accel = 1;
        
        if (input_check("up") && !input_check("down"))
            rocketvsp = approach(rocketvsp, -_spd, _accel);
        else if (input_check("down") && !input_check("up"))
            rocketvsp = approach(rocketvsp, _spd, _accel);
        else
            rocketvsp = approach(rocketvsp, 0, _accel);
        
        vsp = rocketvsp;
        
        if (movespeed < 16)
            movespeed = 16;
    }
    else
    {
        rocketvsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_rocket;
            image_index = 0;
            movespeed = 16;
        }
    }
    
    if (input_check_pressed("jump"))
    {
        dir = xscale;
        state = states.mach2;
        sprite_index = spr_mach2jump;
        jumpstop = 0;
        vsp = -11;
        instance_create(x, y, obj_jumpdust);
        
        with (instance_create(x, y + 12, obj_rocketdead))
        {
            hsp = other.xscale * 6;
            vsp = 5;
            image_xscale = sign(hsp);
        }
    }
    
    if (fightball == 0)
    {
        if (sprite_index != spr_rocketstart)
        {
            sprite_index = spr_rocket;
            
            if (grounded && vsp >= 0)
                sprite_index = spr_player_rocketrun;
        }
    }
    
    if (grounded)
    {
        move = input_check("right") - input_check("left");
        
        if (move != 0 && move != xscale && sprite_index != spr_rocketstart)
        {
            state = states.rocketslide;
            event_play_oneshot("event:/SFX/bo/machslideboost", x, y);
            sprite_index = spr_player_rocketslide;
            image_index = 0;
        }
    }
    
    if (scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)) && character != "V" && !place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V" && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
    {
        pizzapepper = 0;
        sprite_index = spr_rockethitwall;
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
        event_play_oneshot("event:/SFX/bo/bumpwall", x, y);
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        hsp = 0;
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
        image_index = 0;
        instance_create(x - 10, y + 10, obj_bumpeffect);
        instance_create(x, y, obj_player1explosion);
    }
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting_platform(x, y + 1, obj_waterTop))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player1.x, obj_player1.y, obj_slapstar);
            
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting_platform(x, y + 1, obj_waterTop) && !place_meeting_solid(x, y + 1) && !place_meeting_slope(x, y + 1))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player1.x, obj_player1.y, obj_slapstar);
            
            image_xscale = other.xscale;
            sprite_index = spr_watereffect;
            other.dashcloudid = id;
        }
    }
    
    if (sprite_index != spr_rocketstart && !instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    
    if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else
        image_speed = 0.4;
    
    exit;
}
