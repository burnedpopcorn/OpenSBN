draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var xLeft = x - sprite_get_xoffset(sprite_index);
var yTop = y - sprite_get_yoffset(sprite_index);

if (!surface_exists(surf))
{
    surf = surface_create(sprite_width, sprite_height);
}
else
{
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    
    for (var i = image_number; i > 1; i--)
    {
        var ri = i - 2;
        draw_sprite_tiled(sprite_index, i, bg_x[ri], bg_y[ri]);
    }
    
    draw_set_alpha(fade);
    gpu_set_colorwriteenable(true, true, true, false);
    draw_rectangle(0, 0, sprite_width, sprite_height, false);
    draw_set_alpha(1);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode(bm_subtract);
    draw_sprite(sprite_index, 1, sprite_width / 2, sprite_height);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
}

if (surface_exists(surf))
    draw_surface(surf, xLeft, yTop);

draw_sprite(sprite_index, 0, x, y);
