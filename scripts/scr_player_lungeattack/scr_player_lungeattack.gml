function state_player_lungeattack()
{
    vsp = 0;
    move = input_check("right") - input_check("left");
    
    if (sprite_index != spr_null)
    {
        image_speed = 0.35;
        hsp = xscale * movespeed;
        
        if (hit_connected)
        {
            movespeed = max(6, movespeed);
            movespeed += 0.08;
        }
    }
    else
    {
        image_speed = 0.35;
        movespeed = approach(movespeed, 0, 0.1);
    }
    
    if (input_check_pressed("slap"))
        input_attack_buffer = 30;
    
    if (hit_connected && input_attack_buffer > 0 && input_finisher_buffer <= 0)
        input_attack_buffer = 30;
    
    if (floor(image_index) > (image_number - 6) && !hit_connected)
    {
        if (state != 80 && input_attack_buffer > 0)
        {
            ds_list_clear(hitlist);
            hit_connected = 0;
            uplaunch = 0;
            downlaunch = 0;
            
            if (input_attack_buffer > 0)
            {
                if (finisher)
                    finisher_buffer += 15;
                
                input_attack_buffer = 0;
                state = 43;
                sprite_index = spr_null;
                image_index = 0;
            }
        }
    }
    
    vsp = 0;
    
    if (lunge_hits >= 3 && finisher == 0)
        finisher = 1;
    
    if (finisher && blur_effect == 0)
    {
        flash = 1;
        instance_create(x + random_range(-12, 12), y + random_range(-12, 12), obj_parryeffect);
        create_particle(x, y, 14, 0);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_null)
        {
            sprite_index = spr_null;
            image_index = 0;
            state = 80;
        }
        else
        {
            state = 0;
            ds_list_clear(hitlist);
            hit_connected = 0;
        }
    }
    
    if (floor(image_index) > (image_number - 6) && hit_connected)
    {
        if (finisher)
            DoFinisher();
        
        if (state != 80 && input_attack_buffer > 0)
        {
            ds_list_clear(hitlist);
            hit_connected = 0;
            uplaunch = 0;
            downlaunch = 0;
            
            if (input_attack_buffer > 0)
            {
                if (finisher)
                    finisher_buffer += 15;
                
                input_attack_buffer = 0;
                state = 43;
                sprite_index = spr_null;
                image_index = 0;
            }
        }
    }
    
    if (!instance_exists(lungeattackID))
    {
        with (instance_create(x, y, obj_lungehitbox))
        {
            playerid = other.id;
            other.lungeattackID = id;
        }
    }
    
    exit;
}

function randomize_animations(argument0)
{
    if (ds_list_size(animlist) >= array_length(argument0))
        ds_list_clear(animlist);
    
    sprite_index = argument0[irandom(array_length(argument0) - 1)];
    
    while (ds_list_find_index(animlist, sprite_index) != -1)
        sprite_index = argument0[irandom(array_length(argument0) - 1)];
    
    ds_list_add(animlist, sprite_index);
    exit;
}

function DoFinisher()
{
    ds_list_clear(hitlist);
    input_finisher_buffer = 0;
    input_up_buffer = 0;
    input_down_buffer = 0;
    hit_connected = 0;
    
    if (input_check("up"))
    {
        state = 80;
        image_index = 0;
        sprite_index = spr_breakdanceuppercut;
        
        if (chance(75))
            fmod_event_play(obj_player1.voice_uppercut);
        
        vsp = grounded ? -15 : -11;
        movespeed = hsp;
        particle_set_scale(4, xscale, 1);
        create_particle(x, y, 4, 0);
        lunge_hits = 0;
        finisher = 0;
    }
    else if (move == xscale)
    {
        state = 80;
        sprite_index = spr_player_breakdance;
        image_index = 1 + move;
        movespeed = 14;
        
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale;
        
        particle_set_scale(2, xscale, 1);
        create_particle(x, y, 2, 0);
        lunge_hits = 0;
        finisher = 0;
    }
    else if (input_check("down"))
    {
        sprite_index = spr_player_breakdancesmash;
        image_index = 0;
        machhitAnim = 0;
        state = 80;
        movespeed = 0;
        vsp = 15;
        lunge_hits = 0;
        finisher = 0;
        
        with (obj_baddie)
        {
            if (distance_to_object(other) < 128 && state != 137 && state != 4 && state != 138 && parryable && !(state == 138 && thrown == 1))
            {
                obj_player1.xscale = -image_xscale;
                grabbedby = 1;
                hitLag = 5;
                hitX = x;
                hitY = y;
                
                if (!important)
                {
                    global.combotime = 60;
                    global.heattime = 60;
                }
                
                obj_player1.hitLag = 5;
                obj_player1.hitX = obj_player1.x;
                obj_player1.hitY = obj_player1.y;
                mach3destroy = 1;
                alarm[3] = 1;
                state = 137;
                image_xscale = -obj_player1.xscale;
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
                
                stunned = 100;
                other.hithsp = -other.image_xscale * 6;
                other.hsp = -other.image_xscale * 6;
                
                if (!other.grounded)
                {
                    other.vsp = -6;
                    other.hitvsp = -6;
                }
            }
        }
        
        exit;
    }
}
