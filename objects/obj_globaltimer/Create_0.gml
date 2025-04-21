if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

timer = get_milliseconds();
global.file_minutes = 0;
global.file_seconds = 0;
global.level_minutes = 0;
global.level_seconds = 0;
depth = -600;

makeString = function(argument0, argument1)
{
    var s_str = "";
    var m_str = "";
    var mm = frac(argument1);
    mm = string(mm);
    mm = string_copy(mm, 3, string_length(mm) - 3);
    
    while (string_length(mm) < 1)
        mm += "0";
    
    while (string_length(mm) > 2)
        mm = string_delete(mm, string_length(mm), 1);
    
    var sd = floor(argument1);
    
    if (sd < 10)
        s_str = concat(0, sd);
    else
        s_str = string(sd);
    
    argument0 = floor(argument0);
    var hours;
    
    for (hours = 0; argument0 > 59; hours++)
        argument0 -= 60;
    
    if (argument0 < 10)
        m_str = concat(0, argument0);
    else
        m_str = string(argument0);
    
    if (hours < 10)
        hours = concat(0, hours);
    else
        hours = string(hours);
    
    return string("{0}:{1}:{2}.{3}", hours, m_str, s_str, mm);
};
