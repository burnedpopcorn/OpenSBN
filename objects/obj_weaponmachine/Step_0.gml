if (place_meeting(x, y + 1, obj_player1) && obj_player1.vsp < 0 && global.pizzacoin >= 4 && image_speed == 0)
{
    global.pizzacoin -= 4;
    image_speed = 0.35;
    
    if (global.snickchallenge == 1)
        global.SAGEshotgunsnicknumber += 1;
}
