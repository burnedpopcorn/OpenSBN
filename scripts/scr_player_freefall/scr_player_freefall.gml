function state_player_freefall()
{
    landAnim = 1;
    
    if (sprite_index == spr_bodyslamstart)
    {
        vsp = approach(vsp, 0, 0.35 * getRPGMulti("groundpound"));
        vsp -= (grav * getRPGMulti("jump"));
    }
    else
    {
        if (vsp >= 2)
            vsp += ((place_meeting(x, y, obj_water) ? 0.1 : 0.5) * getRPGMulti("groundpound"));
        
        if (steppybuffer > 0)
        {
            steppybuffer--;
        }
        else
        {
            create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), particle.cloudeffect, 0);
            steppybuffer = 8;
        }
    }
    
    if (sprite_index == spr_player_bombstart && animation_end())
    {
        sprite_index = spr_player_poundcancel1;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
    {
        sprite_index = spr_bodyslamfall;
        vsp = 5 * getRPGMulti("groundpound");
    }
    
    move = input_check("right") - input_check("left");
    
    if (!grounded)
    {
        if (sprite_index != spr_rockethitwall)
            hsp = move * movespeed;
        else
            hsp = 0;
        
        if (move != xscale && momemtum == 1 && movespeed != 0)
            movespeed -= 0.05;
        
        if (movespeed == 0)
            momemtum = 0;
        
        if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
        {
            movespeed = 0;
            mach2 = 0;
        }
        
        if (move != 0 && movespeed < 7)
            movespeed += 0.25;
        
        if (movespeed > 7)
            movespeed -= 0.05;
        
        if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
            movespeed = 0;
        
        if (dir != xscale)
        {
            mach2 = 0;
            dir = xscale;
            movespeed = 0;
        }
        
        if (move == -xscale)
        {
            mach2 = 0;
            movespeed = 0;
            momemtum = 0;
        }
        
        if (move != 0)
            xscale = move;
    }
    
    if (vsp > 0)
        freefallsmash += floor(1 * getRPGMulti("groundpound"));
    else if (vsp < 0)
        freefallsmash = -14;
    
    if (freefallsmash >= 10 && !instance_exists(superslameffectid))
    {
        var _yoff = (sprite_index == spr_player_poundcancel1) ? -8 : 0;
        
        with (instance_create(x, y + _yoff, obj_superslameffect))
        {
            playerid = other.object_index;
            other.superslameffectid = id;
            yoff = _yoff;
            depth = other.depth - 1;
        }
    }
    
    if (grounded && (freefallsmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + vsp, obj_destructibles))
    {
        if (scr_slope())
        {
            if (place_meeting_slope(x, y + 1, false))
            {
                with (instance_place(x, y + 1, obj_slope))
                    other.xscale = -sign(image_xscale);
            }
            
            if (place_meeting_slopePlatform(x, y + 1))
            {
                with (instance_place(x, y + 1, obj_slopePlatform))
                    other.xscale = -sign(image_xscale);
            }
            
            state = states.tumble;
            sprite_index = spr_crouchslip;
            
            if (freefallsmash > 20)
                movespeed = 12 * getRPGMulti("movespeed");
            else
                movespeed = 8 * getRPGMulti("movespeed");
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = -other.xscale;
        }
        else
        {
            event_play_oneshot("event:/SFX/bo/groundpound", x, y);
            
            if (sprite_index == spr_player_poundcancel1 || sprite_index == spr_player_bombstart)
                sprite_index = spr_player_poundcancel2;
            else if (shotgunAnim == 0)
                sprite_index = spr_bodyslamland;
            else
                sprite_index = spr_shotgunjump2;
            
            image_index = 0;
            state = states.freefallland;
            jumpAnim = 1;
            jumpstop = 0;
            
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 15 / room_speed;
            }
            
            if (freefallsmash >= 10)
            {
                with (obj_baddie)
                {
                    if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
                    {
                        state = states.stun;
                        
                        if (stunned < 60)
                            stunned = 60;
                        
                        vsp = -11;
                        image_xscale *= -1;
                        hsp = 0;
                        momentum = 0;
                    }
                }
                
                with (obj_camera)
                {
                    shake_mag = 10;
                    shake_mag_acc = 30 / room_speed;
                }
                
                combo = 0;
                bounce = 0;
            }
            
            create_particle(x, y + 3, particle.groundpoundeffect, 0);
            freefallstart = 0;
        }
    }
    
    if (input_check_pressed("slap") && freefallsmash > 0)
    {
        if (move != 0)
            xscale = move;
        
        jumpstop = 1;
        vsp = -4 * getRPGMulti("jump");
        flash = 1;
        movespeed = clamp(movespeed, 10, 12) * getRPGMulti("attack");
        crouchslipbuffer = 25;
        image_index = 0;
        sprite_index = spr_playerN_jetpackboost;
        state = states.tumble;
        event_play_oneshot("event:/SFX/bo/superjumpcancel", x, y);
        
        with (instance_create(x, y, obj_crazyrunothereffect))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    
    if (sprite_index == spr_bodyslamstart)
        image_speed = 0.6;
    
    if (character == "M")
    {
        if (!input_check("down"))
        {
            state = states.jump;
            sprite_index = spr_fall;
            image_index = 0;
        }
    }
    
    if (freefallsmash >= 10 && !instance_exists(crazyruneffectid))
    {
        with (instance_create(x, y, obj_crazysjumpeffect, 
        {
            image_angle: -90
        }))
            other.crazyruneffectid = id;
    }
    
    exit;
}
