depth = -6;
var a = object_index;
global.secret_layers = [];

if (instance_number(a) > 1)
{
    var _first = instance_find(a, 0);
    
    if (id != _first)
    {
        instance_destroy();
        exit;
    }
}

collision_arr = [obj_baddie, obj_twoliterball];
