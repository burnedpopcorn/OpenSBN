if (global.redcoin > 0)
{
    var timer_factor = (global.RedCoinMax - global.redcoin) / global.RedCoinMax;
    var shake_factor = timer_factor * 2;
    var meter = sprite_height * timer_factor;
    var _x = playerID.x + random_range(-shake_factor, shake_factor);
    var _y = (playerID.y - 95) + random_range(-shake_factor, shake_factor);
    draw_sprite_part_ext(spr_redCoinClockFill, -1, 0, meter, sprite_width, sprite_height, playerID.x - 31, (_y + meter) - 36, 1, 1, c_white, 1);
    draw_sprite_ext(sprite_index, -1, _x, _y, 1, 1, 0, c_white, 1);
}
