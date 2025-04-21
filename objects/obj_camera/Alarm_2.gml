if (global.timedgate == 1)
{
    global.timedgate = 0;
    global.seconds = 30;
    ded = 0;
    alarm[2] = -1;
}

if (global.miniboss == true)
{
    with (obj_player1)
    {
        instance_create(x, y, obj_bangeffect);
        
        repeat (6)
            instance_create(x, y, obj_slapstar);
        
        state = states.ejected;
        vsp = -10;
        stop_music();
        event_play_oneshot("event:/music/timesup", x, y);
    }
    
    alarm[2] = -1;
    global.miniboss = false;
}
