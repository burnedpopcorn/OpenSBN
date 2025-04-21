if (room == rm_blank)
{
    mask_index = spr_minipillarwoke;
    exit;
}

if (global.panic == false)
{
    x = -100;
    y = -100;
    sprite_index = spr_minipillarsleep;
    mask_index = spr_minipillarsleep;
}
else
{
    mask_index = spr_minipillarwoke;
    sprite_index = spr_minipillarwoke;
    depth = 0;
    x = xstart;
    y = ystart;
}
