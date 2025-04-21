function scr_destroy_destructibles(argument0, argument1, argument2 = obj_destructibles)
{
    if (!place_meeting(x + argument0, y + argument1, argument2))
        exit;
    
    var _num = instance_place_list(x + argument0, y + argument1, argument2, global.instancelist, false);
    var _destroy = false;
    
    if (_num > 0)
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
        {
            var inst = ds_list_find_value(global.instancelist, i);
            instance_destroy(inst);
        }
    }
    
    ds_list_clear(global.instancelist);
}
