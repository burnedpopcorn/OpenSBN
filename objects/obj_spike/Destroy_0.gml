if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris(x + 16, y, spr_towerblockdebris);
    
    tile_layer_delete_at(1, x, y);
    event_play_oneshot("event:/SFX/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
