if (room == rm_blank)
    exit;

switch (state)
{
    case UnknownEnum.Value_128:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_charge();
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

var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (x != targetplayer.x && state != UnknownEnum.Value_131 && obj_player1.state != states.tumble && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100))
    {
        if (state == states.walk)
        {
            image_index = 0;
            sprite_index = spr_pepgoblin_kick;
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

huespot++;
thecolor = make_color_hsv(huespot, 255, 255);
image_blend = thecolor;

if (huespot > 255)
    huespot -= 255;
