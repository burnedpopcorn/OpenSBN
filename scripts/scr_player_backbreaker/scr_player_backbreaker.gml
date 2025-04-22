function state_player_backbreaker()
{
    mach2 = 0;
    
    if (sprite_index != spr_null)
    {
        hsp = 0;
        movespeed = 0;
    }
    else
    {
        hsp = xscale * movespeed;
    }
    
    move = input_check_pressed("right") + input_check_pressed("left");
    landAnim = 0;
    
    if (sprite_index == spr_null && place_meeting(x, y + 1, obj_solid))
    {
        state = states.machslide;
        sprite_index = spr_null;
    }
    
    if (sprite_index == spr_taunt || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
    {
        if (!instance_exists(parry_inst) && taunttimer > parry_max)
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
        
        if (taunttimer < taunt_to_parry_max)
        {
            if (instance_exists(parry_inst))
            {
                instance_destroy(parry_inst);
                parry_inst = -4;
            }
        }
        
        if (supercharged == 1 && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4) && !instance_exists(obj_tauntaftereffectspawner))
        {
            in_supertaunt = true;
            instance_create(x, y, obj_tauntaftereffectspawner);
            var c = 0;
            var lag = 20;
            
            with (obj_baddie)
            {
                if (point_in_camera(x, y, view_camera[0]) && state != UnknownEnum.Value_268)
                {
                    hp = -99;
                    state = enemystates.hit;
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    
                    if (destroyable)
                        c++;
                    
                    instance_create(x, y, obj_parryeffect);
                    alarm[3] = 3;
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
                }
            }
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            supercharge = 0;
            supercharged = 0;
        }
        
        taunttimer--;
        vsp = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4))
    {
        movespeed = tauntstoredmovespeed;
        vsp = tauntstoredvsp;
        sprite_index = tauntstoredsprite;
        in_supertaunt = false;
        state = tauntstoredstate;
        supercharge = 0;
        supercharged = 0;
        
        if (instance_exists(parry_inst))
        {
            instance_destroy(parry_inst);
            parry_inst = -4;
        }
        
        if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
            scr_change_farmers();
    }
    
    if (sprite_index == spr_taunt)
    {
        if (supercharged && input_check("up") && taunttimer >= 5)
        {
            taunttimer = 20;
            image_index = 0;
            event_play_oneshot("event:/SFX/bo/supertaunt", x, y);
            in_supertaunt = true;
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
        }
        else if (taunttimer <= 0)
        {
            movespeed = tauntstoredmovespeed;
            vsp = tauntstoredvsp;
            sprite_index = tauntstoredsprite;
            state = tauntstoredstate;
            
            if (instance_exists(parry_inst))
            {
                instance_destroy(parry_inst);
                parry_inst = -4;
            }
            
            if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
                scr_change_farmers();
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_null)
        state = states.normal;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
        state = states.normal;
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_null || sprite_index == spr_playerN_victory))
        state = states.normal;
    
    image_speed = 0.4;
    exit;
}
