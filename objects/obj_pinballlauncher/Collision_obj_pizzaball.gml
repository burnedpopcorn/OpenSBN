with (other)
{
    image_xscale = other.image_xscale;
    scr_pizzaball_go_to_thrown(12 * image_xscale, 0, 0);
    other.image_index = 0;
    other.sprite_index = spr_null;
    var _max = 46;
    y = other.y - _max;
    
    if (place_meeting(x, y, obj_platform))
        y--;
    
    if (scr_solid(x, y))
    {
        for (var i = 0; i <= _max; i++)
        {
            if (scr_solid(x, y))
                x += xscale;
        }
    }
    
    if (scr_solid(x, y))
    {
        for (var i = 0; i <= _max; i++)
        {
            if (scr_solid(x, y))
                y++;
        }
    }
}
