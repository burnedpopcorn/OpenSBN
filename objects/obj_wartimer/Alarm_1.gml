if (room != rank_room)
{
    instance_destroy(obj_fadeout);
    
    with (obj_player1)
    {
        targetDoor = "A";
        room_goto(timesuproom);
        state = states.timesup;
        sprite_index = spr_Timesup;
        image_index = 0;
        stop_music();
        event_play_oneshot("event:/music/timesup", x, y);
    }
    
    instance_create(0, 0, obj_timesupwar);
    instance_destroy();
}
