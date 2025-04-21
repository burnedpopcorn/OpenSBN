function add_secrettiles(argument0)
{
    global.secret_layers = [];
    
    for (var i = 0; i < argument_count; i++)
    {
        var arg = argument[i];
        var layerid = layer_get_id(arg);
        var name = layer_get_name(layerid);
        
        if (layer_exists(argument[i]) && layer_get_visible(argument[i]))
        {
            array_push(global.secret_layers, 
            {
                nm: name,
                alpha: 1,
                surf: -4
            });
        }
        
        layer_set_visible(layerid, false);
    }
    
    var _f = function(argument0, argument1)
    {
        return -(layer_get_depth(argument0.nm) - layer_get_depth(argument1.nm));
    };
    
    array_sort(global.secret_layers, _f);
    return true;
}

function secretDefault()
{
    add_secrettiles("Tiles_Secret1", "Tiles_Secret2", "Tiles_Secret3");
}
