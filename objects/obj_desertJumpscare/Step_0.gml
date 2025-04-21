if (input_check_pressed("jump"))
{
    alarm[1] = -1;
    active = false;
    fmod_event_stop(desertSound, true);
    room_goto(Realtitlescreen);
    instance_destroy();
    scr_init();
}

if (!active)
    exit;

if (oldPlaying && !event_isplaying(desertSound))
    alarm[1] = 20;

var input_check_funny = input_check_pressed("up") || input_check_pressed("down") || input_check_pressed("left") || input_check_pressed("right");

if (input_check_funny)
{
    randomPitch = random_range(0.5, 1.85);
    fmod_event_setTimelinePosition(desertSound, 0);
    event_user(0);
    alarm[1] = -1;
    oldPlaying = false;
}

oldPlaying = event_isplaying(desertSound);
