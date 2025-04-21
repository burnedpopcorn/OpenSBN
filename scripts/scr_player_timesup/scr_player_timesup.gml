function state_player_timesup()
{
    xscale = 1;
    inv_frames = 0;
    sprite_index = spr_gameover;
    alarm[7] = -1;
    alarm[8] = -1;
    alarm[5] = -1;
    
    if (place_meeting(x, y, obj_timesup))
    {
        state = states.gameover;
        sprite_index = spr_gameover;
        y = room_height + 100;
        hsp = 0;
        vsp = 0;
        exit;
    }
    
    if (room == timesuproom)
    {
        obj_player1.x = 480;
        obj_player1.y = 270;
        obj_player2.x = -100;
        obj_player2.y = -100;
    }
    
    if (floor(image_index) == (image_number - 1))
        image_speed = 0;
    else
        image_speed = 0.25;
    
    exit;
}
