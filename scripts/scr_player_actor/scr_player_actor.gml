function state_player_actor()
{
    cutscene = 1;
    movespeed = 0;
    var _room_x = 0;
    var _room_y = 0;
    var _room_w = room_width;
    var _room_h = room_height;
    
    if (float)
    {
        hsp = 0;
        vsp = 0;
    }
    
    x = clamp(x, _room_x, _room_w);
    y = clamp(y, _room_y, _room_h);
    exit;
}
