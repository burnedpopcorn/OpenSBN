if (room == rm_blank)
    exit;

image_speed = 0.35;

switch (state)
{
    case enemystates.idle:
        sprite_index = idlespr;
        playerid = instance_nearest(x, y, obj_player1);
        var x1 = 370;
        var t;
        
        if (image_xscale > 0)
            t = playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        else
            t = playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200);
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (t)
        {
            state = states.transitioncutscene;
            sprite_index = spr_ghoul_attackstart;
            image_index = 0;
            attack_y = y;
        }
        
        break;
    
    case enemystates.charge:
        scr_enemy_charge();
        break;
    
    case enemystates.walk:
        sprite_index = idlespr;
        var d = point_direction(x, y, xstart, ystart);
        x += lengthdir_x(8, d);
        y += lengthdir_y(8, d);
        hsp = 0;
        vsp = 0;
        
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            state = enemystates.idle;
            image_xscale = start_xscale;
            cooldown = 100;
            x = xstart;
            y = ystart;
        }
        else
        {
            image_xscale = sign(x - xstart);
        }
        
        break;
    
    case states.transitioncutscene:
        hsp = 0;
        vsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            state = states.punch;
            vsp = 11;
            attack_y = y;
            sprite_index = spr_ghoul_attack;
        }
        
        break;
    
    case states.punch:
        vsp = approach(vsp, -11, 0.5);
        hsp = image_xscale * 10;
        x += hsp;
        y += vsp;
        
        if (y < attack_y && vsp < 0)
        {
            y = attack_y;
            vsp = 0;
            state = enemystates.idle;
            cooldown = 100;
            image_xscale *= -1;
        }
        
        break;
    
    case enemystates.turn:
        break;
    
    case enemystates.land:
        scr_enemy_land();
        break;
    
    case enemystates.hit:
        scr_enemy_hit();
        break;
    
    case enemystates.stun:
        scr_enemy_stun();
        hit = 1;
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

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.stun)
    thrown = false;

if (bombreset > 0)
    bombreset--;

if (grounded && state == enemystates.pthrow && floor(image_index) == 3)
    vsp = -5;

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
