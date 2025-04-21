if (image_alpha > 0)
{
    with (instance_create(x, y, obj_afterimage))
    {
        sprite_index = other.sprite_index;
        image_xscale = other.image_xscale;
        image_blend = c_red;
    }
}

alarm[1] = 10;
