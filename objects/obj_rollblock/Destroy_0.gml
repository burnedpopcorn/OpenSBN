if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    ds_list_add(global.saveroom, id);
}

scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
