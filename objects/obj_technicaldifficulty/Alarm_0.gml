var _check = (storedState == UnknownEnum.Value_270 || storedState == UnknownEnum.Value_273 || storedState == UnknownEnum.Value_271 || storedState == UnknownEnum.Value_272) ? UnknownEnum.Value_270 : UnknownEnum.Value_2;
use_static = 1;
static_index = sprite_get_number(spr_tvstatic) - 1;
static_dir = -1;
event_play_oneshot("event:/SFX/misc/tvswitchback");

with (playerid)
{
    if (!isgustavo)
        state = _check;
    else
        state = states.ratmount;
    
    visible = true;
    x = roomstartx;
    y = roomstarty;
    landAnim = 0;
}

with (obj_ghostfollow)
{
    x = xstart;
    y = ystart;
}
