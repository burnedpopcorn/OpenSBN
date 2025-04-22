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
        
        if (totemID != -4)
            state = UnknownEnum.Value_190;
        
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
    
    case enemystates.ghostpossess:
        scr_enemy_ghostpossess();
        break;
}

scr_scareenemy();

if (state == UnknownEnum.Value_190 && totemID != -4)
{
    image_speed = 0.35;
    
    if (sprite_index != spr_indiancheese_dance)
    {
        var tx = totemID.x + (64 * totemdir);
        var on_place = (totemdir > 0) ? (x > tx) : (x < tx);
        
        if (place_meeting(x + image_xscale, y, obj_solid))
            on_place = 1;
        
        hsp = !on_place ? (image_xscale * 3) : 0;
        
        if (grounded && on_place)
        {
            sprite_index = spr_indiancheese_dance;
            image_index = 0;
            hsp = 0;
        }
        
        if (sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
            image_index = image_number - 1;
    }
    else
    {
        hsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            totemdir = (x > totemID.x) ? -1 : 1;
            image_xscale = totemdir;
            sprite_index = spr_indiancheese_jump;
            vsp = -11;
        }
    }
}
else if (state == UnknownEnum.Value_190 && totemID == -4)
{
    state = enemystates.walk;
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

var player = instance_nearest(x, y, obj_player1);

if (elite && ragecooldown > 0)
    ragecooldown--;

if (state == enemystates.walk && sprite_index == walkspr && sprite_index != spr_indiancheese_scared && elite && ragecooldown == 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        state = enemystates.rage;
        sprite_index = spr_indiancheese_howl;
        image_index = 0;
        shot = 0;
        ragedash = 100;
        hsp = 0;
        flash = 1;
        alarm[4] = 5;
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
}

if (!grounded && sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
    image_speed = 0;
else if (image_speed == 0)
    image_speed = 0.35;

if (sprite_index == spr_indiancheese_land && floor(image_index) == (image_number - 1))
    sprite_index = spr_indiancheese_walk;

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
