if (activeRoom)
{
    draw_set_alpha(0.5);
    draw_sprite_tiled(spr_effectCRT, 0, 0, 0);
    draw_set_alpha(0.25);
    draw_sprite_tiled(spr_effectScanblock, 0, 0, scanblock_y);
    draw_set_alpha(1);
}
