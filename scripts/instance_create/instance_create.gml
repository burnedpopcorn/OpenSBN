function instance_create(argument0, argument1, argument2, argument3)
{
    var _obj = -4;
    
    if (!is_undefined(argument3))
        _obj = instance_create_depth(argument0, argument1, 0, argument2, argument3);
    else
        _obj = instance_create_depth(argument0, argument1, 0, argument2);
    
    return _obj;
}
