if (room == rm_blank)
    exit;

switch (state)
{
    case enemystates.idle:
        scr_enemy_idle();
        break;
    
    case enemystates.charge:
        scr_enemy_charge();
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
}

if (state == enemystates.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != enemystates.stun)
    birdcreated = 0;

if (state == enemystates.walk && y > ystart && !scr_solid(x, y - 1))
    y--;

if (state == enemystates.walk && y < ystart && !scr_solid(x, y + 1))
    y++;

if (state == enemystates.stun)
    grav = 0.5;
else
    grav = 0;

if (bombreset > 0 && state == enemystates.walk)
    bombreset--;

var player = instance_nearest(x, y, obj_player1);

if (ragebuffer > 0)
    ragebuffer--;

if (player.x > (x - 200) && player.x < (x + 200) && player.y <= (y + 400) && player.y >= (y - 60))
{
    if (x != player.x && state != enemystates.pthrow && bombreset == 0)
    {
        if (state == enemystates.walk || state == enemystates.idle)
        {
            sprite_index = spr_kentukybomber_attack;
            image_index = 0;
            state = enemystates.pthrow;
        }
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state == enemystates.pthrow || state == enemystates.rage)
{
    hsp = 0;
    vsp = 0;
}

if (state != enemystates.grabbed)
    depth = 0;

scr_scareenemy();

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
