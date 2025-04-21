if (global.bobbydead)
{
    if (ds_list_find_index(global.baddieroom, id) == -1)
        ds_list_add(global.baddieroom, id);
    
    with (instance_create(global.bobby_x, global.bobby_y, obj_bobbycorpse, 
    {
        sprite_index: spr_bobby_corpse,
        fresh: false
    }))
        event_perform(ev_other, ev_room_start);
}
else
{
    global.bobby_x = x;
    global.bobby_y = y;
}

event_inherited();
