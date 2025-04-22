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
        if (!grounded)
            sprite_index = spr_ufogrounded_fall;
        
        if (sprite_index != spr_ufogrounded_fall && sprite_index != spr_ufogrounded_land)
        {
            invincible = 0;
            scr_enemy_walk();
        }
        else if (sprite_index == spr_ufogrounded_fall)
        {
            hsp = 0;
            
            if (grounded)
            {
                sprite_index = spr_ufogrounded_land;
                image_index = 0;
            }
        }
        else
        {
            if (image_index > 11)
                hsp = sign(image_xscale);
            
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_ufogrounded_walk;
                invincible = 0;
            }
        }
        
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
}

if (state != enemystates.walk)
    invincible = 0;

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

scr_scareenemy();
var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (bombreset > 0)
    bombreset--;

if (x != targetplayer.x && state != enemystates.pthrow && bombreset == 0 && grounded)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if ((state == enemystates.walk || state == enemystates.idle) && !scr_solid_line(targetplayer))
        {
            sprite_index = spr_ufogrounded_shoot;
            image_index = 0;
            image_xscale = -sign(x - targetplayer.x);
            state = enemystates.pthrow;
        }
    }
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
