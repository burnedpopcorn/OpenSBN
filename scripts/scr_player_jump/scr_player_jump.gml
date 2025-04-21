function state_player_jump()
{
    landAnim = 1;
    
    if (!momemtum)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    hsp += (railmovespeed * raildir);
    
    if (input_check_pressed("taunt"))
    {
        input_finisher_buffer = 60;
        input_attack_buffer = 0;
        input_up_buffer = 0;
        input_down_buffefr = 0;
    }
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2 * getRPGMulti("movespeed");
        facehurt = 0;
    }
    
    if (move != xscale)
        movespeed = 2 * getRPGMulti("movespeed");
    
    move = input_check("right") - input_check("left");
    
    if (movespeed == 0)
        momemtum = 0;
    
    if (scr_solid(x + hsp, y))
    {
        movespeed = 0;
        mach2 = 0;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < (8 * getRPGMulti("movespeed")))
            movespeed += 0.5;
        else if (floor(movespeed * getRPGMulti("movespeed")) == (8 * getRPGMulti("movespeed")))
            movespeed = 6 * getRPGMulti("movespeed");
        
        if (scr_solid(x + xscale, y) && move == xscale)
            movespeed = 0;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > (8 * getRPGMulti("movespeed")))
        movespeed -= 0.1;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (!jumpstop)
    {
        if (!input_check("jump") && vsp < 0.5 && !stompAnim)
        {
            vsp /= 20;
            jumpstop = 1;
        }
        else if (scr_solid(x, y - 1) && !jumpAnim)
        {
            vsp = grav;
            jumpstop = 1;
        }
    }
    
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6;
        
        if (!input_check("jump"))
        {
            grav = 0.5;
            sprite_index = spr_fall;
        }
    }
    
    if (input_check_pressed("jump"))
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, spr_null);
            
            sprite_index = spr_mortdoublejump;
            image_index = 0;
            jumpstop = 0;
            grav = 0.25;
            mort = 1;
        }
    }
    
    if (can_jump)
    {
        if (input_buffer_jump < 8 && !input_check("down") && !input_check("attack") && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
        {
            event_play_oneshot("event:/SFX/bo/jump", x, y);
            stompAnim = 0;
            vsp = -11 * getRPGMulti("jump");
            state = states.jump;
            jumpAnim = 1;
            jumpstop = 0;
            freefallstart = 0;
            railmomentum = 0;
            
            if (place_meeting(x, y + 1, obj_railparent))
                railmomentum = 1;
            
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunjump;
                
                image_index = 0;
            }
            
            particle_set_scale(particle.highjumpcloud2, xscale, 1);
            create_particle(x, y, particle.highjumpcloud2, 0);
        }
        
        if (vsp > 0 && ((!input_check("attack") || bump_wall(xscale)) || sprite_index == spr_suplexbump))
        {
            event_play_oneshot("event:/SFX/bo/step", x, y);
            
            if (input_check("attack") || sprite_index == spr_shotgunshoot)
                landAnim = 0;
            
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland;
            
            if (sprite_index != spr_shotgunshoot)
                image_index = 0;
            
            input_buffer_secondjump = 0;
            state = states.normal;
            jumpAnim = 1;
            jumpstop = 0;
            freefallstart = 0;
            create_particle(x, y, particle.landcloud, 0);
        }
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (vsp > 5 && sprite_index != spr_mortdoublejump)
        fallinganimation++;
    
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp;
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall;
    
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
            switch (sprite_index)
            {
                case spr_jump:
                    sprite_index = spr_fall;
                    break;
                
                case spr_suplexcancel:
                    sprite_index = spr_fall;
                    break;
                
                case spr_stompprep:
                    sprite_index = spr_stompprep;
                    break;
            }
        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_stomp;
    }
    
    if (scr_checkgroundpound())
    {
        input_buffer_slap = 8;
        image_index = 0;
        sprite_index = spr_bodyslamstart;
        vsp = -6 * getRPGMulti("jump");
        freeFallSmash = -14 * getRPGMulti("groundpound");
        state = states.freefallprep;
    }
    
    if (sprite_index == spr_null)
        image_speed = 0.4;
    else
        image_speed = 0.35;
    
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        event_play_oneshot("event:/SFX/bo/groundpound", x, y);
        image_index = 0;
        sprite_index = spr_bodyslamland;
        state = states.freefallland;
        
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
    }
    
    if (input_check_pressed("slap") && sprite_index != spr_suplexbump && !input_check("up"))
    {
        image_index = 0;
        sprite_index = spr_suplexdashjumpstart;
        flash = 1;
        
        if (global.attackstyle == 1)
        {
            if (grounded)
                sprite_index = spr_null;
            else
                sprite_index = spr_null;
        }
        else if (global.attackstyle == 2)
        {
            sprite_index = spr_null;
        }
        
        suplexmove = 1;
        fmod_event_play(suplexdashsnd);
        state = states.handstandjump;
        movespeed = 5 * getRPGMulti("attack");
    }
    else if (input_check_pressed("slap") && input_check("up"))
    {
        state = states.punch;
        image_index = 0;
        sprite_index = spr_breakdanceuppercut;
        
        if (chance(50))
            fmod_event_play(obj_player1.voice_uppercut);
        
        fmod_event_play(uppercutsnd);
        vsp = (grounded ? -15 : -11) * getRPGMulti("jump");
        movespeed = hsp;
        particle_set_scale(particle.highjumpcloud2, xscale, 1);
        create_particle(x, y, particle.highjumpcloud2, 0);
    }
    
    if (input_check_pressed("shoot"))
        scr_kungfu();
    
    if (input_check_pressed("slap") && shoot)
    {
        if (!shotgunAnim)
        {
            flash = 1;
            
            if (!instance_exists(parry_inst) && flash == 1)
            {
                parry_inst = instance_create(x, y, obj_parryhitbox);
                var _playerid = 1;
                
                if (object_index == obj_player2)
                    _playerid = 2;
                
                with (parry_inst)
                {
                    player_id = _playerid;
                    image_xscale = other.xscale;
                }
            }
            
            if (global.mort)
            {
                with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                {
                    image_xscale = other.xscale;
                    sprite_index = spr_mortprojectile;
                }
                
                sprite_index = spr_mortthrow;
                image_index = 0;
                state = states.pistol;
                mort = 1;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
            }
            else if (character != "V" && shoot)
            {
                sprite_index = spr_pistolshot;
                image_index = 0;
                movespeed = 5;
                state = states.handstandjump;
                shoot = 1;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag = 3 / room_speed;
                }
                
                if (ispeppino)
                {
                    with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                    {
                        pistol = 1;
                        sprite_index = spr_peppinobullet;
                        image_xscale = other.xscale;
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_player1bomb))
                    {
                        kick = 1;
                        movespeed = 15;
                        image_xscale = other.xscale;
                    }
                }
            }
            else if (character != "V")
            {
            }
        }
    }
    
    if (input_check("attack") && grounded && fallinganimation < 40 && !bump_wall(xscale))
    {
        sprite_index = spr_mach1;
        image_index = 0;
        state = states.mach2;
        
        if (movespeed < (6 * getRPGMulti("movespeed")))
            movespeed = 6 * getRPGMulti("movespeed");
    }
    
    if (!input_check("attack") || move != xscale)
        mach2 = 0;
    
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0;
    
    scr_dotaunt();
    
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0;
        machslideAnim = 0;
        image_speed = 0.45;
        
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall;
    }
    
    if (place_meeting(x, y, obj_solid))
    {
        state = states.crouch;
        landAnim = 0;
        crouchAnim = 1;
        image_index = 0;
        idle = 0;
    }
    
    exit;
}

function scr_player_jump()
{
    state_player_jump();
    exit;
}
