if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    
    repeat (4)
        create_debris(x, y, spr_null);
}
