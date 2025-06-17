if (room == rm_blank)
    exit;

switch (state)
{
    case states.idle:
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
        var _vsp = 3;
        var face = sign(ystart - y);
        
        if (y != ystart && !scr_solid(x, y + (face * _vsp)))
            y = approach(y, ystart, _vsp);
        
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
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
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = 0;

if (state == states.stun)
    grav = 0.5;
else
    grav = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != states.charge)
    scr_scareenemy();

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (collision_rectangle(x - 100, y - 30, x + 100, y + 600, obj_player1, false, true) > 0 && !scr_solid_line(player) && y == ystart)
{
    if (state != states.rage && ragebuffer == 0 && (state == states.walk || state == states.charge))
    {
        event_play_oneshot("event:/SFX/enemies/charge", x, y);
        state = states.rage;
        sprite_index = spr_clam_attackstart;
        
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        ragebuffer = 100;
        image_index = 0;
        image_speed = 0.5;
        flash = 0;
        alarm[4] = 5;
        
        with (instance_create(x, y, obj_tackhitbox))
        {
            sprite_index = spr_clam_hurtbox;
            mask_index = spr_clam_hurtbox;
            ID = other.id;
        }
    }
}

if (state == states.stun || state == states.walk)
    movespeed = 0;

if (state != states.stun)
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
