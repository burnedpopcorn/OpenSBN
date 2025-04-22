if (room == rm_blank)
    exit;

targetplayer = instance_nearest(x, y, obj_player1);
wastedhits = 8 - elitehit;

if (elitehit <= 2)
    attackpool = [UnknownEnum.Value_176, enemystates.turn, UnknownEnum.Value_74, UnknownEnum.Value_74, UnknownEnum.Value_74];
else if (elitehit <= 4)
    attackpool = [UnknownEnum.Value_176, UnknownEnum.Value_176, UnknownEnum.Value_176, enemystates.turn];
else if (elitehit <= 6)
    attackpool = [enemystates.turn];

switch (state)
{
    case enemystates.walk:
        scr_noise_walk();
        break;
    
    case states.jump:
        scr_noise_jump();
        break;
    
    case states.punch:
        scr_noise_punch();
        break;
    
    case states.shield:
        scr_noise_shield();
        break;
    
    case states.pistol:
        scr_noise_pistol();
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

if (state != states.freefall && state != states.freefallland)
    hit = 0;

if (state == enemystates.stun)
{
    movespeed = 0;
    
    if (thrown)
    {
        savedthrown = true;
        placedtraps = 0;
        jumpbuffer = 1;
        attacked = 0;
        
        with (obj_noisetrap)
            instance_destroy();
    }
    
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

if (state == states.jump || (state == states.shield && substate == states.jump))
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

if ((state == states.pistol && substate == states.shotgun) || (state == states.shield && substate == states.shield) || (state == enemystates.walk && (!placedtraps || (!obj_player1.brick && !instance_exists(obj_brickball)))) || state == states.punch || state == enemystates.stun || !use_collision)
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
