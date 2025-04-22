if (room == rm_blank)
    exit;

if (bombreset > 0)
    bombreset--;

switch (state)
{
    case enemystates.walk:
        if (substate_buffer > 0)
        {
            substate_buffer--;
        }
        else
        {
            substate_buffer = substate_max;
            var old_substate = substate;
            
            while (substate == old_substate)
                substate = choose(enemystates.walk, enemystates.idle, enemystates.turn);
            
            if (substate == enemystates.walk)
            {
                image_xscale = choose(-1, 1);
            }
            else if (substate == enemystates.turn)
            {
                sprite_index = spr_pizzaslug_turn;
                image_index = 0;
                hsp = 0;
            }
        }
        
        switch (substate)
        {
            case enemystates.walk:
                image_speed = 0.35;
                
                if (sprite_index != spr_pizzaslug_walk)
                {
                    image_index = 0;
                    sprite_index = spr_pizzaslug_walk;
                }
                
                scr_enemy_walk();
                break;
            
            case enemystates.idle:
                image_speed = 0.35;
                hsp = 0;
                sprite_index = spr_pizzaslug_idle;
                break;
            
            case enemystates.turn:
                image_speed = 0.35;
                substate_buffer = 5;
                
                if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                {
                    image_xscale *= -1;
                    substate_buffer = substate_max;
                    substate = enemystates.idle;
                    sprite_index = spr_pizzaslug_idle;
                }
                
                break;
            
            case enemystates.pthrow:
                state = enemystates.pthrow;
                substate_buffer = 0;
                image_index = 0;
                sprite_index = spr_pizzaslug_cough;
                break;
        }
        
        break;
    
    case enemystates.idle:
        scr_enemy_idle();
        break;
    
    case enemystates.turn:
        scr_enemy_turn();
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

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

var player = instance_nearest(x, y, obj_player1);

if (state == enemystates.walk)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ragecooldown == 0)
    {
        if (elite)
        {
            if (x != player.x)
                image_xscale = -sign(x - player.x);
            
            image_speed = 0.6;
            hsp = 0;
            shot = 0;
            sprite_index = spr_pizzaslug_rage;
            image_index = 0;
            state = enemystates.rage;
            flash = 1;
            alarm[4] = 5;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
        }
        else
        {
            if (x != player.x)
                image_xscale = -sign(x - player.x);
            
            ragecooldown = 160;
            state = enemystates.pthrow;
            substate_buffer = 0;
            image_index = 0;
            sprite_index = spr_pizzaslug_cough;
        }
    }
}

if (ragecooldown > 0)
    ragecooldown--;

scr_scareenemy();

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
