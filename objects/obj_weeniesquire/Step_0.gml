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
    
    case enemystates.pummel:
        scr_enemy_pummel();
        break;
    
    case enemystates.staggered:
        scr_enemy_staggered();
        break;
    
    case enemystates.rage:
        scr_enemy_rage();
        break;
    
    case enemystates.ghostpossess:
        scr_enemy_ghostpossess();
        break;
    
    case states.punch:
        hsp = image_xscale * chargespeed;
        
        if (chargespeed < 24)
            chargespeed += 0.3;
        
        with (obj_destructibles)
        {
            if (place_meeting(x - other.hsp, y, other))
                instance_destroy();
        }
        
        if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_slope))
        {
            state = enemystates.stun;
            stunned = 80;
            hsp = -8 * image_xscale;
            vsp = -5;
        }
        
        break;
}

if (state == enemystates.walk && grounded && vsp > 0)
    hsp = 0;

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

var player = instance_nearest(x, y, obj_player1);
var check = player.x > (x - 300) && player.x < (x + 300);

if (state == enemystates.walk && check && y <= (player.y + 60) && y >= (player.y - 60) && state != states.punch && chargebuffer <= 0)
{
    state = states.punch;
    flash = 1;
    sprite_index = spr_weeniesquire_charge;
    chargebuffer = 80;
    chargespeed = 6;
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_tackhitbox))
    {
        ID = other.id;
        sprite_index = spr_weeniesquire_hitbox;
    }
    
    if (x != player.x)
        image_xscale = sign(player.x - x);
}

if (state != states.punch && chargebuffer > 0)
    chargebuffer--;

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
