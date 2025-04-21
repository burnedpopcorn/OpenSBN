x = playerID.x;
y = playerID.y;

if (global.stylethreshold < 2)
    visible = false;
else
    visible = playerID.visible;

if (room == rank_room)
    visible = false;

if (global.stylethreshold == 2)
    alpha = 0.25;
else if (global.stylethreshold == 3)
    alpha = 0.5;

vSpeed = random_range(-1, 1);
Hspeed = random_range(-1, 1);
alarm[0] = 10;
