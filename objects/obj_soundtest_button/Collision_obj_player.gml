if (!instance_exists(obj_uparrow))
{
    var p = other;
    
    with (instance_create(p.x, p.y, obj_uparrow))
        playerid = p.object_index;
}

if (input_check_pressed("up"))
{
    image_index = 1;
    
    if (pressBuffer <= 0 && !is_undefined(onPress))
    {
        onPress();
        pressBuffer = 8;
    }
}
