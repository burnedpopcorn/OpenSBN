function state_player_normal()
{
    mach2 = 0;
    move = input_check("right") - input_check("left");
    skateboarding = 0;
    momemtum = 0;
    jumpstop = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2 * getRPGMulti("movespeed");
        facehurt = 0;
    }
    
    if (input_check_pressed("taunt"))
    {
        input_finisher_buffer = 60;
        input_attack_buffer = 0;
        input_up_buffer = 0;
        input_down_buffer = 0;
    }
    
    if (input_check("taunt"))
    {
        if (breakdance_speed < 0.8)
            breakdance_speed = approach(breakdance_speed, 0.8, 0.005);
        else
            breakdance_speed = approach(breakdance_speed, 1.2, 0.00005);
    }
    else
    {
        breakdance_speed = 0.1;
    }
    
    if (breakdance_speed >= 0.5)
    {
        if (!instance_exists(obj_beatbox) && room != hub_soundtest)
        {
            instance_create(x, y, obj_genericpoofeffect);
            
            with (instance_create(x, y, obj_beatbox))
                vsp = -11;
        }
        
        notecreate--;
    }
    
    if (notecreate <= 0)
    {
        if (sprite_index == spr_player_breakdance)
        {
            repeat (6)
            {
                if (floor(image_index) < 2)
                {
                    with (instance_create(x - irandom_range(18, 25), y - irandom_range(18, 25), obj_confetti))
                    {
                        depth = other.depth + 1;
                        image_xscale = -1;
                    }
                }
                else if (floor(image_index) >= 2)
                {
                    with (instance_create(x + irandom_range(18, 25), y - irandom_range(18, 25), obj_confetti))
                    {
                        depth = other.depth + 1;
                        image_xscale = 1;
                    }
                }
            }
        }
        
        notecreate = 20;
    }
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
        railmomentum = 1;
    }
    
    hsp = (move * movespeed) + (railmovespeed * raildir);
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < (8 * getRPGMulti("movespeed")))
            movespeed += 0.5;
        else if (floor(movespeed * getRPGMulti("movespeed")) == (8 * getRPGMulti("movespeed")))
            movespeed = 6 * getRPGMulti("movespeed");
        
        if (movespeed < 3 && move != 0)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
        
        if (!machslideAnim && !landAnim && !shotgunAnim)
        {
            machslideAnim = 0;
            idle = 0;
            facehurt = 0;
            
            if (shoot)
                sprite_index = spr_pistolwalk;
            else if (mort)
                sprite_index = spr_player_mortwalk;
            else if (input_check("taunt") && breakdance_speed >= 0.3)
                sprite_index = spr_player_breakdance;
            else if (room == hub_soundtest && obj_soundtest.active)
                sprite_index = spr_player_soundtestdance;
            else if (global.minutes == 0 && global.seconds == 0)
                sprite_index = spr_hurtwalk;
            else if (global.combo >= 25)
                sprite_index = spr_3hpwalk;
            else if (global.combo >= 50)
                sprite_index = spr_ragemove;
            else
                sprite_index = spr_move;
        }
        
        if (place_meeting_collision(x + sign(hsp), y, Exclude.SLOPES) && xscale == move)
            movespeed = 0;
        
        if (grounded)
        {
            if (steppybuffer > 0)
            {
                steppybuffer--;
            }
            else if (sprite_index != spr_player_breakdance && sprite_index != spr_playerN_breakdance)
            {
                steppybuffer = 12;
                event_play_oneshot("event:/SFX/bo/step", x, y);
                create_particle(x, y + 43, particle.cloudeffect, 0);
            }
        }
    }
    else
    {
        steppybuffer = 12;
        
        if (sprite_index == spr_breakdancesuper)
            image_speed = 1;
        else
            image_speed = 0.35;
        
        movespeed = 0;
        
        if (!machslideAnim && !landAnim && !shotgunAnim)
        {
            if (idle < 400 && !input_check("taunt"))
                idle++;
            
            if (idle >= 150 && !input_check("taunt"))
            {
                if (sprite_index != spr_idle && floor(image_index) == (image_number - 1))
                {
                    facehurt = 0;
                    idle = 0;
                }
                
                if (sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6 && sprite_index != spr_player_soundtestdance)
                {
                    idleanim = random_range(0, 100);
                    image_index = 0;
                    
                    if (chance(25))
                        event_play_oneshot("event:/SFX/voice/collect", x, y);
                    
                    if (idleanim <= 16)
                        sprite_index = spr_idle1;
                    else if (idleanim > 16 && idleanim <= 32)
                        sprite_index = spr_idle2;
                    else if (idleanim > 32 && idleanim <= 48)
                        sprite_index = spr_idle3;
                    else if (idleanim > 48 && idleanim <= 64)
                        sprite_index = spr_idle4;
                    else if (idleanim > 64 && idleanim <= 80)
                        sprite_index = spr_idle5;
                    else
                        sprite_index = spr_idle6;
                }
            }
            else if (!facehurt)
            {
                if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
                {
                    start_running = 1;
                    movespeed = 0;
                    
                    if (shoot)
                        sprite_index = spr_player_pistolidle;
                    else if (mort)
                        sprite_index = spr_player_mortidle;
                    else if (input_check("taunt") && breakdance_speed >= 0.3)
                        sprite_index = spr_breakdancesuper;
                    else if (room == hub_soundtest && obj_soundtest.active)
                        sprite_index = spr_player_soundtestdance;
                    else if (global.minutes == 0 && global.seconds == 0)
                        sprite_index = spr_hurtidle;
                    else if (global.panic)
                        sprite_index = spr_panic;
                    else if (global.combo >= 25)
                        sprite_index = spr_3hpidle;
                    else if (global.combo >= 50)
                        sprite_index = spr_rageidle;
                    else
                        sprite_index = spr_idle;
                }
                else
                {
                    idle = 0;
                    windingAnim--;
                    sprite_index = spr_winding;
                    
                    if (input_check("taunt") && breakdance_speed >= 0.3)
                        sprite_index = spr_player_breakdance;
                }
            }
            else
            {
                windingAnim = 0;
                sprite_index = spr_facehurt;
                
                if (input_check("taunt") && breakdance_speed >= 0.3)
                    sprite_index = spr_player_breakdance;
            }
        }
    }
    
    if (movespeed > (8 * getRPGMulti("movespeed")))
        movespeed -= 0.1;
    
    if (landAnim)
    {
        if (!shotgunAnim)
        {
            if (move == 0)
            {
                movespeed = 0;
                sprite_index = spr_land;
                
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0;
            }
            else
            {
                sprite_index = spr_land2;
                
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0;
                    sprite_index = spr_move;
                    image_index = 0;
                }
            }
        }
    }
    else if (shotgunAnim && sprite_index != spr_shotgunshoot && !machslideAnim)
    {
        sprite_index = (move == 0) ? spr_shotgunidle : spr_shotgunwalk;
    }
    
    if (machslideAnim)
        sprite_index = spr_machslideend;
    
    if (floor(image_index) == (image_number - 1))
    {
        switch (sprite_index)
        {
            case spr_machslideend:
                machslideAnim = 0;
                sprite_index = spr_idle;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunidle;
                
                break;
            
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle;
                break;
        }
    }
    
    if (can_jump)
    {
        if ((input_check_pressed("jump") || (input_buffer_jump < 8 && !input_check("attack") && vsp > 0)) && !input_check("down"))
        {
            event_play_oneshot("event:/SFX/bo/jump", x, y);
            
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunjump;
                
                image_index = 0;
            }
            
            particle_set_scale(particle.highjumpcloud2, xscale, 1);
            create_particle(x, y, particle.highjumpcloud2, 0);
            vsp = -11 * getRPGMulti("jump");
            state = states.jump;
            jumpAnim = 1;
            jumpstop = 0;
            
            if (place_meeting(x, y + 1, obj_railparent))
                railmomentum = 1;
            
            freefallstart = 0;
        }
        
        if (input_check("down") || (grounded && vsp > 0 && scr_solid(x, y - 3) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
        {
            state = states.crouch;
            landAnim = 0;
            crouchAnim = 1;
            image_index = 0;
            idle = 0;
        }
    }
    else if (!input_check("jump"))
    {
        if (sprite_index != spr_shotgunshoot)
        {
            if (!shotgunAnim)
                sprite_index = spr_fall;
            else
                sprite_index = spr_shotgunfall;
            
            image_index = 0;
            jumpAnim = 0;
        }
        else
        {
            jumpAnim = 1;
        }
        
        state = states.jump;
    }
    
    if (input_check_pressed("shoot"))
        scr_kungfu();
    
    if ((input_check_pressed("slap") || input_buffer_slap < 8) && !input_check("up"))
    {
        sprite_index = spr_suplexdash;
        
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
        movespeed = 8 * getRPGMulti("attack");
        image_index = 0;
        flash = 1;
    }
    else if ((input_check_pressed("slap") || input_buffer_slap < 8) && input_check("up"))
    {
        state = states.punch;
        image_index = 0;
        sprite_index = spr_breakdanceuppercut;
        
        if (chance(50))
            event_play_oneshot("event:/SFX/voice/uppercutVoice", x, y);
        
        vsp = (grounded ? -15 : -11) * getRPGMulti("jump");
        movespeed = hsp;
        event_play_oneshot("event:/SFX/bo/uppercut", x, y);
        particle_set_scale(particle.highjumpcloud2, xscale, 1);
        create_particle(x, y, particle.highjumpcloud2, 0);
    }
    
    if (input_check("attack") && state != states.handstandjump && !bump_wall(xscale))
    {
        sprite_index = spr_mach1;
        image_index = 0;
        state = states.mach2;
        
        if (movespeed < (6 * getRPGMulti("movespeed")))
            movespeed = 6 * getRPGMulti("movespeed");
    }
    
    scr_dotaunt();
    
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0;
        machslideAnim = 0;
        image_speed = 0.45;
    }
    
    exit;
}

function state_pepperman_normal()
{
    pepperman_grab_reset();
    move = input_check("right") - input_check("left");
    
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel;
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel;
    else if (move == 0)
        movespeed -= pepperman_deccel;
    
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal;
    
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3;
    else if (movespeed < 0)
        movespeed = 0;
    
    if (move != 0 && movespeed == 0)
        xscale = move;
    
    hsp = xscale * movespeed;
    
    if (sprite_index != spr_pepperman_throw)
    {
        if (hsp != 0)
            sprite_index = spr_move;
        else
            sprite_index = spr_idle;
    }
    
    if ((input_buffer_jump < 8 || input_check_pressed("jump")) && can_jump && vsp > 0)
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        sprite_index = spr_jump;
        image_index = 0;
        vsp = -pepperman_jumpspeed;
        state = states.jump;
        
        with (instance_create(x, y - 5, obj_highjumpcloud2))
            image_xscale = other.xscale;
    }
    
    if (!grounded && !input_check("jump"))
    {
        state = states.jump;
        sprite_index = spr_fall;
    }
    
    if (input_check("attack") && (!place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move;
        
        state = states.shoulderbash;
        sprite_index = spr_pepperman_shoulderstart;
        image_index = 0;
    }
    
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_idle;
    
    if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
    {
        instance_create(x, y + 38, obj_cloudeffect);
        steppy = 1;
    }
    
    if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
        steppy = 0;
    
    exit;
}

function pepperman_grab_reset()
{
    if (pepperman_grabID != -4)
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4;
    }
    
    exit;
}

function scr_player_normal()
{
    if (character != "M")
        state_player_normal();
    else
        state_pepperman_normal();
    
    exit;
}
