y = -sprite_height;
down = true;
movespeed = 2;
depth = -100;
event_play_oneshot("event:/sfx/misc/lap2start");

if (room == water_1 || room == water_9)
    sprite_index = spr_lap2_water;
