switch (state)
{
    case UnknownEnum.Value_128:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_132:
        scr_enemy_turn();
        break;
    
    case states.walk:
        scr_enemy_walk();
        hsp = 0;
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_131:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_143:
        scr_enemy_chase();
        break;
    
    case states.pummel:
        scr_enemy_pummel();
        break;
    
    case states.staggered:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_127:
        scr_enemy_rage();
        break;
}

if ((state == states.walk || state == UnknownEnum.Value_128) && sprite_index != spr_golfdemon_idle2)
    sprite_index = spr_golfdemon_idle;

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (ragecooldown > 0)
    ragecooldown--;

if (state != states.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_143)
    momentum = 0;

if (state == states.walk || state == UnknownEnum.Value_128)
{
    var targetplayer = instance_nearest(x, y, obj_player1);
    
    if (sprite_index != spr_golfdemon_idle2 && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
    {
        sprite_index = spr_golfdemon_idle2;
        image_index = 0;
    }
    
    if (sprite_index == spr_golfdemon_idle2 && floor(image_index) == (image_number - 1))
    {
        movespeed = 6;
        
        if (targetplayer.x != x)
            image_xscale = -sign(x - targetplayer.x);
        
        state = UnknownEnum.Value_143;
        sprite_index = spr_golfdemon_walk;
    }
}

if (state != states.grabbed)
    depth = 0;

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
