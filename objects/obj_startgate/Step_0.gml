drawing = place_meeting(x, y, obj_player1);
fade = (distance_to_object(obj_player1) - 50) / 250;

for (var i = image_number; i > 1; i--)
{
    var ri = i - 2;
    bg_x[ri] += bg_xscroll[ri];
    bg_y[ri] += bg_yscroll[ri];
}

if (!pizza && highscore > 0 && bbox_in_camera(view_camera[0]) && distance_to_object(obj_player1) < 150)
{
    pizza = 1;
    
    with (instance_create(x, y - camera_get_view_height(view_camera[0]), obj_startgate_pizza))
    {
        y_to = other.y - (other.sprite_height / 2) - 100;
        highscore = [];
        highscorepos = 0;
        var s = string(other.highscore);
        
        for (var i = 1; i <= string_length(s); i++)
        {
            var c = string_char_at(s, i);
            array_push(highscore, [c, 0, 0]);
        }
        
        switch (other.rank)
        {
            case "p":
                rank_index = 5;
                break;
            
            case "s":
                rank_index = 4;
                break;
            
            case "a":
                rank_index = 3;
                break;
            
            case "b":
                rank_index = 2;
                break;
            
            case "c":
                rank_index = 1;
                break;
            
            default:
                rank_index = 0;
                break;
        }
    }
}
