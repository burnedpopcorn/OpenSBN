function string_split(argument0, argument1)
{
    argument0 += " ";
    var _current_str = "";
    var _list = [0];
    
    for (var i = 1; i < (string_length(argument0) + 1); i++)
    {
        var _char = string_char_at(argument0, i);
        
        if (_char != argument1)
        {
            _current_str += _char;
        }
        else
        {
            array_push(_list, _current_str);
            _current_str = "";
        }
    }
    
    return _list;
}

function function_overload(array, func)
{
    var _size = array_length(array);
    
    switch (_size - 1)
    {
        case -1:
            func();
            break;
        
        case 0:
            func(array[0]);
            break;
        
        case 1:
            func(array[0], array[1]);
            break;
        
        case 2:
            func(array[0], array[1], array[2]);
            break;
        
        case 3:
            func(array[0], array[1], array[2], array[3]);
            break;
        
        case 4:
            func(array[0], array[1], array[2], array[3], array[4]);
            break;
        
        case 5:
            func(array[0], array[1], array[2], array[3], array[4], array[5]);
            break;
        
        case 6:
            func(array[0], array[1], array[2], array[3], array[4], array[5], array[6]);
            break;
    }
}

function DebugCommand(argument0, argument1, argument2, argument3) constructor
{
    command_id = argument0;
    description = argument1;
    format = argument2;
    func = argument3;
    
    Invoke = function(argument0)
    {
        if (argument0 != undefined)
            function_overload(argument0, func);
        else
            func();
    };
}

// unused
function TextList_Add(argument0, argument1)
{
    with (obj_debugcontroller) { }
}
