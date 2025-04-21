for (var i = 0; i < array_length(global.secret_layers); i++)
{
    var a = global.secret_layers[i];
    
    if (layer_exists(global.secret_layers[i].nm))
    {
        if (!surface_exists(a.surf))
        {
            a.surf = surface_create(obj_gameFrame.defaultwidth, obj_gameFrame.defaultheight);
        }
        else
        {
            surface_set_target(a.surf);
            draw_clear_alpha(c_white, 0);
            var tilemap = layer_tilemap_get_id_fixed(global.secret_layers[i].nm);
            draw_tilemap(tilemap, -camera_get_view_x(view_camera[0]), -camera_get_view_y(view_camera[0]));
            surface_reset_target();
            draw_surface_ext(a.surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, a.alpha);
        }
    }
}
