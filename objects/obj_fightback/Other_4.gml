if (instance_exists(obj_hungrypillar))
{
    pillar = instance_nearest(x, y, obj_hungrypillar).id;
    
    if (ds_list_find_index(global.saveroom, pillar) != -1)
    {
        pillar = -4;
        instance_destroy();
    }
}
