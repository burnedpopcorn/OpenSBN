var player = instance_nearest(x, y, obj_player1);

switch (state)
{
    case UnknownEnum.Value_128:
        scr_enemy_idle();
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
    
    case UnknownEnum.Value_143:
        scr_enemy_chase();
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
    
    case states.punch:
        if (sprite_index == spr_minijohn_punchstart)
        {
            image_speed = 0.35;
            hsp = approach(hsp, 0, 1);
            
            if (floor(image_index) == (image_number - 1))
            {
                punchspd = 8;
                hsp = punchspd * image_xscale;
                sprite_index = spr_minijohn_punch;
                image_index = 0;
                image_speed = 0.25;
                
                with (instance_create(x, y, obj_tackhitbox))
                {
                    sprite_index = spr_bighitbox;
                    mask_index = spr_bighitbox;
                    ID = other.id;
                }
            }
        }
        else if (sprite_index == spr_minijohn_punch)
        {
            image_speed = 0.25;
            punchspd = approach(punchspd, 0, 0.25);
            hsp = punchspd * image_xscale;
            
            with (instance_place(x + hsp, y, obj_destructibles))
                instance_destroy();
            
            if (floor(image_index) == (image_number - 1))
            {
                state = UnknownEnum.Value_143;
                ragecooldown = 100;
                sprite_index = spr_minijohn_charge;
            }
        }
        
        break;
    
    case UnknownEnum.Value_191:
        hsp = 0;
        
        if (underground)
        {
            if (vsp < 0)
                vsp = 0;
            
            sprite_index = spr_minijohn_underground;
            
            if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
            {
                sprite_index = spr_minijohn_undergroundout;
                image_index = 0;
                underground = 0;
                
                if (player.x != x)
                    image_xscale = sign(x - player.x);
            }
        }
        else if (sprite_index == spr_minijohn_undergroundout)
        {
            if (vsp < 0)
                vsp = 0;
            
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_minijohn_stun;
                vsp = -4;
                
                repeat (3)
                    create_debris(x, y, spr_towerblockdebris);
            }
        }
        else if (grounded)
        {
            state = UnknownEnum.Value_143;
            sprite_index = spr_minijohn_charge;
        }
        
        break;
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state == UnknownEnum.Value_143 && ragecooldown <= 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        if (x != player.x)
            image_xscale = sign(player.x - x);
        
        if (elite)
        {
            sprite_index = spr_minijohn_rage1;
            image_index = 0;
            vsp = -8;
            flash = 1;
            alarm[4] = 5;
            ragecooldown = 100;
            state = UnknownEnum.Value_127;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
            
            with (instance_create(x, y, obj_tackhitbox))
            {
                sprite_index = spr_bighitbox;
                mask_index = spr_bighitbox;
                ID = other.id;
            }
        }
        else
        {
            sprite_index = spr_minijohn_punchstart;
            image_index = 0;
            ragecooldown = 100;
            state = states.punch;
        }
    }
}

if (ragecooldown > 0)
    ragecooldown--;

if (state != states.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_143)
    momentum = 0;

if (state == states.walk || state == UnknownEnum.Value_128)
{
    var targetplayer = obj_player1;
    
    if (obj_player1.spotlight == 0)
        targetplayer = obj_player2;
    
    movespeed = 4;
    
    if (targetplayer.x != x)
        image_xscale = -sign(x - targetplayer.x);
    
    state = UnknownEnum.Value_143;
}

if (instance_exists(obj_player2))
{
    if (obj_player2.x > (x - 400) && obj_player2.x < (x + 400) && y <= (obj_player2.y + 60) && y >= (obj_player2.y - 60))
    {
        if (state != UnknownEnum.Value_128 && obj_player2.state == states.mach3)
        {
            state = UnknownEnum.Value_128;
            sprite_index = scaredspr;
            
            if (x != obj_player2.x)
                image_xscale = -sign(x - obj_player2.x);
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

if (state == UnknownEnum.Value_191)
{
    invincible = 1;
    
    if (sprite_index != spr_minijohn_underground && sprite_index != spr_minijohn_undergroundout)
        image_blend = c_gray;
}
else
{
    invincible = 0;
    image_blend = c_white;
}
