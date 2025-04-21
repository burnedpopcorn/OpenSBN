if (chance(50))
{
    idlespr = spr_midwaygull_idle;
    flyspr = spr_midwaygull_fly;
}

if (chance(50))
    image_xscale *= -1;

sprite_index = idlespr;
