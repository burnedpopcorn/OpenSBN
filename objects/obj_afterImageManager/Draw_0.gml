for (var i = 0; i < ds_list_size(global.AfterImageList); i++)
{
    with (ds_list_find_value(global.AfterImageList, i))
    {
        if (visible)
        {
			// if normal, solid color afterimages
            if (afterImageType >= afterimage.mach3effect)
            {
                shader_set(shd_afterimage);
                var color_blend_1 = shader_get_uniform(shd_afterimage, "blendcolor1");
                var color_blend_2 = shader_get_uniform(shd_afterimage, "blendcolor2");
                shader_set_uniform_f(color_blend_1, color_get_red(image_blend.light[afterImageIndex]) / 255, color_get_green(image_blend.light[afterImageIndex]) / 255, color_get_blue(image_blend.light[afterImageIndex]) / 255);
                shader_set_uniform_f(color_blend_2, color_get_red(image_blend.dark[afterImageIndex]) / 255, color_get_green(image_blend.dark[afterImageIndex]) / 255, color_get_blue(image_blend.dark[afterImageIndex]) / 255);
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, fadingAlpha * image_alpha);
                shader_reset();
            }
			// if afterimages.none or heatattack_blur (and if palettes are available), apply palette
            else if (instance_exists(ownerID) && variable_instance_exists(ownerID, "spr_palette"))
            {
                shader_set(global.Pal_Shader);
                pal_swap_set(ownerID.spr_palette, ownerID.paletteselect, 0);
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, fadingAlpha * image_alpha);
                pal_swap_reset();
            }
            else
            {
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, fadingAlpha * image_alpha);
            }
        }
    }
}
