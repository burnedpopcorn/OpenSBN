if (room == rm_blank)
    exit;

switch (state)
{
    case UnknownEnum.Value_128:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_132:
        scr_enemy_turn();
        break;
    
    case states.walk:
        scr_enemy_walk();
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

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = 0;

if (state == states.walk && y > ystart && !scr_solid(x, y - 1))
    y--;

if (state == states.walk && y < ystart && !scr_solid(x, y + 1))
    y++;

if (state == states.stun)
    grav = 0.5;
else
    grav = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != UnknownEnum.Value_130)
    scr_scareenemy();

if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == UnknownEnum.Value_130)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_tackhitbox))
            ID = other.id;
    }
    
    sprite_index = spr_null;
    movespeed = 10;
}

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && important == 0)
{
    if (x != player.x && state != UnknownEnum.Value_130 && y == ystart && important == 0)
    {
        if (state == states.walk)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player1.x);
            state = UnknownEnum.Value_130;
            sprite_index = spr_null;
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
