if (!round_timer_init)
{
    round_timer = round_timermax;
    round_timer_init = 1;
}

round_timer--;

if (round_timer <= 0)
{
    round_timer = 0;
    
    if (bell_sprite != spr_bosstimer_hitbell)
    {
        bell_sprite = spr_bosstimer_hitbell;
        bell_index = 0;
    }
    else if (floor(bell_index) == (sprite_get_number(spr_bosstimer_hitbell) - 1) && !instance_exists(obj_fadeout))
    {
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
    }
}

bell_index += 0.35;

if (!instance_exists(bossID) && !bossdead)
{
    bossdead = 1;
    alarm[0] = 150;
    
    with (obj_player1)
    {
        sprite_index = spr_null;
        image_speed = 0.35;
        image_index = 0;
        state = states.arenaintro;
    }
}
