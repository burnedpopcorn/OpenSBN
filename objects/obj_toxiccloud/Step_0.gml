x += hsp;
y += vsp;

if (!disappear && scr_solid(x, y))
    instance_destroy();

if (disappear)
{
    image_xscale = approach(image_xscale, 0, 0.04);
    image_yscale = approach(image_yscale, 0, 0.04);
    hsp = approach(hsp, 0, 0.1);
    vsp = approach(vsp, 0, 0.1);
    
    if (image_xscale == 0)
        instance_destroy();
}
