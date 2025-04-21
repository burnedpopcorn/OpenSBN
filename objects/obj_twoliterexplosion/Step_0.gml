if (image_index > 6)
{
    mask_index = spr_masknull;
}
else
{
    with (instance_place(x, y, obj_destructibles))
    {
        if (object_index != obj_onewaybigblock)
            instance_destroy();
    }
    
    instance_destroy(instance_place(x, y, obj_metalblock));
    instance_destroy(instance_place(x, y, obj_ratblock));
}
