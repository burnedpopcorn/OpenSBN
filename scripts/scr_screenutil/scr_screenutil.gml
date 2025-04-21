function surface_prepare_aa(argument0)
{
    var surf_tex = surface_get_texture(argument0);
    var tw = texture_get_texel_width(surf_tex);
    var th = texture_get_texel_height(surf_tex);
    shader_set(shd_aa);
    gpu_set_texfilter(true);
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vTexelSize"), tw, th);
    shader_set_uniform_f(shader_get_uniform(shd_aa, "u_vScale"), window_get_width() / surface_get_width(argument0), window_get_height() / surface_get_height(argument0));
}

function draw_application_surface()
{
    var use_shader = false;
    
    if (frac(scale) > 0 && global.option_texfilter)
    {
        surface_prepare_aa(application_surface);
        use_shader = true;
    }
    
    draw_rectangle_color(-100, -100, savedwidth + 100, savedheight + 100, c_black, c_black, c_black, c_black, false);
    draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
    
    if (use_shader)
        shader_reset();
}

function draw_gui_surface()
{
    if (!surface_exists(gui_surface))
    {
        gpu_set_blendmode(bm_normal);
        exit;
    }
    
    var use_shader = false;
    
    if (frac(scale) > 0 && global.option_texfilter)
    {
        surface_prepare_aa(gui_surface);
        use_shader = true;
    }
    
    draw_surface_ext(gui_surface, 0, 0, 1, 1, 0, c_white, 1);
    
    if (use_shader)
        shader_reset();
}
