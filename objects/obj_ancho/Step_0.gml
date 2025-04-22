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

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.charge)
    scr_scareenemy();

if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == enemystates.charge)
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
    if (state != enemystates.rage && ragebuffer == 0 && elite && (state == enemystates.walk || state == enemystates.charge))
    {
        state = enemystates.rage;
        sprite_index = spr_null;
        
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        ragebuffer = 100;
        image_index = 0;
        image_speed = 0.5;
        flash = 1;
        alarm[4] = 5;
        
        with (instance_create(x, y, obj_tackhitbox))
        {
            sprite_index = spr_bighitbox;
            mask_index = spr_bighitbox;
            ID = other.id;
        }
        
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
    else if (x != player.x && state != enemystates.charge && y == ystart && important == 0)
    {
        if (state == enemystates.walk)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player1.x);
            state = enemystates.charge;
            sprite_index = spr_null;
        }
    }
}

if (state == enemystates.stun || state == enemystates.walk)
    movespeed = 0;

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
