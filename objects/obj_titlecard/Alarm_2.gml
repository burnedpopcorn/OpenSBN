var len = array_length(tex_arr);

if (len > 0)
{
    var tex = array_pop(tex_arr);
    
    if (!texture_is_ready(tex))
        texture_prefetch(tex);
    
    trace("Loading texture: ", tex);
    alarm[2] = 1;
}
else
{
    alarm[0] = 255;
}
