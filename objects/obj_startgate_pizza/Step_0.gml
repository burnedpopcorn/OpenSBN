switch (state)
{
    case 0:
        image_index = 8;
        
        if (vsp < 20)
            vsp += 0.5;
        
        y += vsp;
        
        if (y >= y_to)
        {
            y = y_to;
            state++;
            highscorepos = 0;
        }
        
        break;
    
    case 1:
        var cy = camera_get_view_y(view_camera[0]) - (camera_get_view_height(view_camera[0]) / 3);
        var _found = 0;
        
        for (var i = 0; i < array_length(highscore); i++)
        {
            var ty = cy - (i * 64);
            
            if (highscore[i][1] < ty)
                highscore[i][1] = ty;
            
            if (highscore[i][2] < 25)
                highscore[i][2] += grav;
            
            highscore[i][1] += highscore[i][2];
            
            if (highscore[i][1] >= y)
                highscore[i][1] = y;
            else
                _found = 1;
        }
        
        if (!_found)
        {
            state++;
            rank_scale = 2;
        }
        
        break;
    
    case 2:
        rank_scale = approach(rank_scale, 1, 0.1);
        break;
}
