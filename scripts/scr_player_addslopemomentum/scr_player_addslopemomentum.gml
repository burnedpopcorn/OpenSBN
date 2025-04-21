function scr_playerAddSlopeMomentum(argument0, argument1)
{
    if (place_meeting_slope(x, y + 1, false))
    {
        with (instance_place(x, y + 1, obj_slope))
        {
            if (sign(image_xscale) == -sign(other.xscale))
            {
                if (abs(image_yscale) < abs(image_xscale))
                    other.movespeed += (argument0 * getRPGMulti("movespeed"));
                else
                    other.movespeed += (argument1 * getRPGMulti("movespeed"));
            }
        }
        
        exit;
    }
    
    if (place_meeting_slopePlatform(x, y + 1))
    {
        with (instance_place(x, y + 1, obj_slopePlatform))
        {
            if (sign(image_xscale) == -sign(other.xscale))
            {
                if (abs(image_yscale) < abs(image_xscale))
                    other.movespeed += (argument0 * getRPGMulti("movespeed"));
                else
                    other.movespeed += (argument1 * getRPGMulti("movespeed"));
            }
        }
        
        exit;
    }
}

function scr_pizzaball_addslopemomentum(argument0, argument1)
{
    var _check = -4;
    
    if (place_meeting_slope(x, y + 1, false) && !instance_exists(_check))
    {
        with (instance_place(x, y + 1, obj_slope))
            _check = id;
    }
    
    if (place_meeting_slopePlatform(x, y + 1) && !instance_exists(_check))
    {
        with (instance_place(x, y + 1, obj_slopePlatform))
            _check = id;
    }
    
    if (!instance_exists(_check))
        exit;
    
    with (_check)
    {
        if (sign(image_xscale) == -sign(other.image_xscale))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.slopespeed += argument0;
            else
                other.slopespeed += argument1;
        }
        else if (abs(image_yscale) < abs(image_xscale))
        {
            other.slopespeed -= argument0;
        }
        else
        {
            other.slopespeed -= argument1;
        }
    }
    
    if (slopespeed < 0)
        slopespeed = 0;
    
    if (slopespeed > 10)
        slopespeed = 10;
    
    if (movespeed < 1)
        slopespeed = 0;
    
    exit;
}
