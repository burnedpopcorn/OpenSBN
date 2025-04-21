if (!instance_exists(obj_soundtest))
    exit;

if (obj_soundtest.active)
{
    if (sprite_index != dancespr)
    {
        sprite_index = dancespr;
        image_index = 0;
    }
    
    x = xstart + Wave(-100, 100, 5, 20);
}
else
{
    if (sprite_index != idlespr)
    {
        sprite_index = idlespr;
        image_index = 0;
    }
    
    x = approach(x, xstart, 5);
}
