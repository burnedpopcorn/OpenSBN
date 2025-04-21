if (room == rm_blank)
    exit;

var targetplayer = instance_nearest(x, y, obj_player1);

switch (state)
{
    case UnknownEnum.Value_128:
        if (sprite_index != scaredspr)
        {
            sprite_index = spr_pepbat_idle;
            
            if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
            {
                state = states.walk;
                hit = 0;
            }
        }
        else
        {
            hsp = 0;
            vsp = 0;
            
            if (scaredbuffer > 0)
                scaredbuffer--;
            else
                sprite_index = spr_pepbat_idle;
        }
        
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_132:
        sprite_index = spr_pepbat_move;
        var dir = point_direction(x, y, xstart, ystart);
        x = approach(x, xstart, abs(lengthdir_x(5, dir)));
        y = approach(y, ystart, abs(lengthdir_y(5, dir)));
        
        if (xstart != x)
            image_xscale = sign(xstart - x);
        
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            x = xstart;
            y = ystart;
            state = UnknownEnum.Value_128;
        }
        
        break;
    
    case states.walk:
        vsp = 0;
        hsp = 0;
        sprite_index = spr_pepbat_move;
        
        if (targetplayer.x != x)
            image_xscale = sign(targetplayer.x - x);
        
        if (!(targetplayer.x > (x - 70) && targetplayer.x < (x + 70) && y <= (targetplayer.y + 29) && y >= (targetplayer.y - 29)))
        {
            var dir = point_direction(x, y, targetplayer.x, targetplayer.y);
            x += lengthdir_x(3, dir);
            y += lengthdir_y(3, dir);
        }
        
        if (hit || distance_to_point(xstart, ystart) > 800)
        {
            hit = 0;
            state = UnknownEnum.Value_132;
        }
        
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        hit = 1;
        break;
    
    case UnknownEnum.Value_131:
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

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = false;

scr_scareenemy();

if (bombreset > 0)
    bombreset--;

targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (x != targetplayer.x && state == states.walk && state != UnknownEnum.Value_131 && obj_player1.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
    {
        if (state == states.walk)
        {
            image_index = 0;
            sprite_index = spr_pepbat_kick;
            image_xscale = -sign(x - targetplayer.x);
            state = UnknownEnum.Value_131;
        }
    }
}

if (grounded && state == UnknownEnum.Value_131 && floor(image_index) == 3)
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
