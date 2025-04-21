function layer_type_get_id(argument0, argument1)
{
    if (layer_exists(argument0))
    {
        var layer_elements = layer_get_all_elements(argument0);
        
        for (var i = 0; i < array_length(layer_elements); i++)
        {
            if (layer_get_element_type(layer_elements[i]) == argument1)
                return layer_elements[i];
        }
    }
    
    return -1;
}

function layer_tilemap_get_id_fixed(argument0)
{
    return layer_type_get_id(argument0, 5);
}

function layer_background_get_id_fixed(argument0)
{
    return layer_type_get_id(argument0, 1);
}

function layer_asset_get_id(argument0)
{
    return layer_type_get_id(argument0, 4);
}

function layer_change_background(argument0, argument1)
{
    if (argument0 != argument1)
    {
        var a = layer_get_all();
        
        for (var i = 0; i < array_length(a); i++)
        {
            var back_id = layer_background_get_id_fixed(a[i]);
            
            if (layer_background_get_sprite(back_id) == argument0)
                layer_background_sprite(back_id, argument1);
        }
    }
}

function layer_get_all_sprites(argument0)
{
    var temp_array = [];
    
    if (layer_exists(argument0))
    {
        var a = layer_get_all_elements(argument0);
        
        for (var i = 0; i < array_length(a); i++)
        {
            if (layer_get_element_type(a[i]) == 4)
                array_push(temp_array, a[i]);
        }
    }
    
    return temp_array;
}
