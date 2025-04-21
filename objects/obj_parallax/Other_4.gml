set_layer_depths();
safe_layer_set_depth("Backgrounds_foreground", -90);
safe_layer_set_depth("Backgrounds_foregroundLow", -90);

if (global.panic)
    scr_escapeBackground();

layerNum = 0;
assetNum = 0;
asset_sprites = 0;
layerArray = [];
var a = layer_get_all();
var i = 0;
var z = 0;

while (i < array_length(a))
{
    var back_id = layer_background_get_id_fixed(a[i]);
    
    if (back_id != -1 && layer_get_visible(a[i]))
    {
        layerArray[z++] = 
        {
            id: a[i],
            layerName: layer_get_name(a[i]),
            isBackground: true,
            image_speed: layer_background_get_speed(back_id),
            x: layer_get_x(a[i]),
            y: layer_get_y(a[i]),
            xstart: layer_get_x(a[i]),
            ystart: layer_get_y(a[i]),
            xprevious: layer_get_x(a[i]),
            yprevious: layer_get_y(a[i]),
            hspeed: layer_get_hspeed(a[i]),
            vspeed: layer_get_vspeed(a[i]),
            xShift: global.ScrollOffset * layer_get_hspeed(a[i]),
            yShift: global.ScrollOffset * layer_get_vspeed(a[i])
        };
    }
    
    var asset_id = layer_asset_get_id(a[i]);
    
    if (asset_id != -1 && layer_get_visible(a[i]))
    {
        var q = layer_get_all_sprites(a[i]);
        
        for (var o = 0; o < array_length(q); o++)
        {
            var _parallax_value = undefined;
            
            if (!is_undefined(ds_map_find_value(global.ParallaxMap, array_get(a, i))))
                _parallax_value = ds_map_find_value(global.ParallaxMap, array_get(a, i)).args;
            else if (!is_undefined(ds_map_find_value(global.ParallaxMap, layer_get_name(a[i]))))
                _parallax_value = ds_map_find_value(global.ParallaxMap, layer_get_name(a[i])).args;
            else
                break;
            
            var original_x = layer_sprite_get_x(q[o]);
            var new_x = (original_x - (original_x * _parallax_value[0])) + ((global.CameraViewWidth / 4) * _parallax_value[0]);
            var original_y = layer_sprite_get_y(q[o]);
            var new_y = (original_y - (original_y * _parallax_value[1])) + ((global.CameraViewHeight / 4) * _parallax_value[1]);
            layer_sprite_x(q[o], new_x);
            layer_sprite_y(q[o], new_y);
        }
        
        layerArray[z++] = 
        {
            id: a[i],
            layerName: layer_get_name(a[i]),
            isBackground: false,
            image_speed: 0,
            x: layer_get_x(a[i]),
            y: layer_get_y(a[i]),
            xstart: layer_get_x(a[i]),
            ystart: layer_get_y(a[i]),
            xprevious: layer_get_x(a[i]),
            yprevious: layer_get_y(a[i]),
            hspeed: layer_get_hspeed(a[i]),
            vspeed: layer_get_vspeed(a[i]),
            xShift: global.ScrollOffset * layer_get_hspeed(a[i]),
            yShift: global.ScrollOffset * layer_get_vspeed(a[i])
        };
    }
    
    i++;
}
