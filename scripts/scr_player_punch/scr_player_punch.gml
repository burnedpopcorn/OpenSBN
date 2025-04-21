function state_player_punch()
{
    if (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend)
    {
        move = input_check("right") - input_check("left");
        landAnim = 1;
        jumpstop = 0;
        image_speed = 0.4;
        hsp = movespeed;
        movespeed = approach(movespeed, move * 4 * getRPGMulti("attack"), 0.5 * getRPGMulti("attack"));
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_breakdanceuppercut)
            sprite_index = spr_breakdanceuppercutend;
        
        if (grounded && vsp > 0 && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp);
                xscale = dir;
            }
            
            movespeed = abs(movespeed);
            state = states.normal;
        }
        
        if (punch_afterimage > 0)
        {
            punch_afterimage--;
        }
        else
        {
            punch_afterimage = 5;
            create_spink_afterimage(x, y, sprite_index, image_index, xscale * scale_xs, image_yscale);
        }
        
        if (input_check_pressed("slap"))
        {
            if (move != 0)
                xscale = move;
            
            jumpstop = 1;
            vsp = -4 * getRPGMulti("jump");
            flash = 1;
            movespeed = clamp(movespeed, 10 * getRPGMulti("movespeed"), 12 * getRPGMulti("movespeed"));
            crouchslipbuffer = 25;
            image_index = 0;
            sprite_index = spr_playerN_jetpackboost;
            state = states.tumble;
            event_play_oneshot("event:/SFX/bo/superjumpcancel", x, y);
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale;
        }
    }
    else
    {
        move = input_check("right") - input_check("left");
        landAnim = 1;
        jumpstop = 0;
        image_speed = 0.4;
        
        if (breakdance > 0)
            breakdance--;
        
        if (move != 0)
        {
            if (move != xscale && movespeed > (-6 * getRPGMulti("movespeed")))
            {
                if (sprite_index != spr_player_kungfujump)
                    movespeed -= 1;
                else
                    movespeed -= 0.2;
            }
            else if (move == xscale && movespeed < (6 * getRPGMulti("movespeed")))
            {
                if (sprite_index != spr_player_kungfujump)
                    movespeed += 1;
                else
                    movespeed += 0.2;
            }
        }
        
        hsp = xscale * movespeed;
        var _kungfuground = sprite_index == spr_kungfu1 || sprite_index == spr_kungfu2 || sprite_index == spr_kungfu3 || sprite_index == spr_shotgunsuplexdash;
        var _Sjumpcancel = sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelland || sprite_index == spr_player_Sjumpcancelslide;
        
        if (_kungfuground && image_index > 7 && !input_check("attack") && movespeed > 0)
            movespeed -= 0.5;
        
        if (floor(image_index) == (image_number - 1))
        {
            switch (sprite_index)
            {
                case spr_kungfu1:
                case spr_kungfu2:
                case spr_kungfu3:
                case spr_shotgunsuplexdash:
                    state = states.normal;
                    movespeed = abs(hsp);
                    
                    if (movespeed < (6 * getRPGMulti("movespeed")))
                        movespeed = 6 * getRPGMulti("movespeed");
                    
                    if (input_check("attack") && move != -xscale)
                        state = states.mach2;
                    
                    break;
                
                case spr_kungfuair1transition:
                    sprite_index = spr_kungfuair1;
                    break;
                
                case spr_kungfuair2transition:
                    sprite_index = spr_kungfuair2;
                    break;
                
                case spr_kungfuair3transition:
                    sprite_index = spr_kungfuair3;
                    break;
                
                case spr_player_Sjumpcancelland:
                    sprite_index = spr_player_Sjumpcancelslide;
                    break;
            }
        }
        
        if (!_kungfuground && !_Sjumpcancel)
        {
            if (grounded && vsp >= 0)
            {
                state = states.normal;
                movespeed = abs(hsp);
                
                if (movespeed < (6 * getRPGMulti("movespeed")))
                    movespeed = 6 * getRPGMulti("movespeed");
                
                if (input_check("attack") && move != -xscale)
                    state = states.mach2;
            }
        }
        
        if (_Sjumpcancel)
        {
            if (grounded && vsp > 0)
            {
                if (sprite_index == spr_player_Sjumpcancel)
                {
                    sprite_index = spr_player_Sjumpcancelland;
                    image_index = 0;
                }
                
                if (input_check("attack"))
                {
                    if (movespeed >= (12 * getRPGMulti("movespeed")))
                        state = states.mach3;
                    else
                        state = states.mach2;
                    
                    sprite_index = spr_rollgetup;
                    image_index = 0;
                }
                else if (movespeed > (6 * getRPGMulti("movespeed")))
                {
                    state = states.machslide;
                    sprite_index = spr_machslidestart;
                    image_index = 0;
                }
                else
                {
                    state = states.normal;
                }
            }
            
            if (sprite_index == spr_player_Sjumpcancelslide)
                image_speed = abs(movespeed) / 15;
        }
        
        if (sprite_index != spr_player_kungfujump && place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_slope))
        {
            vsp = -4 * getRPGMulti("jump");
            sprite_index = spr_player_kungfujump;
            image_index = 0;
            state = states.punch;
            movespeed = -6 * getRPGMulti("attack");
        }
        
        if (punch_afterimage > 0)
        {
            punch_afterimage--;
        }
        else
        {
            punch_afterimage = 5;
            create_spink_afterimage(x, y, sprite_index, image_index, xscale * scale_xs, image_yscale);
        }
        
        if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale;
        }
    }
    
    exit;
}
