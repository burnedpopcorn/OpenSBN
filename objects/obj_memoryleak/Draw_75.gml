for (var i = 0; i < array_length(slopArr); i++)
{
    var sprArr = slopArr[i];
    
    if (!sprite_exists(sprArr[0]))
        continue;
    
    draw_sprite(sprArr[0], random_range(0, sprArr[1]), sprArr[2], sprArr[3]);
    
    for (var j = 0; j < array_length(surfArr); j++)
    {
        if (!surface_exists(surfArr[j]))
            continue;
        
        surface_set_target(surfArr[j]);
        draw_sprite(sprArr[0], random_range(0, sprArr[1]), sprArr[2], sprArr[3]);
        surface_reset_target();
    }
}
