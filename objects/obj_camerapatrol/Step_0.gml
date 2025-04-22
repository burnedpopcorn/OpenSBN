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
        
        if (!instance_exists(coneID))
        {
            coneID = instance_create(x, y, obj_patrolcone);
            coneID.baddieID = id;
        }
        
        if (alarm[5] != -1)
            hsp = 0;
        
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

if (cooldown > 0)
    cooldown--;

if (state == enemystates.walk)
{
    if (!patrolfound)
    {
        if (cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
        {
            patroltimer = patroltimermax;
            patrolfound = 1;
            alarm[5] = 60;
        }
    }
    else if (alarm[5] == -1)
    {
        alarm[5] = 60;
    }
}
else if (state == enemystates.stun || state == enemystates.grabbed || state == enemystates.hit)
{
    alarm[5] = -1;
}

if (state == enemystates.walk && point_in_camera(x, y, view_camera[0]))
{
    var p = 0;
    
    with (obj_player1)
    {
        if (state == states.backbreaker && sprite_index == spr_taunt)
            p = 1;
    }
    
    if (p)
    {
        patroltimer = 0;
        alarm[5] = 1;
    }
}

if (state == states.punch)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = enemystates.walk;
        sprite_index = walkspr;
        cooldown = 100;
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != enemystates.grabbed)
    depth = 0;

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
