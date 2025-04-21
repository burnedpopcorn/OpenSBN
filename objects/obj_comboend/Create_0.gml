combo = global.savedcombo;
comboscore = global.comboscore;
comboscoreMax = global.comboscore;
combominus = 0;
timer_max = 1;
timer = 0;
title = floor(combo / 5);
title_index = 0;
depth = obj_particlesystem.depth - 1;
alarm[0] = 1;
x = 832;
y = 197;
ystart = y;
depth = -300;

with (obj_player1)
{
    if (!place_meeting(x, y, obj_exitgate))
        global.combodropped = 1;
}

if (global.highest_combo < combo)
    global.highest_combo = combo;

if (room == rank_room || room == timesuproom)
    visible = false;
