if (place_meeting(x, y, obj_player1) && !ds_list_find_index(global.saveroom, id))
    ds_list_add(global.saveroom, id);

if (ds_list_find_index(global.saveroom, id))
    visited = 1;

if (visited == 1 && sprite_index != spr_null)
    sprite_index = spr_doorvisited;

if (john && global.panic)
    sprite_index = spr_null;

if (room == midway_4 || room == midway_3)
    sprite_index = spr_midwaydoor;
