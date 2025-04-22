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
        hsp = 0;
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
    
    case enemystates.rage:
        scr_enemy_rage();
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

var player = instance_nearest(x, y, obj_player1);

if (bombreset > 0)
    bombreset--;

if (x != player.x && grounded && player.x > (x - 500) && player.x < (x + 500) && player.y > (y - 500) && player.y < (y + 500))
{
    if (state == enemystates.walk && bombreset <= 0)
    {
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        image_index = 0;
        state = enemystates.pthrow;
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (floor(image_index) == (image_number - 1) && sprite_index == spr_spitcheese_spit)
    sprite_index = spr_spitcheese_idle;

if (state != enemystates.grabbed)
    depth = 0;

if (state != enemystates.stun)
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
