if (sprite_index != spr_intro)
    event_inherited();

yoffset = 0;

if (!lock)
{
    var fishcheck = sprite_index == spr_swim && place_meeting(playerid.x, playerid.y, obj_water);
    
    if (!fishcheck)
    {
        if (sprite_index == spr_intro && floor(image_index) == (image_number - 1))
            sprite_index = spr_gerome_keyidle;
        else if (sprite_index != spr_intro)
            sprite_index = (x != xprevious) ? spr_gerome_keymove : spr_gerome_keyidle;
    }
    
    if (place_meeting(x, y, obj_water))
        sprite_index = spr_swim;
}

if ((xprevious - x) != 0)
    image_xscale = -sign(xprevious - x);
else if (playerid.hsp == 0)
    image_xscale = playerid.xscale;

if (obj_player1.state == states.backbreaker)
{
    instance_create(x, y, obj_tinytaunt, 
    {
        sprite_index: spr_taunteffect
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
    
    lock = true;
}
else
{
    instance_destroy(obj_tinytaunt);
    lock = false;
}

if (!instance_exists(obj_geromeanim))
{
    visible = (room == rank_room || room == timesuproom) ? false : playerid.visible;
    
    if (obj_player1.state == states.pizzathrow)
        visible = false;
}

image_xscale *= playerid.scale_xs;
image_yscale *= playerid.scale_ys;
