function state_player_handstandjump()
{
    landAnim = 0;
    hsp = xscale * movespeed;
    move = input_check("right") - input_check("left");
    momemtum = 1;
    dir = xscale;
    
    if (global.attackstyle == 2)
    {
        if (!instance_exists(lungeattackID))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id;
                other.lungeattackID = id;
            }
        }
        
        if (sprite_index == spr_suplexdash || sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart)
            sprite_index = spr_null;
    }
    
    if (global.attackstyle != 3)
    {
        if (movespeed < (10 * getRPGMulti("movespeed")))
        {
            if ((sprite_index == spr_null || sprite_index == spr_null) && movespeed < 8)
                movespeed += (0.25 * getRPGMulti("movespeed"));
            else if (sprite_index == spr_null && movespeed < (12 * getRPGMulti("movespeed")))
                movespeed += (0.8 * getRPGMulti("movespeed"));
            else if (movespeed < (10 * getRPGMulti("movespeed")))
                movespeed += (0.5 * getRPGMulti("movespeed"));
        }
    }
    else
    {
        if (movespeed < (10 * getRPGMulti("movespeed")))
        {
            if (sprite_index == spr_null && movespeed < (8 * getRPGMulti("movespeed")))
                movespeed += (0.25 * getRPGMulti("movespeed"));
            else if (movespeed < (10 * getRPGMulti("movespeed")))
                movespeed += (0.5 * getRPGMulti("movespeed"));
        }
        
        if (global.pummeltest && !instance_exists(lungeattackID))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id;
                other.lungeattackID = id;
            }
        }
    }
    
    var attackdash;
    
    if (shoot == 1)
        attackdash = spr_null;
    else
        attackdash = (global.attackstyle == 1) ? spr_null : spr_suplexdash;
    
    if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
        sprite_index = spr_null;
    
    var airattackdash = (global.attackstyle == 1) ? spr_null : spr_suplexdashjump;
    var airattackdashstart = (global.attackstyle == 1) ? spr_null : spr_suplexdashjumpstart;
    
    if (global.attackstyle == 2)
        vsp = 0;
    
    if (!input_check("jump") && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if ((input_check_pressed("jump") && grounded && !input_check("down")) || (global.attackstyle == 2 && sprite_index == spr_null && floor(image_index) >= (image_number - 1)))
    {
        jumpstop = 0;
        image_index = 0;
        
        if (global.attackstyle != 2)
            vsp = -11 * getRPGMulti("jump");
        
        if (global.attackstyle == 1)
        {
            sprite_index = airattackdashstart;
        }
        else
        {
            state = states.mach2;
            sprite_index = spr_player_longjump;
        }
        
        fmod_event_play(rollgetup_snd);
    }
    
    if (sprite_index == attackdash && !grounded)
    {
        image_index = 0;
        sprite_index = airattackdashstart;
    }
    
    if (grounded && sprite_index == airattackdash && (!input_check("attack") || character == "N") && global.attackstyle != 2)
    {
        if (global.attackstyle != 3)
        {
            state = states.normal;
            
            if (move != xscale)
                movespeed = 2 * getRPGMulti("movespeed");
        }
        else
        {
            sprite_index = attackdash;
            image_index = image_number - 6;
        }
    }
    
    if (grounded && sprite_index == airattackdash && input_check("attack") && character != "N" && global.attackstyle != 2)
        state = states.mach2;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
        state = states.normal;
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == airattackdashstart || sprite_index == spr_null))
        sprite_index = airattackdash;
    
    if (floor(image_index) == (image_number - 1) && input_check("attack") && sprite_index == attackdash)
    {
        image_speed = 0.35;
        state = states.mach2;
        grav = 0.5;
    }
    
    if (input_check("down") && (grounded || global.attackstyle == 2))
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        
        movespeed = 12 * getRPGMulti("attack");
        crouchslipbuffer = 25;
        grav = 0.5;
        sprite_index = spr_player_Sjumpcancelland;
        fmod_event_play(crouchslide_snd);
        image_index = 0;
        machhitAnim = 0;
        state = states.tumble;
    }
    
    mask_index = spr_player_mask;
    
    if ((!grounded || slopeCheck(x + xscale, y)) && place_meeting_collision(x + xscale, y, Exclude.SLOPES) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        grabclimbbuffer = 10;
        wallspeed = 6 * getRPGMulti("movespeed");
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            wallspeed -= vsp;
        
        state = states.climbwall;
    }
    else if ((grounded || !input_check("attack")) && place_meeting_collision(x + xscale, y, Exclude.SLOPES) && !place_meeting(x + xscale, y, obj_destructibles))
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
            event_play_oneshot("event:/SFX/bo/splat", x, y);
            instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
        }
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
    
    if (state != states.bump && move != xscale && move != 0)
    {
        event_play_oneshot("event:/SFX/bo/grabcancel", x, y);
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
            movespeed = 2 * getRPGMulti("movespeed");
            grav = 0.5;
        }
    }
    
    exit;
}
