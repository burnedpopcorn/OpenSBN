global.levelcomplete = 1;
scr_playerreset();

with (obj_player1)
{
    targetDoor = "HUB";
    targetRoom = backtohubroom;
    room_goto(backtohubroom);
    x = backtohubstartx;
    y = backtohubstarty;
    state = states.comingoutdoor;
    sprite_index = spr_walkfront;
    image_index = 0;
    image_blend = c_white;
}

global.exitrank = 0;
global.leveltorestart = -4;
global.leveltosave = -4;
global.level_minutes = 0;
global.level_seconds = 0;
