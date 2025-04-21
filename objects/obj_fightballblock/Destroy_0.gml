if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris(x + 16, y, spr_towerblockdebris);
    
    var lay_id = layer_get_id("Tiles_1");
    var map_id = layer_tilemap_get_id_fixed(lay_id);
    var data = tilemap_get_at_pixel(map_id, x, y);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(map_id, data, x, y);
    lay_id = layer_get_id("Tiles_2");
    map_id = layer_tilemap_get_id_fixed(lay_id);
    data = tilemap_get_at_pixel(map_id, x, y);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(map_id, data, x, y);
    ds_list_add(global.saveroom, id);
}
