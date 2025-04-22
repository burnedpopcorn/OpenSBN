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
    
    case enemystates.ghostpossess:
        scr_enemy_ghostpossess();
        break;
    
    case states.bump:
        sprite_index = spr_badrat_stun;
        
        if (grounded && vsp > 0)
        {
            state = enemystates.walk;
            sprite_index = walkspr;
        }
        
        break;
}

var targetplayer = instance_nearest(x, y, obj_player1);

if (cooldown > 0)
    cooldown--;

if (state == enemystates.walk && cooldown <= 0)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 50) && targetplayer.y < (y + 50))
    {
        state = states.punch;
        sprite_index = spr_badrat_attack1;
        image_index = 0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}

if (state == states.punch)
{
    var mv = 8;
    image_speed = 0.35;
    
    if (sprite_index == spr_badrat_attack1)
    {
        hsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack2;
            cooldown = 30;
        }
    }
    else if (sprite_index == spr_badrat_attack2)
    {
        hsp = image_xscale * mv;
        vsp = 0;
        
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_tackhitbox);
            hitboxID.ID = id;
        }
        
        if (cooldown > 0)
            cooldown--;
        else if (grounded || (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)))
            sprite_index = spr_badrat_attack2end;
    }
    else if (sprite_index == spr_badrat_attack2end)
    {
        hsp = image_xscale * mv;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_badrat_attack3;
            instance_destroy(hitboxID);
        }
    }
    else
    {
        hsp = approach(hsp, 0, 0.2);
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = walkspr;
            state = enemystates.walk;
            instance_destroy(hitboxID);
            cooldown = 80;
        }
    }
}

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

if (place_meeting(x, y, obj_canonexplosion))
    instance_destroy();

if (state != enemystates.grabbed)
    depth = 0;

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

if (state != enemystates.stun)
    thrown = false;
