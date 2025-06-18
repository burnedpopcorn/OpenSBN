if (room == rm_blank)
    exit;

switch (state)
{
    case states.idle:
    case states.stun:
        scr_enemy_idle();
        break;
    
    case states.charge:
        scr_enemy_charge();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        scr_enemy_walk();
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.pizzagoblinthrow:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
    
    case states.pummel:
        scr_enemy_pummel();
        break;
    
    case states.staggered:
        scr_enemy_staggered();
        break;
    
    case states.rage:
        scr_enemy_rage();
        break;
    
    case states.ghostpossess:
        scr_enemy_ghostpossess();
        break;
    
    case states.backbreaker:
        scr_enemy_taunt();
        break;
}

if (state == states.walk)
{
    image_speed = 0.2;
    
    if (!place_meeting_collision(x + (2 * hsp), y + 8, Exclude.PLATFORMS))
    {
        var _noSolid = true;
        var _collist = ds_list_create();
        instance_place_list(x + (2 * hsp), y + 8, obj_platform, _collist, false);
        
        for (var i = 0; i < ds_list_size(_collist); i++)
        {
            var _col = ds_list_find_value(_collist, i);
            
            if (_col.object_index != obj_water && _col.object_index != obj_waterTop && _col.object_index != obj_waterCurrent)
                _noSolid = false;
        }
        
        if (_noSolid)
        {
            idlebuffer = irandom_range(200, 600);
            sprite_index = idlespr;
            image_xscale *= -1;
            image_index = 0;
            state = states.idle;
            event_play_oneshot("event:/SFX/voice/baby", x, y);
        }
    }
    
    if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1))
        create_particle(x - (2 * hsp), y + 43, particle.cloudeffect, 0);
    
    if (idlebuffer > 0)
    {
        idlebuffer--;
    }
    else if (!place_meeting(x, y + 1, obj_slope))
    {
        idlebuffer = irandom_range(200, 600);
        sprite_index = idlespr;
        image_index = 0;
        state = states.idle;
        event_play_oneshot("event:/SFX/voice/baby", x, y);
    }
}

with (obj_player1)
{
    var baddie = other.id;
    
    if (state == states.backbreaker && baddie.state != states.backbreaker)
    {
        event_play_oneshot("event:/SFX/voice/baby", baddie.x, baddie.y);
        baddie.storedstate = baddie.state;
        baddie.storedspr = baddie.sprite_index;
        baddie.state = states.backbreaker;
        baddie.taunttimer = taunttimer;
        
        with (instance_create(baddie.x, baddie.y, obj_baddietaunteffect))
            baddieID = baddie;
    }
}
