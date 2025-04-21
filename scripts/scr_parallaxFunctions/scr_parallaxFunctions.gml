global.ParallaxMap = ds_map_create();

function scr_addParallaxLayer(argument0, argument1, argument2 = [])
{
    ds_map_set(global.ParallaxMap, argument0, 
    {
        func: argument1,
        args: argument2
    });
    exit;
}
