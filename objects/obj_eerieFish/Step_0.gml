if (!trigger)
{
    if (distance_to_object(obj_player1) <= triggerdistance)
    {
        if (x < obj_player1.x)
            image_xscale = -1;
        else
            image_xscale = 1;
        
        trigger = true;
        vsp = random_range(6, -3);
        var minhsp = min(3 * image_xscale, 6 * image_xscale);
        var maxhsp = max(3 * image_xscale, 6 * image_xscale);
        hsp = random_range(minhsp, maxhsp);
    }
}
else
{
    x += hsp;
    y += vsp;
    
    if (!place_meeting(x, y + (4 * vsp), obj_water))
        vsp = 0;
    
    if (distance_to_object(obj_water) > 32)
        instance_destroy();
    
    if (point_distance(x, y, xstart, ystart) < 32)
        exit;
    
    if (place_meeting(x - (32 * sign(hsp)), y - (32 * sign(vsp)), obj_solid))
        instance_destroy();
}
