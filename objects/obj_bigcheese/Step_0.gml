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

if (state == enemystates.walk)
{
    hsp = 0;
}
else if (state == states.throwing)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = enemystates.walk;
        sprite_index = spr_bigcheese_idle;
    }
    
    if (!shot)
    {
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                hsp = 0;
                vsp = 0;
                state = states.tumble;
                jumpstop = 1;
                x = other.x;
                y = other.y;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                x = other.x;
                y = other.y;
                hsp = 0;
                vsp = 0;
                hsp_carry = 0;
                vsp_carry = 0;
            }
        }
    }
    
    if (floor(image_index) > 2 && !shot)
    {
        shot = 1;
        
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                movespeed = 12;
                state = states.tumble;
                vsp = -14;
                jumpstop = 1;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                scr_pizzaball_go_to_thrown(12 * image_xscale, -14, 0);
            }
        }
    }
}

if (state == enemystates.stun && stunned > 40 && birdcreated == 0)
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
