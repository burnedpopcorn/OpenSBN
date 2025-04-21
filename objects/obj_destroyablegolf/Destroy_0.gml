if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x + 16, y + 16, obj_baddieDead))
        sprite_index = spr_doughblockdead;
    
    scr_sleep(5);
    tile_layer_delete_at(1, x, y);
    ds_list_add(global.saveroom, id);
}
