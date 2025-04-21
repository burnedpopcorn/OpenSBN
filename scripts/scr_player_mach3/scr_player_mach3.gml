function state_player_mach3()
{
    if (windingAnim < 2000)
        windingAnim++;
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
    }
    
    hsp = (xscale * movespeed) + (railmovespeed * raildir);
    
    if (grounded)
    {
        if (scr_slope() && hsp != 0 && movespeed > 10)
            scr_playerAddSlopeMomentum(0.1, 0);
    }
    
    if (move == xscale && grounded)
    {
        if (movespeed < (20 * getRPGMulti("movespeed")))
        {
            if (mach4mode == 0)
                movespeed += (0.025 * getRPGMulti("movespeed"));
            else
                movespeed += (0.1 * getRPGMulti("movespeed"));
        }
    }
    
    mach2 = 100;
    momemtum = 1;
    move = input_check("right") - input_check("left");
    move2 = input_check_pressed("right") + input_check_pressed("left");
    
    if (fightball == 1 && global.coop == true)
    {
        if (object_index == obj_player1)
        {
            x = obj_player2.x;
            y = obj_player2.y;
        }
        
        if (object_index == obj_player2)
        {
            x = obj_player1.x;
            y = obj_player1.y;
        }
    }
    
    if (sprite_index == spr_crazyrun)
    {
        if (flamecloud_buffer > 0)
        {
            flamecloud_buffer--;
        }
        else
        {
            flamecloud_buffer = 10;
            
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale;
                sprite_index = spr_flamecloud;
            }
        }
    }
    
    crouchslideAnim = 1;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0)
        jumpstop = 0;
    
    if (input_buffer_jump < 8 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
    {
        event_play_oneshot("event:/SFX/bo/jump", x, y);
        
        if (sprite_index != spr_fightball)
        {
            image_index = 0;
            sprite_index = spr_mach3jump;
        }
        
        if (character == "P")
            vsp = -11 * getRPGMulti("jump");
        else
            vsp = -13 * getRPGMulti("jump");
    }
    
    if (fightball == 0)
    {
        if (sprite_index == spr_grindjump || sprite_index == spr_grindfall)
        {
            if (animation_end() && sprite_index == spr_grindjump)
                sprite_index = spr_grindfall;
            
            if (grounded && vsp > 0)
                sprite_index = spr_mach4;
        }
        
        if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
            sprite_index = spr_mach4;
        
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
            sprite_index = spr_mach4;
        
        if (sprite_index == spr_mach2jump && grounded && vsp > 0)
            sprite_index = spr_mach4;
        
        if (sprite_index == spr_player_Sjumpcancel && grounded && vsp > 0)
            sprite_index = spr_mach4;
        
        if (movespeed > (16 * getRPGMulti("movespeed")) && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
        {
            mach4mode = 1;
            flash = 1;
            sprite_index = spr_crazyrun;
            
            with (create_debris(x, y, spr_slapstar))
            {
                hsp = random_range(-5, 5);
                vsp = random_range(-10, 10);
            }
        }
        else if (movespeed <= (16 * getRPGMulti("movespeed")) && sprite_index == spr_crazyrun)
        {
            sprite_index = spr_mach4;
        }
    }
    
    if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
    {
        with (instance_create(x, y, obj_crazyrunothereffect))
        {
            playerid = other.object_index;
            other.crazyruneffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
        image_speed = 0.4;
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if ((!input_check("attack") && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded && (character == "P" || character == "N")) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
    {
        sprite_index = spr_machslidestart;
        event_play_oneshot("event:/SFX/bo/break", x, y);
        state = states.machslide;
        image_index = 0;
        launched = 0;
    }
    
    if (move == -xscale && grounded && !launched && (character == "P" || character == "N") && fightball == 0 && sprite_index != spr_dashpadmach)
    {
        event_play_oneshot("event:/SFX/bo/machslideboost", x, y);
        sprite_index = spr_mach3boost;
        state = states.machslide;
        image_index = 0;
    }
    
    if (input_check("down") && fightball == 0)
    {
        particle_set_scale(particle.jumpdust, xscale, 1);
        create_particle(x, y, particle.jumpdust, 0);
        flash = 0;
        state = states.tumble;
        image_index = 0;
        vsp = 10;
        
        if (!grounded || place_meeting(x, y + 1, obj_water))
        {
            sprite_index = spr_dive;
            fmod_event_play(dive_snd);
        }
        else
        {
            sprite_index = spr_player_backslideland;
        }
    }
    
    if ((!grounded || slopeCheck(x + xscale, y)) && place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
        wallspeed = movespeed;
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            wallspeed -= vsp;
        
        state = states.climbwall;
    }
    else if (place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock) && !place_meeting(x + xscale, y, obj_mach3solid))
    {
        var _ledge = slope_check_up(x + xscale, y, (vsp >= 0) ? 32 : 22);
        
        if (_ledge > 0)
        {
            y -= _ledge;
        }
        else
        {
            with (obj_camera)
            {
                shake_mag = 20;
                shake_mag_acc = 40 / room_speed;
            }
            
            with (obj_baddie)
            {
                if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                {
                    stun = 1;
                    alarm[0] = 200;
                    ministun = 0;
                    vsp = -5;
                    hsp = 0;
                }
            }
            
            if (!fightball)
            {
                sprite_index = spr_hitwall;
                event_play_oneshot("event:/SFX/bo/groundpound", x, y);
                event_play_oneshot("event:/SFX/bo/bumpwall", x, y);
                hsp = 0;
                flash = 0;
                state = states.bump;
                hsp = -6 * xscale;
                vsp = -6;
                mach2 = 0;
                image_index = 0;
                instance_create(x + 10, y + 10, obj_bumpeffect);
            }
        }
    }
    
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
        
        if (movespeed < (5 * getRPGMulti("movespeed")))
            movespeed = 5 * getRPGMulti("movespeed");
        
        image_index = 0;
        flash = 1;
    }
    else if ((input_check_pressed("slap") || input_buffer_slap < 8) && input_check("up"))
    {
        state = states.punch;
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
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting_platform(x, y + 1, obj_waterTop))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting_platform(x, y + 1, obj_waterTop) && !place_meeting_solid(x, y + 1) && !place_meeting_slope(x, y + 1))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale;
            sprite_index = spr_watereffect;
            
            with (obj_secretportal)
            {
                if (secret)
                {
                    other.secret = true;
                    other.image_blend = #0043FF;
                }
            }
            
            other.dashcloudid = id;
        }
    }
    
    scr_dotaunt();
    
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else
        image_speed = 0.4;
    
    if (scr_checksuperjump() && fightball == 0 && character == "P" && grounded && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
    {
        sprite_index = spr_superjumpprep;
        state = states.Sjumpprep;
        hsp = 0;
        image_index = 0;
    }
    
    if (global.attackstyle == 2 && input_check_pressed("slap"))
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
        image_index = 0;
        state = states.lungeattack;
    }
    
    exit;
}
