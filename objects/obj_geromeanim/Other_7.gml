if (sprite_index == spr_gerome_opendoor)
{
    sprite_index = spr_gerome_keymove;
    image_xscale = -obj_player1.xscale;
    hspeed = image_xscale * 6;
    image_speed = 0.35;
}
