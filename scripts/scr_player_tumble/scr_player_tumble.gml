function state_player_tumble()
{
    if (place_meeting(x, y + 1, obj_railparent))
    {
        var _railinst = instance_place(x, y + 1, obj_railparent);
        railmovespeed = _railinst.movespeed;
        raildir = _railinst.dir;
    }
    
    hsp = (xscale * movespeed) + (railmovespeed * raildir);
    move = input_check("right") - input_check("left");
    mask_index = spr_crouchmask;
    
    if (sprite_index == spr_tumblestart)
        movespeed = 6 * getRPGMulti("movespeed");
    
    if (grounded && sprite_index == spr_dive)
    {
        sprite_index = spr_player_backslide;
        image_index = 0;
    }
    
    if (!grounded && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_player_Sjumpcancelslide || (input_check_pressed("down") && sprite_index == spr_playerN_jetpackboost) || sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_player_backslide || sprite_index == spr_player_backslideland || sprite_index == spr_player_backslide))
    {
        vsp = 10;
        sprite_index = spr_dive;
        fmod_event_play(dive_snd);
    }
    
    if (sprite_index == spr_dive && input_check_pressed("jump"))
    {
        sprite_index = spr_player_bombstart;
        image_index = 0;
        state = states.freefall;
        vsp = -6 * getRPGMulti("jump");
    }
    
    if (movespeed <= 2 && sprite_index != spr_player_breakdance)
        state = states.normal;
    
    if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11;
    
    if (sprite_index == spr_mach2jump && grounded)
    {
        image_index = 0;
        sprite_index = spr_player_backslideland;
    }
    
    if (sprite_index == spr_player_mach2jump && grounded)
    {
        image_index = 0;
        sprite_index = spr_player_backslideland;
    }
    
    if (sprite_index == spr_crouchslip && !grounded)
        sprite_index = spr_crouchslipFall;
    
    if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_Sjumpcancelslide;
    
    if ((sprite_index == spr_crouchslipFall || sprite_index == spr_playerN_jetpackboost) && grounded)
        sprite_index = spr_crouchslip;
    
    if (sprite_index == spr_player_backslide && !grounded)
        sprite_index = spr_player_mach2jump;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_backslideland)
        sprite_index = spr_player_backslide;
    
    if (sprite_index == spr_player_Sjumpcancel && grounded)
        sprite_index = spr_player_Sjumpcancelland;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
        sprite_index = spr_player_Sjumpcancelslide;
    
    if ((floor(image_index) == 2 || floor(image_index == 4)) && sprite_index == spr_player_breakdance)
    {
        create_particle(x, y, particle.breakdance, 0);
        movespeed = 12 * getRPGMulti("movespeed");
        sprite_index = spr_breakdancesuper;
    }
    
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble;
        movespeed = 14 * getRPGMulti("movespeed");
    }
    
    if (input_check_pressed("jump"))
        input_buffer_jump = 0;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0 && !place_meeting(x, y, obj_bigcheese))
        jumpstop = 0;
    
    if (input_buffer_jump < 8 && can_jump && hsp != 0 && sprite_index == spr_tumble)
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale;
        
        vsp = -11 * getRPGMulti("jump");
        image_index = 0;
    }
    
    if (crouchslipbuffer > 0)
        crouchslipbuffer--;
    
    if (!input_check("down") && input_check("attack") && grounded && sprite_index != spr_tumble && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            if (movespeed >= (12 * getRPGMulti("movespeed")))
                state = states.mach3;
            else
                state = states.mach2;
            
            image_index = 0;
            sprite_index = spr_rollgetup;
            fmod_event_play(rollgetup_snd);
        }
    }
    
    if (!input_check("down") && !input_check("attack") && grounded && sprite_index != spr_tumble && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > (6 * getRPGMulti("movespeed")))
            {
                state = states.machslide;
                sprite_index = spr_machslidestart;
                image_index = 0;
                event_play_oneshot("event:/SFX/bo/break", x, y);
            }
            else
            {
                state = states.normal;
            }
        }
    }
    
    if (((place_meeting(x + xscale, y, obj_solid) || scr_solid_slope(x + xscale, y)) && !place_meeting(x + hsp, y, obj_rollblock) && (!place_meeting(x + hsp, y, obj_rattumble) || sprite_index != spr_tumble) && !place_meeting(x + hsp, y, obj_destructibles)) || place_meeting(x, y, obj_timedgate))
    {
        var _ledge = slope_check_up(x + xscale, y, (vsp >= 0) ? 9 : 16);
        
        if (_ledge > 0)
        {
            y -= _ledge;
        }
        else
        {
            state = states.bump;
            image_index = 0;
            sprite_index = spr_player_wallsplat;
            event_play_oneshot("event:/SFX/bo/splat", x, y);
        }
    }
    
    if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_player_backslide || sprite_index == spr_player_mach2jump)
        image_speed = abs(movespeed) / 15;
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
        image_speed = 0;
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
        image_speed = 0;
    else
        image_speed = 0.35;
    
    if (!instance_exists(dashcloudid) && grounded && sprite_index != spr_player_breakdance)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    exit;
}
