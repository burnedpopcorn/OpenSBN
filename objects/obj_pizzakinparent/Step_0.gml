visible = (room == rank_room || room == timesuproom) ? false : playerid.visible;

if (obj_player1.state == states.pizzathrow)
    visible = false;

playerid = obj_player1.spotlight ? obj_player1 : obj_player2;
var fishcheck = sprite_index == spr_swim && place_meeting(playerid.x, playerid.y, obj_water);
var roomname = string_letters(room_get_name(room));

if (roomname == "strongcoldminiboss")
    roomname = "strongcold";

if (state != states.backbreaker)
{
    switch (roomname)
    {
        default:
            if (sprite_index == spr_intro && floor(image_index) == (image_number - 1) && !fishcheck)
                sprite_index = spr_idle;
            
            if (sprite_index != spr_intro)
            {
                image_alpha = playerid.image_alpha;
                sprite_index = (xprev != x) ? spr_run : spr_idle;
                depth = -6;
            }
            
            break;
    }
    
    if (global.panic && sprite_index == spr_idle)
        sprite_index = spr_panic;
    
    if (place_meeting(x, y, obj_water))
        sprite_index = spr_swim;
    
    if (obj_player1.state == states.backbreaker)
    {
        var tauntspr = (object_index == obj_pizzakinsecret) ? spr_taunteffect : spr_tinytaunt;
        instance_create(x, y, obj_tinytaunt, 
        {
            sprite_index: tauntspr
        });
        
        if (playerid.in_supertaunt)
        {
            if (sprite_index != spr_supertaunt)
                image_index = 0;
            else if (floor(image_index) >= (image_number - 1))
                image_index = image_number - 1;
            
            sprite_index = spr_supertaunt;
        }
        else if (sprite_index != spr_taunt)
        {
            sprite_index = spr_taunt;
            image_index = irandom(sprite_get_number(spr_taunt) - 1);
        }
        
        state = states.backbreaker;
        lock = true;
    }
}
else
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != spr_intro)
    {
        var s = obj_player1.sprite_index;
        
        if (s == obj_player1.spr_supertaunt1 || s == obj_player1.spr_supertaunt2 || s == obj_player1.spr_supertaunt3 || s == obj_player1.spr_supertaunt4)
        {
            sprite_index = spr_intro;
            image_index = 0;
        }
    }
    
    if (obj_player1.state != states.backbreaker)
    {
        instance_destroy(obj_tinytaunt);
        interp = 0;
        sprite_index = spr_idle;
        lock = false;
        state = states.normal;
    }
}
