function getRPGMulti(argument0)
{
    if (!global.option_secret_rpg)
        return 1;
    
    var multi = 1;
    
    if (!instance_exists(obj_rpg))
        instance_create(0, 0, obj_rpg);
    
    var val = ds_map_find_value(global.rpgStats, argument0);
    
    if (!is_undefined(val))
        multi = val;
    
    return multi;
}
