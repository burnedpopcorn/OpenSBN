depth = -100;
image_speed = 0.35;
sprite = -4;
static_index = 0;
static_max = 15;
static_dir = 1;
use_static = 1;
playerid = obj_player1;
alarm[0] = 80;
event_play_oneshot("event:/SFX/misc/tvswitch");

with (obj_player1)
    state = states.actor;

storedState = states.normal;
