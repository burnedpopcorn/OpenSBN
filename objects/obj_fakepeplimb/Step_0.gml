if (room == rm_blank)
    exit;

targetplayer = instance_nearest(x, y, obj_player1);

if (ceiling && (state == states.crouch || state == states.punch))
    grav = 0;
else if (ceiling && state != states.crouch && state != states.punch)
    grav = 0.5;

switch (state)
{
    case enemystates.idle:
        scr_enemy_idle();
        break;
    
    case enemystates.turn:
        scr_enemy_turn();
        break;
    
    case enemystates.walk:
        ceiling = 0;
        state = states.crouch;
        grav = 0.5;
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
    
    case states.punch:
        hidden = 0;
        cooldown = 100;
        
        if (sprite_index != spr_attack)
        {
            sprite_index = spr_attack;
            image_index = 0;
            
            with (instance_create(x, y, obj_tackhitbox))
            {
                visible = false;
                sprite_index = other.sprite_index;
                other.hitboxID = id;
                ID = other.id;
            }
        }
        else if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0.35;
            state = states.crouch;
            instance_destroy(hitboxID);
            sprite_index = spr_hidden;
        }
        
        break;
    
    case states.crouch:
        if (hidden)
        {
            sprite_index = spr_hidden;
            
            if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
            {
                hidden = 0;
                state = states.punch;
            }
        }
        else
        {
            sprite_index = spr_hidden;
            
            if (cooldown > 0)
                cooldown--;
            else
                state = states.punch;
        }
        
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

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hidden)
    invincible = 1;
else
    invincible = 0;

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.stun)
    thrown = false;
