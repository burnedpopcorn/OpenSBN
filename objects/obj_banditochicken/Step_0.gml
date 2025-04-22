if (room == rm_blank)
    exit;

switch (state)
{
    case enemystates.idle:
        scr_enemy_idle();
        break;
    
    case enemystates.turn:
        scr_enemy_turn();
        break;
    
    case enemystates.walk:
        scr_enemy_walk();
        break;
    
    case enemystates.land:
        scr_enemy_land();
        break;
    
    case enemystates.hit:
        scr_enemy_hit();
        break;
    
    case enemystates.stun:
        scr_enemy_stun();
        break;
    
    case enemystates.pthrow:
        scr_pizzagoblin_throw();
        break;
    
    case enemystates.grabbed:
        scr_enemy_grabbed();
        break;
    
    case enemystates.charge:
        scr_enemy_charge();
        break;
}

if (state == enemystates.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != enemystates.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 160) && y >= (targetplayer.y - 160))
{
    if (state == enemystates.walk || state == enemystates.idle)
        activated = 1;
}

if (!activated && (state == enemystates.walk || state == enemystates.idle))
    sprite_index = spr_banditochicken_sleep;

if ((state == enemystates.walk || state == enemystates.idle) && activated == 1 && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
    movespeed = 0;
    image_xscale = -sign(x - targetplayer.x);
    image_index = 0;
    sprite_index = spr_banditochicken_wake;
}

if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
    image_xscale *= -1;
    sprite_index = spr_banditochicken_chase;
    state = enemystates.charge;
    movespeed = 8;
    
    with (instance_create(x, y, obj_jumpdust))
        image_xscale = other.image_xscale;
}

if (state == enemystates.charge && bonebuffer > 0)
    bonebuffer--;

if (grounded && jumping < 40 && state == enemystates.charge)
    jumping++;

if (state == enemystates.charge && grounded && jumping >= 40)
{
    vsp = -11;
    jumping = 0;
    instance_create(x, y, obj_highjumpcloud2);
}

if (bonebuffer == 0)
{
    with (instance_create(x, y, obj_banditobomb))
    {
        vsp = -9;
        image_xscale = other.image_xscale;
        hsp = 0;
        instance_create(x, y, obj_genericpoofeffect);
        var old_y = y;
        var t = 0;
        
        while (y < room_height)
        {
            if (place_meeting(x, y, obj_solid))
            {
                y++;
                continue;
            }
            else
            {
                t = 1;
                break;
            }
        }
        
        if (!t)
            y = old_y;
    }
    
    bonebuffer = 100;
}

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.stun)
    thrown = false;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
