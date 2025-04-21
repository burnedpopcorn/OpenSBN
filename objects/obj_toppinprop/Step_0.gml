mask_index = spr_player_mask;

if (obj_player1.state == states.backbreaker && state != states.backbreaker)
{
    storedstate = state;
    storedsprite = sprite_index;
    state = states.backbreaker;
    instance_create(x, y, obj_tinytaunt);
    sprite_index = tauntspr;
    image_index = irandom(sprite_get_number(tauntspr) - 1);
}

switch (state)
{
    case states.walk:
        sprite_index = movespr;
        var _bbox_side = (image_xscale >= 1) ? bbox_right : bbox_left;
        
        if (place_meeting_collision(x + image_xscale, y, UnknownEnum.Value_1) || place_meeting(x + image_xscale, y, obj_hallway) || !place_meeting_collision(_bbox_side + image_xscale, y + 31))
            image_xscale *= -1;
        
        hsp = image_xscale * 2;
        break;
    
    case UnknownEnum.Value_128:
        sprite_index = idlespr;
        hsp = 0;
        break;
    
    case states.backbreaker:
        hsp = 0;
        vsp = 0;
        
        if (obj_player1.state != states.backbreaker)
        {
            state = storedstate;
            sprite_index = storedsprite;
        }
        
        break;
}

vsp = 0;
scr_collision();
