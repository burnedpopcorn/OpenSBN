if (place_meeting(x, y, obj_player1))
    visited = 1;

if (ds_list_find_index(global.saveroom, id) == -1 && sprite_index != spr_null)
    sprite_index = spr_null;

if (global.snickchallenge == 0)
    instance_destroy();
