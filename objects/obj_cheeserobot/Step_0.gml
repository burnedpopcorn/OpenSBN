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
}

if (state == states.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = 0;

idlespr = spr_cheeserobot_idle;
stunfallspr = spr_cheeserobot_stun;
walkspr = spr_cheeserobot_walk;
stunspr = spr_cheeserobot_stun;
grabbedspr = spr_cheeserobot_stun;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hp <= 0)
    instance_destroy();

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = false;

if (bombreset > 0)
    bombreset--;

if (x != obj_player1.x && state != UnknownEnum.Value_131 && bombreset == 0)
{
    if (obj_player1.x > (x - 400) && obj_player1.x < (x + 400) && y <= (obj_player1.y + 20) && y >= (obj_player1.y - 20))
    {
        if (state == states.walk || state == UnknownEnum.Value_128)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player1.x);
            state = UnknownEnum.Value_131;
        }
    }
}
