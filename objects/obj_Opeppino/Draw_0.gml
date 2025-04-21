shader_set(shd_mach_afterImage);
var blend_color = shader_get_uniform(shd_mach_afterImage, "u_blendColor");
shader_set_uniform_f(blend_color, color_get_red(omage_blend) / 255, color_get_green(omage_blend) / 255, color_get_blue(omage_blend) / 255);
draw_self();
shader_reset();
