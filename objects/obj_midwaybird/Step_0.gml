if (!trigger)
{
    if (distance_to_object(obj_player1) <= triggerdistance)
    {
        if (x < obj_player1.x)
            image_xscale = -1;
        else
            image_xscale = 1;
        
        trigger = true;
        sprite_index = flyspr;
        vsp = random_range(-2, -6);
        var minhsp = min(6 * image_xscale, 14 * image_xscale);
        var maxhsp = max(6 * image_xscale, 14 * image_xscale);
        hsp = random_range(minhsp, maxhsp);
    }
}
else
{
    x += hsp;
    y += vsp;
}
