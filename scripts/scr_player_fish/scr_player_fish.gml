function state_player_fishswim()
{
    fishlandtimer = 600;
    goesDownSlopes = false;
    sprite_index = spr_player_fish_idle;
    move_h = input_check("right") - input_check("left");
    move_v = input_check("down") - input_check("up");
    
    if (move_h != 0)
    {
        sprite_index = spr_player_fishmoveforward;
        
        if (move_v != 0)
            sprite_index = (sign(move_v) == -1) ? spr_player_fishmoveupforward : spr_player_fishmovedownforward;
    }
    else if (move_v != 0)
    {
        sprite_index = (sign(move_v) == -1) ? spr_player_fishmoveupwards : spr_player_fishmovedown;
    }
    
    var maxspeed = 7 * getRPGMulti("swimming");
    var hspaccel = 0.85 * getRPGMulti("swimming");
    var vspaccel = 0.85 * getRPGMulti("swimming");
    
    if (hsp != 0)
        xscale = sign(hsp);
    
    movespeed = approach(movespeed, move_h * maxspeed, hspaccel);
    hsp = movespeed;
    vsp = approach(vsp, move_v * maxspeed, vspaccel);
    var watertopcheck = (vsp < 0) ? -36 : 0;
    
    if (!place_meeting(x, y + vsp + watertopcheck, obj_water) && vsp < 0)
    {
        y += vsp;
        
        while (!place_meeting(x, y + watertopcheck, obj_water) && y < (y + maxspeed))
            y++;
        
        vsp = 0;
    }
    
    if (!place_meeting(x, y, obj_water))
    {
        state = states.fishground;
        jumpstop = false;
    }
    
    if (input_check_pressed("slap"))
    {
        fmod_event_play(fishDashsnd);
        state = states.fishdash;
        movespeed = 15 * getRPGMulti("attack");
        fishDir = (xscale >= 1) ? 0 : 180;
        
        if (move_h != 0 || move_v != 0)
            fishDir = point_direction(0, 0, move_h, move_v);
        
        var target_xscale = sign(lengthdir_x(1, fishDir));
        xscale = (target_xscale != 0) ? target_xscale : xscale;
        sprite_index = spr_player_fish_dash;
        
        if (!place_meeting(x, y, obj_water))
            sprite_index = spr_player_fish_dashAir;
        
        image_index = 0;
    }
    
    image_speed = 0.35;
    exit;
}

function state_player_fishdash()
{
    fishlandtimer = 600;
    goesDownSlopes = false;
    move_h = input_check("right") - input_check("left");
    move_v = input_check("down") - input_check("up");
    
    if (sign(hsp) != 0)
        xscale = sign(hsp);
    
    movespeed = approach(movespeed, 15 * getRPGMulti("attack"), 0.85 * getRPGMulti("attack"));
    var hdir = lengthdir_x(movespeed, fishDir);
    var vdir = lengthdir_y(movespeed, fishDir);
    hsp = hdir;
    vsp = vdir + grav;
    var bumped = 0;
    
    if (place_meeting_collision(x + sign(hdir), y, Exclude.SLOPES) && !place_meeting(x + sign(hdir), y, obj_destructibles))
    {
        var _ledge = 0;
        _ledge -= slope_check_up(x + sign(hdir), y, 9);
        _ledge += slope_check_down(x + sign(hdir), y, 9);
        
        if (_ledge != 0)
            y += _ledge;
    }
    
    if (place_meeting_collision(x, y + sign(vdir), Exclude.SLOPES) && !place_meeting(x, y + sign(vdir), obj_destructibles))
    {
        var _ledge = 0;
        _ledge -= slope_check_left(x, y + sign(vdir), 9);
        _ledge += slope_check_right(x, y + sign(vdir), 9);
        
        if (_ledge != 0)
            x += _ledge;
    }
    
    if (place_meeting(x, y, obj_water))
    {
        sprite_index = spr_player_fish_dash;
        
        if (chance(15))
        {
            with (instance_create(x + random_range(-9, 9), y + random_range(-9, 9), obj_waterBubble))
                alarm[0] = random_range(1, 250);
        }
        
        vsp -= grav;
        var target_angle = fishDir;
        
        if (move_h != 0 || move_v != 0)
            target_angle = point_direction(0, 0, move_h, move_v);
        
        if (abs(angle_difference(fishDir, target_angle)) <= 90)
        {
            fishDir = angle_rotate(fishDir, target_angle, 1.5);
        }
        else
        {
            state = states.fishswim;
            movespeed = hsp / 2;
            vsp /= 2;
            var target_xscale = sign(lengthdir_x(1, fishDir));
            xscale = (target_xscale != 0) ? target_xscale : xscale;
        }
        
        if (animation_end())
        {
            state = states.fishswim;
            movespeed = hsp;
            var target_xscale = sign(lengthdir_x(1, fishDir));
            xscale = (target_xscale != 0) ? target_xscale : xscale;
        }
    }
    else
    {
        sprite_index = spr_player_fish_dashAir;
        hsp += (move_h * 3);
        
        if (animation_end() || grounded)
        {
            movespeed = hsp;
            sprite_index = spr_player_fish_flop;
            state = states.fishground;
            jumpstop = true;
        }
    }
    
    image_speed = 0.4;
    exit;
}

function state_player_fishground()
{
    if (fishlandtimer > 0)
    {
        fishlandtimer--;
    }
    else
    {
        fishlandtimer = 600;
        mail_trigger(mailtriggers.fishoutofwater);
    }
    
    goesDownSlopes = false;
    
    if (!grounded)
        sprite_index = spr_player_fish_fall;
    else
        sprite_index = spr_player_fish_flop;
    
    move_h = input_check("right") - input_check("left");
    
    if (move_h != 0)
    {
        xscale = move_h;
        movespeed = approach(movespeed, move_h * 5 * getRPGMulti("movespeed"), 0.5 * getRPGMulti("movespeed"));
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.25);
    }
    
    hsp = movespeed;
    
    if (place_meeting(x, y, obj_water))
    {
        state = states.fishswim;
        fishlandtimer = 600;
    }
    
    image_speed = 0.35;
    exit;
}

function state_player_fishhurt()
{
    fishlandtimer = 600;
    goesDownSlopes = false;
    
    if (sprite_index != spr_player_fish_bump)
    {
        sprite_index = spr_player_fish_hurt;
        hurted = true;
        alarm[5] = 2;
        alarm[7] = 80;
        hsp = -xscale * movespeed;
        
        if (place_meeting(x, y, obj_water))
        {
            if (vsp >= 0)
                state = states.fishswim;
        }
    }
    else
    {
        hsp = -xscale * movespeed;
        movespeed = approach(movespeed, 0, 0.35);
        
        if (movespeed <= 0 && place_meeting(x, y, obj_water))
        {
            if (vsp >= 0)
                state = states.fishswim;
        }
    }
    
    if (!place_meeting(x, y, obj_water) && grounded && vsp > 0)
    {
        movespeed = 0;
        state = states.fishground;
    }
    
    if (scr_solid(x + hsp, y))
        movespeed = 0;
    
    image_speed = 0.35;
    exit;
}
