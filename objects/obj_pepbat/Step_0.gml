if (room == rm_blank)
    exit;

var targetplayer = instance_nearest(x, y, obj_player1);

switch (state)
{
    case enemystates.idle:
        if (sprite_index != scaredspr)
        {
            sprite_index = spr_pepbat_idle;
            
            if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
            {
                state = enemystates.walk;
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
    
    case enemystates.charge:
        scr_enemy_charge();
        break;
    
    case enemystates.turn:
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
            state = enemystates.idle;
        }
        
        break;
    
    case enemystates.walk:
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
            state = enemystates.turn;
        }
        
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

scr_scareenemy();

if (bombreset > 0)
    bombreset--;

targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (x != targetplayer.x && state == enemystates.walk && state != enemystates.pthrow && obj_player1.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
    {
        if (state == enemystates.walk)
        {
            image_index = 0;
            sprite_index = spr_pepbat_kick;
            image_xscale = -sign(x - targetplayer.x);
            state = enemystates.pthrow;
        }
    }
}

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
