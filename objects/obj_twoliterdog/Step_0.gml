if (room == rm_blank)
    exit;

var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        movespeed = 3;
        scr_enemy_walk();
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        break;
    
    case states.pizzagoblinthrow:
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
    
    case states.rage:
        scr_enemy_rage();
        break;
    
    case states.ghostpossess:
        scr_enemy_ghostpossess();
        break;
    
    case states.chase:
        if (sprite_index == spr_twoliter_tipover && animation_end(undefined, 6))
        {
            image_index = image_number - 1;
            
            if (grounded)
            {
                vsp = -8;
                image_index = 0;
                sprite_index = spr_twoliter_fall;
                
                if (-sign(x - targetplayer.x) != 0)
                    image_xscale = -sign(x - targetplayer.x);
                
                var _dist = point_distance(x, 0, targetplayer.x, 0);
                hsp = image_xscale * clamp(_dist / 32, 3, 10);
                event_play_oneshot("event:/SFX/enemies/charge", x, y);
                bombreset = 100;
            }
        }
        
        if (sprite_index == spr_twoliter_fall)
        {
            if (_afterimage > 0)
            {
                _afterimage--;
            }
            else
            {
                _afterimage = 8;
                create_red_afterimage(x, y, sprite_index, image_index - 1, xscale);
            }
        }
        
        if (grounded && vsp >= 0 && sprite_index == spr_twoliter_fall)
        {
            state = states.stun;
            stunned = 10;
        }
        
        movespeed = 0;
        image_speed = 0.35;
        break;
}

if (state != states.chase)
    scr_scareenemy();

if (thrown == true)
{
    if (hitvsp == 0)
    {
        explodeInstant = false;
        instance_destroy();
    }
    else
    {
        explodeInstant = true;
    }
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (bombreset > 0)
    bombreset--;

if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 150) && y >= (targetplayer.y - 60))
{
    if (bombreset <= 0)
    {
        if (state == states.walk)
        {
            hsp = 0;
            vsp = -2;
            image_index = 0;
            sprite_index = spr_twoliter_tipover;
            state = states.chase;
            
            if (-sign(x - targetplayer.x) != 0)
                image_xscale = -sign(x - targetplayer.x);
        }
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

if (state == states.chase && sprite_index == spr_twoliter_fall)
{
    if (hitboxcreate == 0)
    {
        hitboxcreate = 1;
        
        with (instance_create(x, y, obj_tackhitbox))
            ID = other.id;
    }
}
