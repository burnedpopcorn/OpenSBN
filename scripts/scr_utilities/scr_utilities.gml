function chance(argument0)
{
    return irandom(99) <= argument0;
}

function approach(argument0, argument1, argument2)
{
    return argument0 + clamp(argument1 - argument0, -argument2, argument2);
}

function max_volume()
{
    return lerp(0, 0.85, global.option_music_volume);
}

function real_volume()
{
    return lerp(0, 0.85, global.option_music_volume) * VinylKnobGet("pillarfade");
}

function bump_wall(argument0 = hsp)
{
    return place_meeting_collision(x + argument0, y, Exclude.SLOPES) && (!groundedSlope || place_meeting_collision(x + sign(argument0), bbox_top, Exclude.SLOPES));
}

function try_solid(argument0, argument1, argument2, argument3)
{
    var old_x = x;
    var old_y = y;
    var n = -1;
    
    for (var i = 0; i < argument3; i++)
    {
        x += argument0;
        y += argument1;
        
        if (!scr_solid(x, y))
        {
            n = i + 1;
            break;
        }
    }
    
    x = old_x;
    y = old_y;
    return n;
}

function ledge_bump(argument0)
{
    return slope_check_up(x, y, argument0);
}

function instance_create_unique(argument0, argument1, argument2)
{
    if (instance_exists(argument2))
        return -4;
    
    var b = instance_create(argument0, argument1, argument2);
    return b;
}

function get_solid_difference(argument0, argument1, argument2)
{
    var old_x = x;
    var old_y = y;
    var n = 0;
    
    for (i = 0; i < argument2; i++)
    {
        x += argument0;
        y += argument1;
        
        if (!scr_solid(x, y))
            n++;
    }
    
    x = old_x;
    y = old_y;
    return n;
}

function trace()
{
    if (!global.DebugMode)
    {
        exit;
    }
    else
    {
        var _string = "";
        
        for (var i = 0; i < argument_count; i++)
            _string += string(argument[i]);
        
        show_debug_message(_string);
    }
    
    exit;
}

function concat()
{
    var _string = "";
    
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i]);
    
    return _string;
}

function ds_list_add_unique(argument0)
{
    if (argument_count > 1)
    {
        for (var i = 1; i < argument_count; i++)
        {
            var b = argument[i];
            
            if (ds_list_find_index(argument0, b) == -1)
                ds_list_add(argument0, b);
        }
    }
}

function instance_nearest_random(argument0, argument1)
{
    var l = instance_furthest(x, y, argument0);
    var list = ds_list_create();
    
    for (i = 0; i < instance_number(argument0); i++)
    {
        b = instance_find(argument0, i);
        var t = distance_to_object(b);
        
        if (t <= l)
            ds_list_add(list, b);
    }
    
    var b = undefined;
    
    if (ds_list_size(list) > 0)
    {
        var n = irandom(argument1);
        
        if (ds_list_size(list) < n)
            n = ds_list_size(list) - 1;
        
        b = ds_list_find_value(list, ds_list_size(list) - n);
    }
    
    ds_list_destroy(list);
    return b;
}

function instance_random(argument0)
{
    return instance_find(argument0, irandom(instance_number(argument0) - 1));
}

function in_ds_list(argument0, argument1)
{
    return ds_list_find_index(argument1, argument0) != -1;
}

function in_array(argument0, argument1)
{
    var _length = array_length(argument0);
    
    for (var i = 0; i < _length; i++)
    {
        if (argument0[i] == argument1)
            return true;
    }
    
    return false;
}

function number_in_range(argument0, argument1, argument2)
{
    if (argument0 >= argument1 && argument0 <= argument2)
        return true;
    
    return false;
}

function heat_calculate(argument0)
{
    return argument0;
}

function get_milliseconds()
{
    return get_timer() / 1000;
}
