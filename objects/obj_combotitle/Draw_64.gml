if (!global.option_hud)
    exit;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha);

if (beyond)
    draw_sprite(spr_combobeyond, 0, x - 65, y - 6);
