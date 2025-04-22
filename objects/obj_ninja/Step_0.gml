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

if (sprite_index != spr_grapeboy)
    usepalette = 1;

scr_scareenemy();

if (state == enemystates.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != enemystates.stun)
    birdcreated = 0;

targetplayer = instance_nearest(x, y, obj_player1);

if (state == enemystates.walk)
{
    if (sprite_index == spr_grapeboy)
    {
        hsp = 0;
    }
    else
    {
        move = sign(targetplayer.x - x);
        
        if (move != 0)
            image_xscale = move;
        
        if (movespeed < 4)
            movespeed += 0.25;
        
        if (abs(x - targetplayer.x) < 230)
        {
            hsp = -move * movespeed;
            
            if (move != 0 && move != -dir)
                movespeed = 2;
        }
        else if (abs(x - targetplayer.x) > 240)
        {
            hsp = move * movespeed;
            
            if (move != 0 && move != dir)
                movespeed = 2;
        }
        else
        {
            hsp = 0;
            movespeed = 0;
        }
        
        trace(movespeed, "   ", hsp);
        
        if (hsp != 0)
            dir = sign(hsp);
        
        if (place_meeting(x, y, obj_ninja) || place_meeting(x + hsp, y, obj_ninja))
        {
            var b = instance_place(x, y, obj_ninja);
            var s = 2;
            
            if (!instance_exists(b))
            {
                s = 0;
                b = instance_place(x + hsp, y, obj_ninja);
            }
            
            if (b.id < id)
                hsp = -sign(b.dir) * s;
        }
    }
}
else if (state == states.punch)
{
    image_speed = 0.35;
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = enemystates.walk;
        sprite_index = walkspr;
    }
    
    if (image_index > 4 && image_index < 14)
    {
        if (!hitboxcreate)
        {
            hitboxcreate = 1;
            
            with (instance_create(x, y, obj_tackhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
    }
    
    if (sprite_index == spr_ninja_punchattack)
    {
        if (floor(image_index) != 5 && floor(image_index) != 8 && floor(image_index) != 11)
        {
            shot = 0;
        }
        else if (!shot)
        {
            with (instance_create(x, y + 6, obj_enemybullet))
                image_xscale = other.image_xscale;
        }
    }
}

if (sprite_index == spr_grapeboy)
{
    if (x != targetplayer.x && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 150) && targetplayer.y < (y + 20))
    {
        if (state == enemystates.walk || state == enemystates.idle)
        {
            if (sprite_index == spr_grapeboy)
                create_particle(x, y, particle.balloonpop, 0);
            
            image_xscale = -sign(x - targetplayer.x);
            sprite_index = spr_ninja_uppercut;
            image_index = 0;
            state = enemystates.charge;
            roaming = 1;
            vsp = -14;
            hsp = image_xscale * 4;
            inv_timer = 5;
            alarm[4] = 5;
            
            with (instance_create(x, y, obj_tackhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
    }
}
else if (state == enemystates.walk && attack_buffer <= 0)
{
    attack_buffer = attack_max + irandom_range(-attack_random, attack_random);
    state = states.punch;
    hsp = 0;
    hitboxcreate = 0;
    image_index = 0;
    
    if (!elite)
        sprite_index = spr_ninja_kickattack;
    else
        sprite_index = spr_ninja_punchattack;
}

if (attack_buffer > 0)
    attack_buffer--;

if (inv_timer > 0)
{
    inv_timer--;
    invincible = 1;
}
else
{
    invincible = 0;
}

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
