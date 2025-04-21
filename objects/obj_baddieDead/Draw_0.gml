if (!bbox_in_camera(view_camera[0], 32))
    exit;

shader_set(global.Pal_Shader);
pal_swap_set(spr_palette, paletteselect, 0);
var b = get_dark(image_blend, obj_drawcontroller.use_dark);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
shader_reset();
