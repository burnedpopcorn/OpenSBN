if (!instance_exists(backPanel))
{
    backPanel = instance_create(x, y, obj_solid, 
    {
        sprite_index: spr_boxofpizza,
        image_xscale: image_xscale,
        image_yscale: image_yscale,
        depth: 104,
        visible: true
    });
}
