function defaultParallax(argument0, argument1)
{
    x += (camera_get_view_x(view_camera[0]) * argument0);
    y += (camera_get_view_y(view_camera[0]) * argument1);
}

function defaultParallaxZigZag(argument0, argument1, argument2, argument3)
{
    x += (camera_get_view_x(view_camera[0]) * argument0);
    y += (camera_get_view_y(view_camera[0]) * argument1);
    x += Wave(-argument2, argument2, 4, 10);
    y += Wave(-argument3, argument3, 4, 10);
}

function defaultParallaxGround(argument0, argument1)
{
    var bg_sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
    var bg_sprite_height = sprite_exists(bg_sprite) ? sprite_get_height(bg_sprite) : 0;
    x += (camera_get_view_x(view_camera[0]) * argument0);
    y += (room_height - bg_sprite_height);
}

function defaultParallaxH(argument0, argument1)
{
    var bg_sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
    var bg_sprite_height = sprite_exists(bg_sprite) ? sprite_get_height(bg_sprite) : 0;
    x += (camera_get_view_x(view_camera[0]) * argument0);
    y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * argument1 * (camera_get_view_height(view_camera[0]) / room_height), 0, bg_sprite_height - camera_get_view_height(view_camera[0])));
}

function defaultParallaxV(argument0, argument1)
{
    var bg_sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
    var bg_sprite_width = sprite_exists(bg_sprite) ? sprite_get_width(bg_sprite) : 0;
    x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * argument0 * (camera_get_view_width(view_camera[0]) / room_width), 0, bg_sprite_width - camera_get_view_width(view_camera[0])));
    y += (camera_get_view_y(view_camera[0]) * argument1);
}

function defaultParallaxFar(argument0, argument1)
{
    var bg_sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
    var bg_sprite_width = sprite_exists(bg_sprite) ? sprite_get_width(bg_sprite) : 0;
    var bg_sprite_height = sprite_exists(bg_sprite) ? sprite_get_height(bg_sprite) : 0;
    x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * argument0 * (camera_get_view_width(view_camera[0]) / room_width), 0, bg_sprite_width - camera_get_view_width(view_camera[0])));
    y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * argument1 * (camera_get_view_height(view_camera[0]) / room_height), 0, bg_sprite_height - camera_get_view_height(view_camera[0])));
}
