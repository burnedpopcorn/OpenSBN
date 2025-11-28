global.ScrollOffset++;

for (var i = 0; i < array_length(layerArray); i++)
{
    if (layerArray[i] != undefined)
    {
        with (layerArray[i])
        {
            x = xstart;
            y = ystart;
            x += xShift;
            y += yShift;
            
            if (!is_undefined(global.ParallaxMap[? id]))
                script_execute_ext(global.ParallaxMap[? id].func, global.ParallaxMap[? id].args);
            else if (!is_undefined(global.ParallaxMap[? layerName]))
                script_execute_ext(global.ParallaxMap[? layerName].func, global.ParallaxMap[? layerName].args);
            
            xShift += hspeed;
            yShift += vspeed;
            xprevious = layer_get_x(id);
            yprevious = layer_get_y(id);
            layer_x(id, x);
            layer_y(id, y);
            layer_background_speed(layer_background_get_id_fixed(id), image_speed);
        }
    }
}
