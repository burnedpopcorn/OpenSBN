function animation_end(argument0 = floor(image_index), argument1 = image_number - 1)
{
    return argument0 >= argument1;
}

function string_extract(argument0, argument1, argument2)
{
    var len = string_length(argument1) - 1;
    
    repeat (argument2)
        argument0 = string_delete(argument0, 1, string_pos(argument1, argument0) + len);
    
    argument0 = string_delete(argument0, string_pos(argument1, argument0), string_length(argument0));
    return argument0;
}

function string_get_split(argument0, argument1)
{
    var slot = 0;
    var splits = [];
    var str2 = "";
    
    for (var i = 1; i < (string_length(argument0) + 1); i++)
    {
        var currStr = string_char_at(argument0, i);
        
        if (currStr == argument1)
        {
            if (str2 != "")
            {
                splits[slot] = str2;
                slot++;
            }
            
            str2 = "";
        }
        else
        {
            str2 = str2 + currStr;
            splits[slot] = str2;
        }
    }
    
    if (str2 == "")
        splits[slot] = str2;
    
    return splits;
}

function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
    gpu_set_fog(true, argument7, 0, 1);
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
    gpu_set_fog(false, c_black, 0, 0);
    exit;
}

function string_find(argument0, argument1)
{
    return string_pos(argument0, argument1) != 0;
}

function string_find_begin(argument0, argument1)
{
    return string_pos(argument0, argument1) == 1;
}

function string_find_end(argument0, argument1)
{
    return string_pos(argument0, argument1) == ((string_length(argument1) - string_length(argument0)) + 1);
}

function array_contains_any(argument0, argument1)
{
    for (var i = 0; i < array_length(argument1); i++)
    {
        if (array_contains(argument0, argument1[i]))
            return true;
    }
    
    return false;
}
