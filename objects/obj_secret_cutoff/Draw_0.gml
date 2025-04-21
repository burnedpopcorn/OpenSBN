for (var i = 0; i < trueYscale; i++)
{
    var _x = x + lengthdir_x(32 * i, image_angle - 90);
    var _y = y + lengthdir_y(32 * i, image_angle - 90);
    var check_x = _x + lengthdir_x(1, image_angle + ((sign(image_xscale) == -1) ? 180 : 0));
    var check_y = _y + lengthdir_y(1, image_angle + ((sign(image_xscale) == -1) ? 180 : 0));
    
    if (!(place_meeting(check_x, check_y, obj_destructibles) || place_meeting(check_x, check_y, obj_metalblock) || place_meeting(check_x, check_y, obj_tiledestroy)) && place_meeting_collision(_x, _y))
    {
        draw_sprite_ext(sprite_index, imageIndexArray[i], _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
        draw_sprite_ext(spr_secretTile_cutoffLight, imageIndexArray[i], _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
    }
}
