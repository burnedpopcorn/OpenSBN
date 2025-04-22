if (room == rm_blank)
    exit;

targetplayer = instance_nearest(x, y, obj_player1);
targetblock = instance_nearest(x, y, obj_pepper_marbleblock);
wastedhits = 8 - elitehit;

switch (state)
{
    case enemystates.walk:
        scr_pepperman_walk();
        break;
    
    case states.shoulderbash:
        scr_pepperman_shoulderbash();
        break;
    
    case states.jump:
        scr_pepperman_jump();
        break;
    
    case states.freefall:
        scr_pepperman_freefall();
        break;
    
    case enemystates.hit:
        scr_enemy_hit();
        break;
    
    case enemystates.stun:
        scr_enemy_stun();
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
}

if (state == enemystates.stun)
{
    if (thrown)
        savedthrown = true;
    
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1;
        idle_timer = 1;
    }
}
else
{
    savedthrown = false;
}

if (state == enemystates.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == states.jump)
{
    use_collision = 0;
    x += hsp;
    y += vsp;
    
    if (vsp < 20)
        vsp += grav;
}
else
{
    use_collision = 1;
}

if (state == enemystates.stun || state == states.shoulderbash || !use_collision || elitehit <= 1)
    invincible = 1;
else
    invincible = 0;

if (state != enemystates.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

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
